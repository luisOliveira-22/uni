import random

class Agent:
    def __init__(self):
        self.initialized = False
        self.map_size = None    
        self.obstacles = []     # List of tuples representing obstacle positions
        self.foods = set()      # Set of tuples representing normal food positions
        self.superfoods = set() # Set of tuples representing superfood positions
        self.body = [(0, 0)]    # List of tuples representing the snake's body
        self.other_snakes = []  # List of tuples representing other snakes
        self.is_multiplayer = False
        self.steps = 0
        self.sight_range = 3
        self.traverse = False   # Flag indicating whether wrapping is enabled
        self.ds = []            # Direction sequence (list of actions)
        self.dsi = 0            # Current index in direction sequence
        self.lmove = "d"        # Last move direction
        self.cached_paths = {}  # Cache for A* paths
        self.tail = [(0,0),(1,1)] # Initial tail positions
    
    ### State Processing Methods ###
    
    def initial_state(self, state):
        """
        Processes the initial state received from the game.
        Extracts static information such as map size, obstacles, and foods.
        """
        self.map_size = (state["size"][0], state["size"][1])  # Extract map size
        
        game_map = state["map"]  # Extract the static map

        # Process the static map
        for x, row in enumerate(game_map):
            for y, value in enumerate(row):
                position = (x, y)
                if value == 1:  # Obstacle
                    self.obstacles.append(position)
                elif value == 2:  # Normal Food
                    self.foods.add(position)
                elif value == 3:  # Superfood
                    self.superfoods.add(position)

        self.initialized = True
    
    def update_info(self, state):
        """
        Updates the map information based on the state received.
        """
        sight = state.get("sight", {})
        self.other_snakes = []
        for x, row in sight.items():
            for y, value in row.items():
                x, y = int(x), int(y)

                if value == 2:      # Normal Food
                    self.foods.add((x, y))
                elif value == 3:    # Superfood
                    self.superfoods.add((x, y))
                elif value == 4:    # Snake Bodies in sight
                    if not self.is_multiplayer and (x,y) not in self.body:
                        self.is_multiplayer = True
                    else:
                        self.other_snakes.append((x,y))

        # Update step count and sight range
        if state.get("step"):
            self.steps = state.get("step")

        if state.get("range"):
            self.sight_range = state.get("range")

        # Handle traverse flag change
        if state.get("traverse") != self.traverse:
            self.traverse = not self.traverse
            self.clear_sequence()
            self.get_directions()

        # Update body positions
        if state.get("body"):
            self.body = list(map(tuple, state.get("body", [])))
            self.tail[:-1] += self.body[-1]

        self.update_food_sets()

    def update_food_sets(self):
        """
        Removes food or superfood from sets if the snake's head moves through them.
        """
        head_position = self.body[0]

        if head_position in self.foods:
            self.foods.remove(head_position)    # Remove normal food if eaten
        elif head_position in self.superfoods:
            self.superfoods.remove(head_position)   # Remove superfood if eaten

    ### Scouting Methods ###
    
    def scout_map(self):
        """
        Scouts the map based on the traverse flag.
        - If traverse == True: Perform a horizontal sweep with wrapping.
        - If traverse == False: Perform a systematic row-by-row scouting without wrapping.
        """
        if self.traverse:
            # -------------------- WRAP-AROUND SCOUTING --------------------
            actions = []
            horizontal_steps = max(1, self.map_size[0] - self.sight_range)
            vertical_shift   = max(1, self.sight_range + 2)
            num_sweeps = max(1, round(self.map_size[1] / (self.sight_range * 2)))

            for _ in range(num_sweeps):
                actions += ["d"] * horizontal_steps
                actions += ["s"] * vertical_shift

        else:
            # -------------- NORMAL (NO-WRAP) ROW-BY-ROW SCOUT --------------
            actions = []
            moves_right = True
            rows_covered = 0

            while rows_covered < self.map_size[1]:
                # Determine horizontal movement direction
                horizontal_move = "d" if moves_right else "a"
                steps_this_row = self.map_size[0] - 1

                for _ in range(steps_this_row):
                    if self.is_scout_step_safe(horizontal_move, actions):
                        actions.append(horizontal_move)
                    else:
                        # If blocked, stop moving horizontally
                        break

                # Attempt to move down
                if rows_covered < self.map_size[1] - 1:
                    if self.is_scout_step_safe("s", actions):
                        actions.append("s")
                        rows_covered += 1
                    else:
                        # Can't move down; stop scouting
                        break

                # Switch direction for next row
                moves_right = not moves_right

                if rows_covered >= self.map_size[1]:
                    break

        self.ds = actions  
        self.dsi = 0

    def is_scout_step_safe(self, direction, planned_moves):
        """
        Checks if performing `direction` after `planned_moves` is safe.
        Simulates the position and ensures no collisions or boundary breaches.
        """
        # Simulate final head position after planned_moves
        simulated_head = self.simulate_position(self.body[0], planned_moves)

        # Apply the new direction
        new_x, new_y = self.result([simulated_head], direction)

        # Check bounds and obstacles
        if not (0 <= new_x < self.map_size[0] and 0 <= new_y < self.map_size[1]):
            return False
        if (new_x, new_y) in self.obstacles:
            return False

        return True

    def simulate_position(self, start_pos, moves):
        """
        Simulates the snake's head position after applying a sequence of moves.
        """
        x, y = start_pos
        for move in moves:
            x, y = self.result([(x, y)], move)
        return (x, y)
    
    ### Food Pathfinding Methods ###
    
    def get_food_path(self, food_set):
        """
        Sets the direction sequence to reach the nearest food in `food_set`.
        """
        if not food_set:
            return

        head = tuple(self.body[0])
        nearest_food = min(food_set, key=lambda food: self.heuristic(self.body, food))
        cache_key = (head, nearest_food)

        if cache_key in self.cached_paths:
            actions = self.cached_paths[cache_key]
        else:
            actions = self.astar(nearest_food)
            if actions:
                self.cached_paths[cache_key] = actions

        if actions:
            self.ds = actions
            self.dsi = 0

    ### Main Decision Making Method ###
    
    def next_move(self, state):
        """
        Decides the next move based on the current state.
        Follows the decision chain:
          - Normally: Chase normal food.
          - If traverse == False: Chase superfood, then normal food.
          - During steps [1000..1100] and [2000..2100]: Prioritize superfood and normal food.
        """
        self.process_info(state)

        # -------------------- IMMEDIATE FOOD CHASING --------------------
        # If any normal food is visible, prioritize it immediately.
        if self.foods:
            self.clear_sequence()
            self.get_food_path(self.foods)

        # -------------------- MAIN DECISION CHAIN --------------------
        if not self.ds:
            self.get_directions()

        # -------------------- EXECUTE NEXT MOVE --------------------
        if self.ds and self.dsi < len(self.ds):
            direction = self.ds[self.dsi]
            self.dsi += 1
        else:
            # Path completed or empty; choose a new direction
            self.clear_sequence()
            self.get_directions()
            direction = self.ds[self.dsi] if self.ds else self.lmove
            self.dsi += 1

        # -------------------- SAFETY CHECK --------------------
        if not self.ds or not self.is_safe(direction, safety_check=True):
            self.clear_sequence()
            safe_moves = self.get_safe_action()
            if not safe_moves:
                return ""
            direction = safe_moves[0]

        # -------------------- FINALIZE MOVE --------------------
        self.lmove = direction
        return direction

    def get_directions(self):
        """
        Determines the next set of directions based on the current state.
        Follows the specified decision chain.
        """
        self.clear_sequence()

        # Condition A: Steps within [1000..1100] or [2000..2100]
        if (1000 < self.steps < 1100) or (2000 < self.steps < 2100):
            # 1) Prioritize superfood
            if self.superfoods:
                self.get_food_path(self.superfoods)
            # 2) Else prioritize normal food
            elif self.foods:
                self.get_food_path(self.foods)
            # 3) Else scout
            else:
                self.scout_map()
        else:
            # Condition B: Normal decision chain
            # 1) Prioritize normal food
            if self.foods:
                self.get_food_path(self.foods)
            # 2) If traverse == False, prioritize superfood
            elif not self.traverse and self.superfoods:
                self.get_food_path(self.superfoods)
            # 3) If traverse == True and steps > 3000, prioritize superfood
            elif self.traverse and self.superfoods and (self.steps > 3000):
                self.get_food_path(self.superfoods)
            # 4) Else scout
            else:
                self.scout_map()

    def get_safe_action(self):
        """
        Returns a list of all safe actions from the current position.
        """
        return self.actions(self.body, self.lmove)

    def process_info(self, state):
        """
        Processes the incoming state and updates internal data structures.
        """
        if self.initialized:
            self.update_info(state)
        else:
            self.initial_state(state)

    ### Utility Methods ###
    
    def clear_sequence(self):
        """
        Clears the current direction sequence and resets the index.
        """
        self.ds = []
        self.dsi = 0
    
    def is_safe(self, action, body=None, lmove=None, safety_check=False):
        """
        Determines if performing `action` is safe:
          - Prevents reversing direction.
          - Checks for collisions with obstacles and other snakes.
          - Respects map boundaries based on the traverse flag.
        """
        body = self.body if body is None else body
        if not body:
            return True

        new_x, new_y = self.result(body, action)

        # Prevent reversing direction
        if lmove:
            opposite_move = {"w": "s", "s": "w", "a": "d", "d": "a"}
            if lmove == opposite_move.get(action, ""):
                return False

        if self.traverse:
            # Wrapping mode
            new_position = (new_x % self.map_size[0], new_y % self.map_size[1])
            if self.is_multiplayer and safety_check:
                if new_position in self.other_snakes:
                    return False
            if new_position in body:
                return False
        else:
            # No wrapping: must stay within bounds
            if not (0 <= new_x < self.map_size[0] and 0 <= new_y < self.map_size[1]):
                return False
            new_position = (new_x, new_y)
            if self.is_multiplayer and safety_check:
                if new_position in self.other_snakes:
                    return False
            if new_position in body or new_position in self.obstacles:
                return False

        return True

    ### Search (A*) Methods ###
    
    def actions(self, body, lmove=None):
        """
        Returns a list of possible safe actions ('w', 'a', 's', 'd') from the current state.
        """
        valid_moves = []
        for act in "wasd":
            if self.is_safe(act, body, lmove):
                valid_moves.append(act)
        return valid_moves

    def result(self, body, action):
        """
        Given the current head position and an action, returns the new head position.
        """
        head_x, head_y = body[0]
        if action == "w":
            return (head_x, head_y - 1)
        elif action == "a":
            return (head_x - 1, head_y)
        elif action == "s":
            return (head_x, head_y + 1)
        elif action == "d":
            return (head_x + 1, head_y)

    def satisfies(self, body, target):
        """
        Checks if the snake's head has reached the target position.
        """
        return body[0] == target

    def cost(self, body, action):
        """
        Returns the cost of taking an action. Here, all actions have a uniform cost of 1.
        """
        return 1

    def heuristic(self, body, target):
        """
        Heuristic function for A* search.
        Uses Manhattan distance. If traverse is True, accounts for wrapping.
        """
        head_x, head_y = body[0]
        goal_x, goal_y = target

        if self.traverse:
            dx = min(abs(head_x - goal_x), self.map_size[0] - abs(head_x - goal_x))
            dy = min(abs(head_y - goal_y), self.map_size[1] - abs(head_y - goal_y))
            return dx + dy
        else:
            return abs(head_x - goal_x) + abs(head_y - goal_y)
    
    def astar(self, target, body=None):
        """
        Performs A* search to find a path to `target`.
        Returns a list of actions to reach the target.
        """
        body = self.body if not body else body

        root = SnakeNode(
            snake_body=body + self.tail,
            parent=None,
            heuristic=self.heuristic(self.body, target),
            cost=0,
            action=self.lmove,
            last_move=self.lmove
        )

        open_nodes = [root]
        visited = set()
        closest_node = root

        while open_nodes:
            current_node = open_nodes.pop(0)

            # Check if goal is reached or depth limit exceeded
            if self.satisfies(current_node.snake_body, target) or current_node.depth > 10:
                return self.get_actlist(current_node)

            current_body = tuple(current_node.snake_body)
            if current_body in visited:
                continue
            visited.add(current_body)

            new_nodes = []
            for move in self.actions(current_node.snake_body, current_node.last_move):
                new_head = self.result(current_node.snake_body, move)
                new_snake_body = [new_head] + current_node.snake_body[:-1]
                h = self.heuristic(new_snake_body, target)

                # Prune paths that are too long
                if h > (closest_node.f - closest_node.cost) + 4:
                    continue

                # Update closest_node if a better heuristic is found
                if h < closest_node.f - closest_node.cost:
                    closest_node = current_node

                g = current_node.cost + self.cost(current_node.snake_body, move)
                new_node = SnakeNode(
                    snake_body=new_snake_body,
                    parent=current_node,
                    heuristic=h,
                    cost=g,
                    action=move,
                    last_move=current_node.action
                )
                new_nodes.append(new_node)

            self.add_to_open(new_nodes, open_nodes)

        # If no path found, return actions from the closest node
        return self.get_actlist(closest_node)

    def add_to_open(self, node_list, open_nodes):
        """
        Adds nodes to the open list and sorts them based on the f-score.
        """
        open_nodes.extend(node_list)
        open_nodes.sort(key=lambda node: node.f)

    def get_path(self, node):
        """
        Reconstructs the path from the root node to the given node.
        """
        if node.parent is None:
            return [node.snake_body[0]]
        path = self.get_path(node.parent)
        path.append(node.snake_body[0])
        return path

    def get_actlist(self, node):
        """
        Reconstructs the list of actions from the root node to the given node.
        """
        if node.parent is None:
            return []
        path = self.get_actlist(node.parent)
        path.append(node.action)
        return path

### Supporting SnakeNode Class ###

class SnakeNode:
    def __init__(self, snake_body, parent, heuristic=None, cost=None, action=None, last_move=None, depth=None):
        self.snake_body = snake_body      # List of tuples representing the snake's body
        self.parent = parent              # Parent SnakeNode
        self.cost = 0 if not parent else parent.cost + cost  # Total cost from start
        self.f = heuristic if not parent else parent.cost + heuristic  # f-score for A*
        self.action = action              # Action taken to reach this node
        self.last_move = last_move        # Last move direction
        self.depth = 0 if not parent else parent.depth + 1  # Depth in the search tree
    
    def __lt__(self, other):
        """
        Allows SnakeNode to be compared based on f-score for sorting.
        """
        return self.f < other.f

#STUDENT NAME: Luís Oliveira
#STUDENT NUMBER: 98543

#DISCUSSED TPI-1 WITH: (names and numbers):


from tree_search import *
from strips import *
from blocksworld import *

class MyNode(SearchNode):

    def __init__(self,state,parent,depth=None,cost=None,heuristic=None,action=None):
        super().__init__(state,parent)
        self.depth = depth
        self.cost = cost
        self.heuristic = heuristic
        self.action = action

    def __lt__(self, other):
        return (self.cost + self.heuristic)  - (other.cost + other.heuristic)

class MyTree(SearchTree):

    def __init__(self,problem, strategy='breadth',improve=False):
        super().__init__(problem,strategy)
        self.problem = problem
        self.strategy = strategy
        self.improve = improve
        self.solution = None

        root = MyNode(problem.initial, None, 0, 0, 0, None)
        self.open_nodes = [root]

        self.num_open = 1
        self.num_solution = 0
        self.num_skipped = 0
        self.num_closed = 0

        self.best_solution = None
        self.best_cost = float('inf')
    
    def astar_add_to_open(self,lnewnodes):
        self.open_nodes.extend(lnewnodes)
        self.open_nodes.sort(key = lambda node : node.cost + node.heuristic)

    def informeddepth_add_to_open(self,lnewnodes):
        self.open_nodes.extend(lnewnodes)
        self.open_nodes.sort(key = lambda node : node.cost + node.heuristic)
        #self.open_nodes = lnewnodes + self.open_nodes

    def search2(self):
        visited = set()
        while self.open_nodes != []:
            node = self.open_nodes.pop(0)
            # self.num_open -= 1
            self.num_closed += 1

            if self.problem.goal_test(node.state):
                self.solution = node
                current_cost = node.cost
                self.num_solution += 1

                self.num_open = len(self.open_nodes)

                if not self.improve:
                    return self.get_path(node)

                if self.best_cost > current_cost:
                    self.best_cost = current_cost
                    self.best_solution = self.solution

            lnewnodes = []

            for node_action in self.problem.domain.actions(node.state):
                newstate = self.problem.domain.result(node.state, node_action)

                if newstate not in visited:
                    newnode = MyNode(
                        state=newstate,
                        parent=node,
                        depth=node.depth + 1,
                        cost=node.cost + self.problem.domain.cost(node.state, node_action),
                        heuristic=self.problem.domain.heuristic(newstate, self.problem.goal),
                        action=node_action
                    )
                    lnewnodes.append(newnode)

                    visited.add(newstate)

                self.add_to_open(lnewnodes)
        if self.best_solution: return self.get_path(self.best_solution)
        return None

    def check_admissible(self,node):
        #Assume that the given "node" is a solution node
        solution_cost = node.cost
        current_node = node
        while current_node is not None:
            heuristic_value = current_node.heuristic
            cost_to_solution = solution_cost - current_node.cost
            if heuristic_value > cost_to_solution:
                return False
            current_node = current_node.parent
        return True

    def get_plan(self,node):
        actions = []
        current_node = node
        while current_node.parent is not None:
            actions.append(current_node.action)
            current_node = current_node.parent
        actions.reverse()
        
        return actions

    # if needed, auxiliary methods can be added here

class MyBlocksWorld(STRIPS):

    def heuristic(self, state, goal):
        misplaced_blocks = 0
        for goal_predicate in goal:
            if goal_predicate not in state:
                if isinstance(goal_predicate, On):
                    misplaced_blocks += 2
                elif isinstance(goal_predicate, Floor):
                    misplaced_blocks += 1
                elif isinstance(goal_predicate, Holds):
                    misplaced_blocks += 1
                elif isinstance(goal_predicate, Free):
                    misplaced_blocks += 1
                elif isinstance(goal_predicate, HandFree):
                    misplaced_blocks += 1
        return misplaced_blocks

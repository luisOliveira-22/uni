
:- [tree_search, cidades, strips, blocksworld].


% additional search functionalities

stop_or_improve(Domain,ID,OpenNodes,Goal,Solution)
:- search_version(tpi1), 
   ......

search_step(Domain,ID,OpenNodes,Goal,Strategy,NewOpenNodes)
:- search_version(tpi1),
   .....

make_node(Domain,State,Goal,ParentID,A,NewID)
:- search_version(tpi1),
   .....

astar_add_to_open(OpenNodes,LNewNodes,NewOpenNodes)
:- ............

informeddepth_add_to_open(OpenNodes,LNewNodes,NewOpenNodes)
:- ............

check_admissible(NodeID) % assume NodeID is a solution node
:- ...........

get_plan(NodeID,Plan)
:- ........

% Domain "strips/blocksworld"

myHeuristic(strips/blocksworld,State,Goal,Heuristic)
:- ........................



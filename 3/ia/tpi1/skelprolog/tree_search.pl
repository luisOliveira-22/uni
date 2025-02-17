
% The following code assumes a search domain implemented  
% by the following procedures:
% -- actions(Domain,State,LActions)
% -- result(Domain,State,Action,NewState)
% -- satisfies(Domain,State,Goal)
% -- cost(Domain,State,Action,Cost)
% -- heuristic(Domain,State,Goal,Heuristic)
% (to be implemented in specific applications)

% We allow each search domain to be located in a different file
:- multifile(actions/3).
:- multifile(result/4).
:- multifile(satisfies/3).
:- multifile(cost/4).
:- multifile(heuristic/4).

% search configuration
% -- Version: basic or tpi1
% -- Strategy: breadth, depth, etc.
% -- Improve: yes, no (see PDF)

configure_search(Version,Strategy,Improve)
:- retractall(search_version(_)),
   retractall(search_strategy(_)),
   retractall(search_improve(_)),
   assert(search_version(Version)),
   assert(search_strategy(Strategy)),
   assert(search_improve(Improve)).

% Different versions can be implemented in different files;
% the following procedures depend on search version

:- multifile(search_step/5).
:- multifile(make_node/6).
:- multifile(stop_or_improve/5).

% search algorithm
% -----------------

search(Domain,Initial,Goal,Solution)
:- init_search(Domain,Initial,Goal,RootID),
   search_rec(Domain,[RootID],Goal,Solution).

%

init_search(Domain,Initial,Goal,RootID)
:- retractall(node(_,_,_,_)), 
   retractall(lastID(_)), 
   retractall(size_info(_,_,_,_)),
   assert(size_info(1,0,0,0)), % 1 open, 0 solution, 0 skipped, 0 closed
   ( Domain = strips/_, !, sort(Initial,IS); IS = Initial ),
   make_node(Domain,IS,Goal,none,none,RootID).

%

search_rec(_,[],_,Solution)       % queue empty: return
:- clause(solution_node(ID),true),% the latest solution found,
   get_path(ID,Solution).         % if any
search_rec(Domain,[ID|OpenNodes],Goal,Solution)
:- node(ID,State,_,_),
   satisfies(Domain,State,Goal), !,
   update_solution_node(ID),
   update_size_info(-1,1,0,0), % -1 open, +1 solution
   stop_or_improve(Domain,ID,OpenNodes,Goal,Solution).
search_rec(Domain,[ID|OpenNodes],Goal,Solution)
:- !, node(ID,_,_,_),
   search_step(Domain,ID,OpenNodes,Goal,NewOpenNodes),
   search_rec(Domain,NewOpenNodes,Goal,Solution).

%

stop_or_improve(_,ID,_,_,Solution) % in the basic
:- search_version(basic),          % version, simply
   get_path(ID,Solution).          % return the first
                                   % solution found
%

search_step(Domain,ID,OpenNodes,Goal,NewOpenNodes)
:- search_version(basic),
   update_size_info(-1,0,0,1), % -1 open, +1 closed
   node(ID,State,_,_),
   actions(Domain,State,LActions),
   findall(NewID, ( member(A,LActions), 
                    result(Domain,State,A,NewState),
                    get_path(ID,Path),
                    \+ member(NewState,Path),
                    make_node(Domain,NewState,Goal,ID,A,NewID) ), LNewNodes),
   add_to_open(OpenNodes,LNewNodes,NewOpenNodes),
   length(LNewNodes,NNewNodes),
   update_size_info(NNewNodes,0,0,0). 

% Tree nodes represented as facts in the Prolog database
% -- node(ID,State,ParentID,Extra), where Extra is version-dependent
% -- lastID(LastID), where LastID is the ID of the last node created

% create a new node
% -- make_node(Domain,State,Goal,ParentID,Action,NewID)

make_node(_,State,_,ParentID,_,NewID)
:- search_version(basic),
   ( retract(lastID(LastID)), !;
     LastID = 0 ),
   NewID is LastID+1,
   assert(node(NewID,State,ParentID,none)),
   assert(lastID(NewID)).

%

add_to_open(OpenNodes,LNewNodes,NewOpenNodes)
:- search_strategy(breadth),
   append(OpenNodes,LNewNodes,NewOpenNodes).
add_to_open(OpenNodes,LNewNodes,NewOpenNodes)
:- search_strategy(depth),
   append(LNewNodes,OpenNodes,NewOpenNodes).
add_to_open(OpenNodes,LNewNodes,NewOpenNodes)
:- search_strategy(astar),
   astar_add_to_open(OpenNodes,LNewNodes,NewOpenNodes).
add_to_open(OpenNodes,LNewNodes,NewOpenNodes)
:- search_strategy(informeddepth),
   informeddepth_add_to_open(OpenNodes,LNewNodes,NewOpenNodes).

%

update_solution_node(ID)
:- retractall(solution_node(_)),
   assert(solution_node(ID)).
   
%

get_path(none,[]) :- !.
get_path(ID,Path)
:- node(ID,State,ParentID,_),
   get_path(ParentID,Path0),
   append(Path0,[State],Path).

%

update_size_info(DeltaOpen,DeltaSolution,DeltaSkipped,DeltaClosed)
:- retract(size_info(NumOpen,NumSolution,NumSkipped,NumClosed)),
   NewNOpen is NumOpen+DeltaOpen,
   NewNSolution is NumSolution+DeltaSolution,
   NewNSkipped is NumSkipped+DeltaSkipped,
   NewNClosed is NumClosed+DeltaClosed,
   assert(size_info(NewNOpen,NewNSolution,NewNSkipped,NewNClosed)).

% utilities for debug

draw_tree 
:- draw_tree(1,'').

draw_tree(ID,Indent)
:- write(Indent),
   node(ID,State,_,_),
   writeln(ID/State),
   atom_chars(Indent,List),
   atom_chars(NewIndent,[' ',' '|List]),
   findall(_,(node(X,_,ID,_),draw_tree(X,NewIndent)),_).

%%%%%%%%%%%%%%%%%%%%%

:- set_prolog_flag(stack_limit, 75_000_000_000).


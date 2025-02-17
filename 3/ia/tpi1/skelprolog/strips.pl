%

actions(strips/Domain,State,LActions)
:- findall(A, operator_application(Domain,State,A), Unsorted),
   sort(Unsorted,LActions).

result(strips/Domain,State,Action,NewState)
:- operator_application(Domain,State,Action), !,
   operator(Domain,Action,_,NEG,POS),
   subtract(State,NEG,Aux),
   append(Aux,POS,Unsorted),
   sort(Unsorted,NewState).

satisfies(strips/_,State,Goal)
:- subset(Goal,State).

cost(strips/_,_,_,1).

heuristic(strips/Domain,State,Goal,Heuristic)
:- % implement myHeuristic/4 in tpi1.pl
   myHeuristic(strips/Domain,State,Goal,Heuristic).

%

operator_application(Domain,State,Action)
:- operator(Domain,Action,LPC,_,_),
   verify_conditions(State,LPC). 

verify_conditions(_,[]).
verify_conditions(State,[PC|LPC])
:- member(PC,State),
   verify_conditions(State,LPC).


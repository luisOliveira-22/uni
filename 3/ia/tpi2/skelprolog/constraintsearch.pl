% constraint search procedure (generic)

:- multifile variables/2.
:- multifile has_domain/3.
:- multifile has_constraint/3.
:- multifile edges/2.

constraint_search(Problem,Solution)
:- findall(V-D,has_domain(Problem,V,D),Pairs),
   dict_pairs(Domains,dom,Pairs),
   constraint_search(Problem,Domains,Solution).

constraint_search(_,Domains,_)
:- [] = Domains._, !, fail.

constraint_search(Problem,Domains,Sol)
:- \+ ( Domain = Domains._, length(Domain,N), N>1 ),
   findall(V-X,([X]=Domains.V),Pairs),
   dict_pairs(Sol,solution,Pairs),
   \+ ( has_constraint(Problem,(V1,V2),C),
        ConstraintCall =.. [C,V1,Sol.V1,V2,Sol.V2],
	\+ call(ConstraintCall) ).

constraint_search(Problem,Domains,Solution)
:- Domain = Domains.V,
   length(Domain,N), N>1,
   member(X,Domain),
   writeln(Domains-V-N),
   NewDomains = Domains.put(V,[X]),
   findall((U,V), has_constraint(Problem,(U,V),_),Edges),
   propagate(Problem,NewDomains,Edges,NewDomains2),
   writeln(propagated),
   constraint_search(Problem,NewDomains2,Solution).

propagate(_,Domains,[],Domains).
propagate(P,Domains,[(V1,V2)|Edges],FinalDomains)
:- findall(X, ( member(X,Domains.V1),
                findall(Y,( member(Y,Domains.V2),
                            has_constraint(P,(V1,V2),C),
			    Call =.. [C,V1,X,V2,Y],
			    Call ), Compatible),
                Compatible \= [] ), Values ),
   length(Values,K), length(Domains.V1,N), K<N, !,
   findall((U,V1), has_constraint(P,(U,V1),_),Edges2),
   append(Edges,Edges2,NewEdges),
   NewDomains = Domains.put(V1,Values),
   propagate(P,NewDomains,NewEdges,FinalDomains).
propagate(P,Domains,[_|Edges],FinalDomains)
:- propagate(P,Domains,Edges,FinalDomains).
 

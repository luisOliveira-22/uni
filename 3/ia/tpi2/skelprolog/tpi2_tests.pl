%

:- [tpi2].

write2ln(X)
:- writeln(X), nl.

%% ------------------------------------------------------------
%% Semantic network
%% ------------------------------------------------------------

:- retractall(declaration(_,_)).

:- insert(descartes,subtype(mammal,vertebrate)).
:- insert(darwin,subtype(mammal,vertebrate)).
:- insert(darwin,assocSome(mammal,likes,milk)).

:- insert(descartes,subtype(man,mammal)).
:- insert(darwin,subtype(man,mammal)).
:- insert(darwin,assocSome(man,likes,meat)).
:- insert(bacon,assocOne(man,likes,vegetables)).
:- insert(descartes,assocNum(man,hasWeight,80)).
:- insert(descartes,assocNum(man,hasWeight,70)).
:- insert(descartes,assocNum(man,hasHeight,1.75)).
:- insert(descartes,assocNum(man,hasHeight,1.80)).

:- insert(bacon,assocSome(philosopher,likes,philosophy)).

:- insert(descartes,member(socrates,man)).
:- insert(damasio,member(socrates,philosopher)).
:- insert(descartes,assocSome(socrates,professorOf,philosophy)).
:- insert(descartes,assocSome(socrates,professorOf,mathematics)).
:- insert(simoes,assocNum(socrates,professorOf,mathematics)).
:- insert(simao,assocSome(socrates,professorOf,mathematics)).
:- insert(descartes,assocNum(socrates,hasHeight,1.75)).
:- insert(nunes,assocOne(socrates,hasHeight,1.70)).
:- insert(bacon,assocNum(socrates,hasHeight,1.80)).
:- insert(simao,assocOne(socrates,hasFather,sophroniscus)).
:- insert(nunes,assocOne(socrates,hasFather,sophroniscus)).
:- insert(aristotle,assocOne(socrates,hasFather,plato)).
:- insert(bacon,assocNum(socrates,hasFather,plato)).
:- insert(simao,assocOne(socrates,hasMother,phaenarete)).
:- insert(socrates,assocSome(socrates,likes,sophroniscus)).
:- insert(sophroniscus,assocSome(socrates,likes,phaenarete)).
:- insert(bacon,assocSome(socrates,likes,mathematics)).
:- insert(bacon,assocSome(socrates,dislikes,meat)).

:- insert(descartes,member(plato,man)).
:- insert(descartes,assocSome(plato,professorOf,philosophy)).
:- insert(simao,assocSome(plato,professorOf,philosophy)).
:- insert(simao,assocSome(aristotle,hasFather,ariston)).

:- insert(descartes,member(aristotle,man)).
:- insert(simao,assocOne(aristotle,hasFather,nicomachus)).

% tests

:- query(socrates,member,Result), 
   write2ln('socrates member':Result).

:- query(socrates,subtype,Result), 
   write2ln('socrates subtype':Result).

:- query(socrates,hasHeight,Result), 
   write2ln('socrates hasHeight':Result).

:- query(socrates,hasWeight,Result), 
   write2ln('socrates hasWeight':Result).

:- query(socrates,likes,Result), 
   write2ln('socrates likes':Result).

:- query(socrates,hasFather,Result), 
   write2ln('socrates hasFather':Result).


%% ------------------------------------------------------------
%% Bayesian networks
%% ------------------------------------------------------------

% condprob(BN,Var,LTrue,LFalse,Prob)

condprob(cardiag,a,[],[],0.003).

condprob(cardiag,b_a,[],[],0.002).

condprob(cardiag,c_s,[a],[],0.48).
condprob(cardiag,c_s,[],[a],0.08).

condprob(cardiag,d,[],[],0.01).

condprob(cardiag,m_f,[],[],0.01).

condprob(cardiag,b_v,[c_s,b_a],[],0.18).
condprob(cardiag,b_v,[c_s],[b_a],0.02).
condprob(cardiag,b_v,[b_a],[c_s],0.90).
condprob(cardiag,b_v,[],[c_s,b_a],0.68).

condprob(cardiag,s_m,[],[],0.05).

condprob(cardiag,s_p,[],[],0.3).

condprob(cardiag,v_p,[m_f,d,b_v],[],0.003).
condprob(cardiag,v_p,[m_f,d],[b_v],0.12).
condprob(cardiag,v_p,[m_f,b_v],[d],0.08).
condprob(cardiag,v_p,[m_f],[d,b_v],0.01).
condprob(cardiag,v_p,[d,b_v],[m_f],0.04).
condprob(cardiag,v_p,[d],[m_f,b_v],0.07).
condprob(cardiag,v_p,[b_v],[m_f,d],0.13).
condprob(cardiag,v_p,[],[m_f,d,b_v],0.09).

condprob(cardiag,h,[b_v],[],0.44).
condprob(cardiag,h,[],[b_v],0.89).

condprob(cardiag,s_s,[s_m,m_f,b_v],[],0.30).
condprob(cardiag,s_s,[s_m,m_f],[b_v],0.21).
condprob(cardiag,s_s,[s_m,b_v],[m_f],0.34).
condprob(cardiag,s_s,[m_f,b_v],[s_m],0.15).
condprob(cardiag,s_s,[s_m],[m_f,b_v],0.12).
condprob(cardiag,s_s,[m_f],[s_m,b_v],0.14).
condprob(cardiag,s_s,[b_v],[s_m,m_f],0.132).
condprob(cardiag,s_s,[],[s_m,m_f,b_v],0.44).

condprob(cardiag,s_t,[d],[],0.08).
condprob(cardiag,s_t,[],[d],0.002).

condprob(cardiag,s_q,[s_p,v_p],[],0.008).
condprob(cardiag,s_q,[s_p],[v_p],0.4).
condprob(cardiag,s_q,[v_p],[s_p],0.51).
condprob(cardiag,s_q,[],[s_p,v_p],0.13).

condprob(cardiag,f_s,[],[],0.1).

condprob(cardiag,c_c,[s_s],[],0.49).
condprob(cardiag,c_c,[],[s_s],0.023).

condprob(cardiag,car_s,[c_c,s_t,s_q ,f_s ],[],0.091).
condprob(cardiag,car_s,[c_c,s_t,s_q],[f_s],0.081).
condprob(cardiag,car_s,[c_c,s_t,f_s],[s_q],0.045).
condprob(cardiag,car_s,[s_t,s_q,f_s],[c_c],0.052).
condprob(cardiag,car_s,[c_c,f_s,s_q],[s_t],0.087).
condprob(cardiag,car_s,[c_c,s_t],[s_q ,f_s],0.065).
condprob(cardiag,car_s,[c_c,s_q],[s_t,f_s],0.043).
condprob(cardiag,car_s,[c_c,f_s],[s_t,s_q],0.035).
condprob(cardiag,car_s,[s_t,s_q],[c_c,f_s],0.054).
condprob(cardiag,car_s,[s_t,f_s],[c_c,s_q],0.056).
condprob(cardiag,car_s,[s_q,f_s],[c_c,s_t],0.045).
condprob(cardiag,car_s,[c_c],[s_t,s_q,f_s],0.067).
condprob(cardiag,car_s,[s_t],[c_c,s_q,f_s],0.078).
condprob(cardiag,car_s,[s_q],[c_c,s_t,f_s],0.031).
condprob(cardiag,car_s,[f_s],[c_c,s_t,s_q],0.034).
condprob(cardiag,car_s,[],[c_c,s_t,s_q,f_s],0.023).

% tests

:- test_independence(cardiag,s_t,c_c,[d,m_f,b_v,s_m],Bool,Graph),
   write2ln('s_t, c_c, [d, m_f, b_v, s_m]':Bool-Graph).

:- test_independence(cardiag,s_t,c_c,[d],Bool,Graph),
   write2ln('s_t, c_c, [d]':Bool-Graph).

:- test_independence(cardiag,s_t,s_q,[d],Bool,Graph),
   write2ln('s_t, s_q, [d]':Bool-Graph).

:- test_independence(cardiag,d,b_v,[car_s],Bool,Graph),
   write2ln('d, b_v, [car_s]':Bool-Graph).

:- test_independence(cardiag,d,b_v,[a],Bool,Graph),
   write2ln('d, b_v, [a]':Bool-Graph).

%% ------------------------------------------------------------
%% Constraint search
%% ------------------------------------------------------------

%%
%% 4 queens
%%

% variables and domains

has_domain(queens,V,[1,2,3,4])
:- member(V,[q1,q2,q3,q4]).


% constraint

no_attack(V1,X1,V2,X2)
:- X1 \= X2,
   atom_chars(V1,[_|L1]), number_string(R1,L1),
   atom_chars(V2,[_|L2]), number_string(R2,L2),
   abs(R1-R2) =\= abs(X1-X2).

% constraint graph

has_constraint(queens,(V1,V2),no_attack)
:- has_domain(queens,V1,_),
   has_domain(queens,V2,_),
   V1 \= V2.

:- search_all(queens,Solutions), write2ln(Solutions).

%% 
%% Map coloring
%% 

has_domain(mapa_a,V,[red,blue,green])
:- member(V,[a,b,c,d,e]).

has_constraint(mapa_a,(V1,V2),different_color)
:- SomeEdges = [ (a,b), (b,c), (c,d), (d,a) ],
   ( member((V1,V2),SomeEdges); member((V2,V1),SomeEdges) ).

has_constraint(mapa_a,(V1,V2),different_color)
:- ( V1=e, member(V2,[a,b,c,d]);
     V2=e, member(V1,[a,b,c,d]) ).

different_color(_,C1,_,C2)
:- C1 \= C2.
 
:- search_all(mapa_a,Solutions), write2ln(Solutions).

%%
%% TWO+TWO=FOUR
%%

% variables and domains

variables(twoplustwo,[t,w,o,f,u,r]).

tuple_variables(twoplustwo,[orx1,wx1ux2,tx2of]).

has_domain(twoplustwo,V,[0,1,2,3,4,5,6,7,8,9])
:- variables(twoplustwo,LV), member(V,LV), V\=f.
has_domain(twoplustwo,V,[0,1])
:- member(V,[f,x1,x2]).

has_domain(twoplustwo,orx1,Domain)
:- has_domain(twoplustwo,o,Do),
   has_domain(twoplustwo,r,Dr),
   has_domain(twoplustwo,x1,Dx1),
   findall([O,R,X1],( member(O,Do),
                      member(R,Dr), member(X1,Dx1),
		      2*O =:= R + 10*X1 ),Domain).

has_domain(twoplustwo, wx1ux2,Domain)
:-  has_domain(twoplustwo,w,Dw),
    has_domain(twoplustwo,x1,Dx1),
    has_domain(twoplustwo,u,Du),
    has_domain(twoplustwo,x2,Dx2),
    findall([W,X1,U,X2],( member(W, Dw), member(X1, Dx1), 
                          member(U,Du), member(X2,Dx2), 
			  2*W + X1 =:= U + 10*X2), Domain ).

has_domain(twoplustwo, tx2of,Domain)
:-  has_domain(twoplustwo,t,Dt),
    has_domain(twoplustwo,x2,Dx2),
    has_domain(twoplustwo,o,Do),
    has_domain(twoplustwo,f,Df),
    findall([T,X2,O,F],( member(T, Dt), member(X2, Dx2), 
                         member(O, Do), member(F, Df), 
			 2*T + X2 =:= O + 10*F), Domain ).

% constraints

different_digit(_,X1,_,X2)
:- X1\=X2.

tuple_constraint0(_,[X|_],_,X).
tuple_constraint0(_,X,_,[X|_]).
tuple_constraint1(_,[_,X|_],_,X).
tuple_constraint1(_,X,_,[_,X|_]).
tuple_constraint2(_,[_,_,X|_],_,X).
tuple_constraint2(_,X,_,[_,_,X|_]).
tuple_constraint3(_,[_,_,_,X|_],_,X).
tuple_constraint3(_,X,_,[_,_,_,X|_]).

% constraint graph

has_constraint(twoplustwo,(V1,V2),different_digit)
:- variables(twoplustwo,Variables),
   member(V1,Variables), member(V2,Variables),
   V1 \= V2.

has_constraint_aux((o,orx1), tuple_constraint0).
has_constraint_aux((r,orx1), tuple_constraint1).
has_constraint_aux((x1,orx1), tuple_constraint2).
has_constraint_aux((w,wx1ux2), tuple_constraint0).
has_constraint_aux((x1,wx1ux2), tuple_constraint1).
has_constraint_aux((u,wx1ux2), tuple_constraint2).
has_constraint_aux((x2,wx1ux2), tuple_constraint3).
has_constraint_aux((t,tx2of), tuple_constraint0).
has_constraint_aux((x2,tx2of), tuple_constraint1).
has_constraint_aux((o,tx2of), tuple_constraint2).
has_constraint_aux((f,tx2of), tuple_constraint3).

has_constraint(twoplustwo,(V1,V2),C) 
:- has_constraint_aux((V1,V2),C);
   has_constraint_aux((V2,V1),C).

% testing

:- get_time(T0),
   search_all(twoplustwo,Solutions),
   variables(twoplustwo,Vars),
   findall(S,( member(Full,Solutions),
               findall((Var,Val), ( member(Var,Vars), member((Var,Val),Full)), S),
               writeln(S) ),List),
   length(List,Len), writeln('Number of solutions':Len),
   get_time(T1), Time is T1-T0,
   writeln('Done in':Time-seconds).

% --------------------------------------------------------
% Problem: tpt (alternative formulation of twoplustwo)
% --------------------------------------------------------

:- dynamic has_domain/3.
:- dynamic has_constraint/3.

variables(tpt,Vars)
:- variables(twoplustwo,Vars).

has_domain(tpt,V,Domain) 
:- variables(twoplustwo,Vars),
   member(V,[x1,x2|Vars]),
   has_domain(twoplustwo,V,Domain).

has_constraint(tpt,(V1,V2),different_digit)
:- variables(twoplustwo,Variables),
   member(V1,Variables), member(V2,Variables),
   V1 \= V2.

unary_constraint_orx1([O,R,X1])
:- 2*O =:= R+10*X1. 

unary_constraint_wx1ux2([W,X1,U,X2])
:- 2*W+X1 =:= U+10*X2. 

unary_constraint_tx2of([T,X2,O,F])
:- 2*T+X2 =:= O+10*F. 

% handling higher-order constraints

:- handle_ho_constraint(tpt,[o,r,x1],unary_constraint_orx1).

:- handle_ho_constraint(tpt,[w,x1,u,x2],unary_constraint_wx1ux2).

:- handle_ho_constraint(tpt,[t,x2,o,f],unary_constraint_tx2of).

% testing

:- get_time(T0),
   search_all(tpt,Solutions),
   variables(tpt,Vars),
   findall(S,( member(Full,Solutions),
               findall((Var,Val), ( member(Var,Vars), member((Var,Val),Full)), S),
               writeln(S) ),List),
   length(List,Len), writeln('Number of solutions':Len),
   get_time(T1), Time is T1-T0,
   writeln('Done in':Time-seconds).



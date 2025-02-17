% Semantic networks

insert(User,Relation)
:- Relation =.. [F,_,_],
   member(F,[member,subtype]), !,
   assert(declaration(User,Relation)).
insert(User,assocSome(E1,A,E2))   % note that, when stored in the database,
:- Rel =.. [A,E1,some:E2],        % the type of an association is identified 
   assert(declaration(User,Rel)). % in the second argument by the atoms
insert(User,assocOne(E1,A,E2))    % 'some', 'one' and 'num' 
:- Rel =.. [A,E1,one:E2],
   assert(declaration(User,Rel)).
insert(User,assocNum(E1,A,E2))
:- Rel =.. [A,E1,num:E2],
   assert(declaration(User,Rel)).

% query_local(+U,+E1,+RelName,+E2,-Result)
% Note: each input argument is either a
%       concrete value or the atom 'none'
query_local(U,E1,RelName,E2,Result)
:- findall((U_,E1_,R_,E2_),( declaration(U_,Rel),
                             Rel =.. [R_,E1_,E2_],
                             none_or_this(U,U_),
                             none_or_this(RelName,R_),
                             none_or_this(E1,E1_),
                             none_or_this(E2,E2_) ), Result).

none_or_this(X,_:X)
:- X \= none, !.
none_or_this(X,X)
:- X \= none, !.
none_or_this(none,_).



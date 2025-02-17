% Bayesian network specified as a set of facts
% with the following format:
%    condprob(BN,Var,LTrue,LFalse,Prob)
% Where:
%    BN - name of Bayesian network
%    Var - variable
%    LTrue - true mothers
%    LFalse - false mothers
%    Prob - conditional probability of Var given mothers

joint_prob(BN,(LTrue,LFalse),P)
:- append(LTrue,LFalse,LVars),
   joint_prob(BN,LVars,LTrue,LFalse,P).

joint_prob(_,[],_,_,1.0).

joint_prob(BN,[Var|LVars],LTrue,LFalse,P)
:- joint_prob(BN,LVars,LTrue,LFalse,P0),
   condprob(BN,Var,Lt,Lf,PC),
   subset(Lt,LTrue),
   subset(Lf,LFalse),
   ( member(Var,LTrue), !, P is PC*P0; P is (1-PC)*P0 ).


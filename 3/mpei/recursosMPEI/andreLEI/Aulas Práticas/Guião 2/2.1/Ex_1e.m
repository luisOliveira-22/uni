% P(A|B)
% A - família tem pelo menos 1 rapaz
% B - família tem 2 rapazes

N = 1e5;
n = 5;
p = 0.5;

familia = rand(n,N) < p;                

A = sum(familia)>=1;
B = sum(familia)==2;
prob = sum(B)/sum(A)
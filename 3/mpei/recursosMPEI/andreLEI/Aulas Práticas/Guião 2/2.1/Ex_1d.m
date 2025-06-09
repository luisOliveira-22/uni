% P(A|B)
% A - família tem 2 rapazes
% B - o primeiro filho é rapaz

N = 1e5;
n = 2;
p = 0.5;

familias = rand(n,N) < p;

A = sum(familias)==2;
B = familias(1,:);
prob = sum(A)/sum(B)
Sx = 0:4;

N = 1e6;
p = 1/2;
exp = rand(4,N) < p;

num0 = sum(sum(exp) == 0);
num1 = sum(sum(exp) == 1);
num2 = sum(sum(exp) == 2);
num3 = sum(sum(exp) == 3);
num4 = sum(sum(exp) == 4);

prob0 = num0/N;
prob1 = num1/N;
prob2 = num2/N;
prob3 = num3/N;
prob4 = num4/N;


fprintf("Px(0)= %.6f\nPx(1)= %.6f\nPx(2)= %.6f\nPx(3)= %.6f\nPx(4)= %.6f\n", prob0, prob1, prob2, prob3, prob4)
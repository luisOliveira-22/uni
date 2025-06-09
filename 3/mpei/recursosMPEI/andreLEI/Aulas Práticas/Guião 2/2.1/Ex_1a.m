N = 1e7;
p = 0.5;
n = 2;
k = 1;

acontecimentos = rand(n,N)<p;
sucessos = sum(acontecimentos) >= k;
prob = sum(sucessos)/N

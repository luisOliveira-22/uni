n = 5;
N = 10000;
d = 2;
p = 0.30;

amostras = rand(n,N) < p;
sucessos = sum(amostras)<=d;
prob = sum(sucessos)/N
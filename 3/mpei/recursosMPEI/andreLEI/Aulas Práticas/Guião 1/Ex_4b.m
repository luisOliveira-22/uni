prob = zeros(1,21);
p = 0.5;
n = 20;
N = 10000;

for c = 0:20
    prob(c+1) = probSimulacao(p,n,c,N);
end

stem(0:20,prob);
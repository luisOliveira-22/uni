prob = zeros(1,6);
p = 0.3;
n = 5;
N = 10000;

for c = 0:5
    prob(c+1) = probSimulacao(p,n,c,N);
end

stem(0:5,prob);
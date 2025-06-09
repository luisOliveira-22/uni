N = 1e5;
p = 3;
n = 2;

sequencias = randi(3,n,N);

cf12 = 0;

for c = 1:N
    if (sequencias(1,c)==1 && sequencias(2,c)==2) || (sequencias(1,c)==2 && sequencias(2,c)==1)
        cf12 = cf12+1;
    end
end

cf2 = 0;

for c = 1:N
    if sequencias(1,c) == 2 || sequencias(2,c) == 2
        cf2 = cf2+1;
    end
end

prob12 = cf12/N;
prob2 = cf2/N;

prob = prob12/prob2


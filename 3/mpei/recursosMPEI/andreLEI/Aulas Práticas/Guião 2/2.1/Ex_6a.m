N = 1e5;
p = 3;
n = 2;

sequencias = randi(3,n,N);

cf = 0;

for c = 1:N
    if sequencias(1,c) == 1 && sequencias(2,c) == 2
        cf = cf+1;
    end
end

prob = cf/N
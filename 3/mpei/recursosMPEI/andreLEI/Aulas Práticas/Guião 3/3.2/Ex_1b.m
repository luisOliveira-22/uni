T = [0.8 0 0 0.3 0;   
    0.2 0.6 0 0.2 0;   
    0 0.3 1 0 0;       
    0 0.1 0 0.4 0;
    0 0 0 0.1 1];

N = 1e5;

array = cell(1,N);

for n = 1:N
    rand = randi(3);
    
    if rand == 3
        rand = 4;
    end
    
    stateRand = crawl(T, rand, [3 5]);

    array{n} = stateRand;
end

max = length(array{1});
min = length(array{1});

for n = 2:N
    if length(array{n}) > max
        max = length(array{n});
    end

    if length(array{n}) < min
        min = length(array{n});
    end
end

fprintf("Comprimento máximo: %d\n", max);
fprintf("Comprimento minimo: %d\n", min);
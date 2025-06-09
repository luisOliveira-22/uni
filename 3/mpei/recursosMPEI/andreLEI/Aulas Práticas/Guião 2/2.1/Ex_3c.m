k = 50; 
T = 100:100:1000; 
N = 1e5;
prob = zeros(length(T));

for i = 1:length(T)
    cf = 0;
    for j = 1: N
        lugares = randi(T(i), 1, k);
        if length(lugares) == length(unique(lugares)) 
            cf = cf + 1;
        end 
    end
    prob(i) = cf/N;
end

plot(T, prob);
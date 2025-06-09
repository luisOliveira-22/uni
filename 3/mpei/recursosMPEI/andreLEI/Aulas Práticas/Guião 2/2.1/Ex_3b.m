k = 10:10:100; 
T = 1000; 
N = 1e5; 
prob = zeros(length(k));

for i=1 : length(k)
    lugares = randi(T,k(i),N);
    cf = 0;
    for j= 1: N
        if  length(lugares(:,j)) ~= length(unique(lugares(:,j))) 
            cf = cf + 1;
        end
    end
    prob(i) = cf/N;
end 

ylabel("Probabilidade");
xlabel("Keys val");
plot(k, prob);
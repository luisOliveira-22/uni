N = 1e5;
T = 1000; 
k = 10; 

cf  = 0;

for i =1: N
    lugares = randi(T,1,k); 
    if length(lugares) ~= length(unique(lugares)) 
        cf = cf + 1;
    end 
end

prob = cf/N
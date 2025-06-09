N = 1e5;
m = [200, 500, 1000, 2000, 5000, 10000, 20000, 50000, 100000];
n = 100;
probabilidades = zeros(length(m));

for k = 1: length(m)
    lancamentos = randi(m(k), n, N);
    sucessos = 0;
    for i = 1: N
        if length(unique(lancamentos(:, i))) <= n -1
            sucessos = sucessos +1;
        end 
    end
    probabilidades(k) = sucessos/N;
end 

plot(m, probabilidades)
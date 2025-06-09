n = 15; %Número de lançamentos
N = 10000; %Número de experiencias
p = 0.5; %probabilidade de sair cara

lancamentos = rand(n,N) > p;
sucessos = sum(lancamentos) >= 6;
probSimulacao = sum(sucessos)/N
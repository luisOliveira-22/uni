N = 10000; %Némero de experiências
n = 15; %Número de lançamentos 
p = 0.5; %probabilidade de sair cara
c = 6; %Número de caras

lancamentos = rand(n,N) > p;
caras = sum(lancamentos) == c;
probSimulacao = sum(caras)/N



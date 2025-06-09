% Código 1
% Gerar uma matriz com 3 linhas e 10000 colunas de números aleatórios
% entre 0.0 e 1.0 (ou seja, cada coluna representa uma experiência):
experiencias = rand(3,10000);
% Gerar uma matriz com 3 linhas e 10000 colunas com o valor 1 se o valor
% da matriz anterior for superior a 0.5 (ou seja, se saiu cara) ou com o
% valor 0 caso contr´ario (ou seja, saiu coroa):
lancamentos = experiencias > 0.5; % 0.5 corresponde a 1 - prob. de caras
% Gerar um vetor linha com 10000 elementos com a soma dos valores de cada
% coluna da matriz anterior (ou seja, o n´umero de caras de cada experiˆencia):
resultados= sum(lancamentos);
% Gerar um vetor linha com 10000 elementos com o valor 1 quando o valor do
% vetor anterior ´e 2 (ou seja, se a experiˆencia deu 2 caras) ou 0 quando ´e
% diferente de 2:
sucessos= resultados==2;
% Determinar o resultado final dividindo o n´umero de experiˆencias com 2
% caras pelo n´umero total de experiˆencias:
probSimulacao1= sum(sucessos)/10000


N= 1e5; %n´umero de experiˆencias
p = 0.5; %probabilidade de cara
k = 2; %n´umero de caras
n = 3; %n´umero de lanc¸amentos
lancamentos = rand(n,N) > p;
sucessos= sum(lancamentos)==k;
probSimulacao2= sum(sucessos)/N
Sx = 1:6;  % espaço de amostragem

probs = ones(1,6)/6; 

stem(Sx, probs)
title('Função Massa de Probabilidade de X')
xlabel('xi')
ylabel('P[X=xi]')
axis([0 7 0 1/5])
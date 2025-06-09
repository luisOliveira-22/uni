Sx = 0:4;
p = 1/2;

prob0Teo = prob_teorica(0, 4, p);
prob1Teo = prob_teorica(1, 4, p);
prob2Teo = prob_teorica(2, 4, p);
prob3Teo = prob_teorica(3, 4, p);
prob4Teo = prob_teorica(4, 4, p);

probsTeo = [prob0Teo prob1Teo prob2Teo prob3Teo prob4Teo];

mediaTeo = sum(Sx.*probsTeo);
varTeo = sum((Sx.^2).*probsTeo) - (mediaTeo.^2);
desvio_padraoTeo = sqrt(varTeo);

fprintf("Valor Esperado = %.6f \nVariância = %.6f \nDesvio padrão = %.6f\n", mediaTeo, varTeo, desvio_padraoTeo)
prob_teorica0 = prob_teorica(0,5,0.3);
prob_teorica1 = prob_teorica(1,5,0.3);
prob_teorica2 = prob_teorica(2,5,0.3);
prob_teorica3 = prob_teorica(3,5,0.3);
prob_teorica4 = prob_teorica(4,5,0.3);
prob_teorica5 = prob_teorica(5,5,0.3);

probTeo1=[prob_teorica0 prob_teorica1 prob_teorica2 prob_teorica3 prob_teorica4 prob_teorica5];
probTeoAcumulada= cumsum( probTeo1)
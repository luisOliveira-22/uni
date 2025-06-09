lambda=0.02*100;
pk=0;

for k=0:1
    pk= pk + ((lambda^k)/factorial(k))*exp(-lambda);
end 

disp(pk);
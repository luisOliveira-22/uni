lambda=15;
soma = 0;

for k=0:10 
    pkb = ((lambda^k)/factorial(k))*exp(-lambda);
    soma = pkb + soma;
end

resultado = 1 - soma
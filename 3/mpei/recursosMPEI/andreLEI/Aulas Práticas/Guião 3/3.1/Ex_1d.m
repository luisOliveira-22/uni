T = [0.7 0.8 ; 0.3 0.2];

prob = zeros(1,30);
  
X_faltar = [0.15 ; 0.85]; 
  
for aula = 1 : 30
    matriz = T^(aula-1) * X_faltar;
    prob(aula) = matriz(1);
end
  
plot(1:30,prob);
xlabel("Aulas");
ylabel("Probabilidade de faltar");  
T = zeros(20,20);

for k = 1 : 20
  r = rand(20, 1);
  r = r / sum(r);
  
  T(:,k) = r;
end 

disp(T);
disp("É estocástica pois não temos entradas negativas e a soma de cada coluna dá sempre 1");

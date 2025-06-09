T = [0.7 0.2 0.3 ; 0.2 0.3 0.3 ; 0.1 0.5 0.4];

v = [1 ; 0 ; 0];

diaSol = 1;
diaNuvens = 0;
diaChuva = 0;

for i = 2:31
    v = T*v;
    diaSol = diaSol + v(1);
    diaNuvens = diaNuvens + v(2);
    diaChuva = diaChuva + v(3);
end

fprintf("Numero médio de dias de sol: %f\n", diaSol);
fprintf("Numero médio de dias de nuvens: %f\n", diaNuvens);
fprintf("Numero médio de dias de chuva: %f\n", diaChuva);
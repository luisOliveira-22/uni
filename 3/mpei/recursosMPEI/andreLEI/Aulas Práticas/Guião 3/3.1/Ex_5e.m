T = [0.7 0.2 0.3 ; 0.2 0.3 0.3 ; 0.1 0.5 0.4];

x0 = [0 ; 0 ; 1];

diaSol = 0;
diaNuvens = 0;
diaChuva = 1;

for i = 2:31
    x0 = T*x0;
    diaSol = diaSol + x0(1);
    diaNuvens = diaNuvens + x0(2);
    diaChuva = diaChuva + x0(3);
end

fprintf("Numero médio de dias de sol: %f\n", diaSol);
fprintf("Numero médio de dias de nuvens: %f\n", diaNuvens);
fprintf("Numero médio de dias de chuva: %f\n", diaChuva);
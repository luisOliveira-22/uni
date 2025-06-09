T = [0.7 0.2 0.3 ; 0.2 0.3 0.3 ; 0.1 0.5 0.4];

dores = 0.1;

x0 = [1 ; 0 ; 0];

for i = 2:31
    x0 = T*x0;
    dores = dores + 0.1*x0(1) + 0.3*x0(2) + 0.5*x0(3);
end

fprintf("Numero médio de dores com 1ºsol: %f\n", dores);


dores = 0.5;

x0 = [0 ; 0 ; 1];

for i = 2:31
    x0 = T*x0;
    dores = dores + 0.1*x0(1) + 0.3*x0(2) + 0.5*x0(3);
end

fprintf("Numero médio de dores com 1ºchuva: %f\n", dores);
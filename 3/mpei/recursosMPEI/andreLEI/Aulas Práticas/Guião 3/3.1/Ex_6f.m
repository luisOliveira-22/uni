Tcan = [0.8 0 0.3 0 0 ; 0.2 0.6 0.2 0 0 ; 0 0.1 0.4 0 0 ; 0 0.3 0 1 0 ; 0 0 0.1 0 1];

Q = Tcan(1:3,1:3);

F = inv(eye(length(Q))-Q);

E = sum(F);
fprintf("Nº passos a começar em 1: %f\n", E(1));
fprintf("Nº passos a começar em 2: %f\n", E(2));
fprintf("Nº passos a começar em 4: %f\n", E(3));


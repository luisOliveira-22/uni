Tcan = [0.8 0 0.3 0 0 ; 0.2 0.6 0.2 0 0 ; 0 0.1 0.4 0 0 ; 0 0.3 0 1 0 ; 0 0 0.1 0 1];

Q = Tcan(1:3,1:3);
R = Tcan(4:5,1:3);
F = inv(eye(length(Q))-Q);

B = R*F;

fprintf("Começando no estado 1, prob. absorção do estado 3: %f\n", B(1,1));
fprintf("Começando no estado 1, prob. absorção do estado 5: %f\n", B(2,1));

T = [0.7,0.8 ; 0.3,0.2];
X_faltar = [0 ; 1]; 
T2 = T^2;

res_matriz = (T2*X_faltar);
prob = res_matriz(1)
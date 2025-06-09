T = [0.8 0 0 0.3 0 ; 0.2 0.6 0 0.2 0 ; 0 0.3 1 0 0 ; 0 0.1 0 0.4 0 ; 0 0 0 0.1 1];
x0 = [1 ; 0 ; 0 ; 0 ; 0];

n = 1:100;
estado3 = zeros(1,100);
estado5 = zeros(1,100);

for i =1:100
    v = T^i*x0;
    estado3(i) = v(3);
    estado5(i) = v(5);
end

plot(n, estado3, n, estado5);
legend("1 -> 3", "1 -> 5")
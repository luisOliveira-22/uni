H = [0 0 0 0 1/3 1/6 ; 1 0 0 0 1/3 1/6 ; 0 1/2 0 1 0 1/6 ; 0 0 1 0 0 1/6 ; 0 1/2 0 0 0 1/6 ; 0 0 0 0 1/3 1/6];

beta = 0.8;
A = beta*H + (1-beta)*ones(length(H),length(H))/6;
r = (ones(1,6)/6)';

for i = 1:10
    r = A*r;
end

r
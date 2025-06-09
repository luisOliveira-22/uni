T = [0 1/2 1/2 0 1/4 0;
     1 0 0 0 1/4 0;
     0 0 0 1 1/4 0;
     0 0 1/2 0 1/4 1;
     0 0 0 0 0 0;
     0 1/2 0 0 0 0];

beta = 0.85;
A = beta*T + (1-beta)*ones(6,6)*(1/6);

r = ones(1,6)'*1/6;

r1 = r;

while(true)
    r2 = A*r1;
    if abs(r2-r1)<0.01
        break
    end
    r1 = r2;
end

r2
fprintf("A pág. com maior pagerank é c.fr com prob: %f\n", max(r2));
fprintf("A pág. com menor pagerank é e.com com prob: %f\n", min(r2));
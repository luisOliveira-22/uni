T = [0 0 0 0 0 0 0;
     0.5 0 0 0 0 0 0;
     0.5 0 0 0 0 0 0;
     0 1/3 0 0.2 0.1 0 0;
     0 1/3 0.6 0.5 0.4 0.6 0;
     0 1/3 0.4 0 0.3 0 0;
     0 0 0 0.3 0.2 0.4 0];

N = 1e5;

CF = 0;

for n = 1:N
    state = crawl(T, 2, 7);
    if length(state) == 7
        CF = CF + 1;
    end

end

p = CF/N;

fpriSntf("Prob. de 7 digitos: %f \n", p);
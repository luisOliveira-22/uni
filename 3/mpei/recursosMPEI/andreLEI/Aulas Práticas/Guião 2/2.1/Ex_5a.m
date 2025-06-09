n = 2;
N = 1e5;
m = 6;

lancamentos = randi(m,n,N);

cfA = 0;
cfB = 0;
cfC = 0;
cfD = 0;

for c = 1:N
    %A
    soma = lancamentos(1,c)+lancamentos(2,c);
    if soma == 9
        cfA = cfA+1;
    end
    %B
    if rem(lancamentos(2,c),2) == 0
        cfB = cfB+1;
    end
    %C
    if lancamentos(1,c) == 5 || lancamentos(2,c) == 5
        cfC = cfC +1;
    end
    %D
    if lancamentos(1,c) ~= 1 && lancamentos(2,c) ~= 1
        cfD = cfD+1;
    end
end

probA = cfA/N
probB = cfB/N
probC = cfC/N
probD = cfD/N



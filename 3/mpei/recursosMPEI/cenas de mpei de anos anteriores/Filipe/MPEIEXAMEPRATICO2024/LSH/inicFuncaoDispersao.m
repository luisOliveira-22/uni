function v= inicFuncaoDispersao(m)
% Obter parâmetros para função de dispersão 
 
% fator primo
ff = 1000; % fudge factor
pp = ff * max(m + 1,76);
pp = pp + ~mod(pp,2); % make odd
while (isprime(pp) == false)
    pp = pp + 2;
end
v.p = pp; % primo suficientemente grande

% parâmetros aleatórios
v.a = randi([1,(pp - 1)],1,1);
v.b = randi([0,(pp - 1)],1,1);
v.c = randi([1,(pp - 1)],1,1);
end

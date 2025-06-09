function MHr=aplicarLSH(MH,b,r)
% Calcular a matriz de Assinaturas reduzida aplicando Locality-sensitive hashing (LSH) à matriz de MinHash (MH) usando b bandas de comprimento r

Nl=length(MH);

% Inicializa a função de dispersão a utilizar no LSH
N= 10000;
v= inicFuncaoDispersao(N);
MHr= zeros(b,Nl);   %  matriz reduzida
multiplic=fix(rand(1,r)*v.p);  

h=waitbar(0,'Aplicando funções de dispersão...');
for nu= 1:Nl,
    waitbar(nu/Nl,h);
    % para todas as bandas ...
    for nb= 1:b,   
        banda= MH((1:r)+r*(nb-1),nu);  
        MHr(nb,nu)=mod(multiplic*banda,v.p);
    end
end
delete(h)

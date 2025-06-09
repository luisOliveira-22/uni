ficheiro=fopen("wordlist-preao-20201103.txt");
palavras=textscan(ficheiro,"%s",'delimiter','\n');
palavras=palavras{1};
fclose(ficheiro);

n=8000;
k=3;
chaves=palavras(1:1000);

filtro=inicializarFiltro(n);

for i=1:length(chaves)
    filtro=adicionarElemento(filtro,chaves{i},k);
end


falso_negativos = 0;

for i= 1:length(chaves)
    if ~pertenceConjunto(filtro,chaves{i},k)
        falso_negativos = 1;
    end
end

if falso_negativos == 1
    fprintf("Falso negativo\n");
else
    fprintf("Nenhum falso negativo\n");
end
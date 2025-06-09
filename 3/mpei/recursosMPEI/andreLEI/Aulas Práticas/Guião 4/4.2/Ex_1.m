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
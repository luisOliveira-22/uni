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

chaves=palavras(1001:11001);

falsos_positivos=0;

for i= 1:length(chaves)
    if pertenceConjunto(filtro,chaves{i},k)
        falsos_positivos = falsos_positivos+1;
    end
end

fprintf("Percentagem de falsos positivos %f%%\n",falsos_positivos/length(chaves)*100);
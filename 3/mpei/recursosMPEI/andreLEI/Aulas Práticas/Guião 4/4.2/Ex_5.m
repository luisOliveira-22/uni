ficheiro = fopen("wordlist-preao-20201103.txt");
palavras = textscan(ficheiro,"%s",'delimiter','\n');
palavras = palavras{1};
fclose(ficheiro);

n = 8000;
falsos_positivos_lst = zeros(7,1);
ks = 4:10;

for k= ks
    chaves = palavras(1:100);
    filtro = inicializarFiltro(n);

    for i= 1:length(chaves)
        filtro = adicionarElemento(filtro,chaves{i},k);
    end

    chaves = palavras(1001:11001);
    falsos_positivos = 0;

    for i= 1:length(chaves)
        if pertenceConjunto(filtro,chaves{i},k)
            falsos_positivos = falsos_positivos+1;
        end
    end

    falsos_positivos_lst(k-3) = falsos_positivos/length(chaves)*100;
end

plot(ks,falsos_positivos_lst);
xlabel("k");
ylabel("percentagem de falsos positivos");
fprintf("K ótimo: %d; percentagem de falsos positivos: %f%%\n",ks(falsos_positivos_lst==min(falsos_positivos_lst)),min(falsos_positivos_lst));
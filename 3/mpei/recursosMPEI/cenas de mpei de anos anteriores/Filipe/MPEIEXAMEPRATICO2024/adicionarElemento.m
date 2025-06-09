function filtro = adicionarElemento(filtro,chave,numHashFunc)
    for i= 1:numHashFunc
        chave = [chave num2str(i)];
        code = mod(string2hash(chave),length(filtro))+1;
        filtro(code) = true;
    end
end
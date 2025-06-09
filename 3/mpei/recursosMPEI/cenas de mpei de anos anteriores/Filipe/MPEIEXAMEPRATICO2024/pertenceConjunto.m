function resultado = pertenceConjunto(filtro,chave,numHashFunc)
    resultado = true;
    for i= 1:numHashFunc
        chave = [chave num2str(i)];
        code = mod(string2hash(chave),length(filtro))+1;
        if ~filtro(code)
            resultado = false;
            break
        end
    end
end
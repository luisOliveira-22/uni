clear all;
clc;

udata = load("u.data");
data = udata(1:end,1:2); 
clear udata;

users = unique(data(:,1));
numUsers = length(users);

dic = readcell('films.txt', 'Delimiter', '\t');
numFilms = height(dic);

films = getFilms(users,data);
numHash = 100;
matrizMinHashUsers = minHashUsers(users,numHash,films);
distancesUsers = getDistancesMinHashUsers(numUsers,matrizMinHashUsers,numHash);

titles = dic(:,1);
numTitles = length(titles);
numHash = 100;
shingleSize = 3; 
matrizMinHashTitles = minHashTitles(titles,numHash,shingleSize);
distancesTitles = getDistancesMinHashTitles(numTitles,matrizMinHashTitles,numHash);

numHash = 100; 
genres = getGenres(dic);
numGenres = length(genres);
matrizAssGenres = matrizAss(dic,genres);
matrizMinHashGenres = minHash(matrizAssGenres,numHash);
distancesGenres = getDistancesMinHashGenres(numFilms,matrizMinHashGenres,numHash);

filterSize = 1000;
filtro = inicializarFiltro(filterSize);
years = getAllYears(dic);
numYears = length(years);
uniqueYears = unique(years);
numUniqueYears = length(uniqueYears);
numHashFunc = round(filterSize*log(2)/numUniqueYears);
filtro = adicionarElementosFiltro(numYears,years,filtro,numHashFunc,filterSize);

function films = getFilms(users,data)
    numUsers = length(users);
    films = cell(numUsers,1);

    for n = 1:numUsers
        ind = find(data(:,1) == users(n));
        films{n} = [films{n} data(ind,2)];
    end
end

function genres = getGenres(dic)
    genres = {};
    k = 1;

    for i= 1:height(dic)
        for j= 2:7
            if ~anymissing(dic{i,j}) && ~strcmp(dic{i,j},'unknown')
                genres{k} = dic{i,j};
                k = k+1;
            end
        end
    end

    genres = unique(genres);
end

function matrizAss = matrizAss(dic,genres)
    numFilms = height(dic);
    numGenres = length(genres);
    matrizAss = zeros(numGenres,height(dic));

    for i= 1:numGenres
        for n= 1:numFilms
            for k= 2:7
                if ~anymissing(dic{n,k})
                    if strcmp(genres(i),dic{n,k})
                        matrizAss(i,n) = 1;
                    end
                end
            end
        end
    end
end

function matrizMinHashGenres = minHash(matrizAss,numHashFunc)
    p = primes(10000);
    matrizMinHashGenres = zeros(numHashFunc,width(matrizAss));
    kList = p(randperm(length(p),numHashFunc));

    for func= 1:length(kList)
        for d= 1:width(matrizAss)
            matrizMinHashGenres(func,d) = min(mod(find(matrizAss(:,d)==1),kList(func)));
        end
    end

end

function distances = getDistancesMinHashGenres(numFilms,matrizMinHash,numHash) 
    distances = zeros(numFilms,numFilms);
    for n1= 1:numFilms
        for n2= n1+1:numFilms
            distances(n1,n2) = sum(matrizMinHash(:,n1)==matrizMinHash(:,n2))/numHash;
        end
    end
end

function matrizMinHashUsers = minHashUsers(users,numHash,films)
    numUsers = length(users);
    matrizMinHashUsers = inf(numUsers, numHash);
    
    x = waitbar(0,'A calcular minHashUsers()...');
    for k= 1 : numUsers
        waitbar(k/numUsers,x);
        filmsUser = films{k};
        for j = 1:length(filmsUser)
            chave = char(filmsUser(j));
            for i = 1:numHash
                chave = [chave num2str(i)];
                h(i) = DJB31MA(chave, 127);
            end
            matrizMinHashUsers(k, :) = min([matrizMinHashUsers(k, :); h]);
        end
    end
    delete(x);
end

function distances = getDistancesMinHashUsers(numUsers,matrizMinHash,numHash) 
    distances = zeros(numUsers,numUsers);
    for n1= 1:numUsers
        for n2= n1+1:numUsers
            distances(n1,n2) = sum(matrizMinHash(n1,:)==matrizMinHash(n2,:))/numHash;
        end
    end
end

function matrizMinHashTitles = minHashTitles(titles,numHash,shingleSize)
    numTitles = length(titles);
    matrizMinHashTitles = inf(numTitles, numHash);
    
    x = waitbar(0,'A calcular minHashTitles()...');
    for k= 1 : numTitles
        waitbar(k/numTitles,x);
        movie = titles{k};
        for j = 1 : (length(movie) - shingleSize + 1)
            shingle = lower(char(movie(j:(j+shingleSize-1)))); 
            h = zeros(1, numHash);
            for i = 1 : numHash
                shingle = [shingle num2str(i)];
                h(i) = DJB31MA(shingle, 127);
            end
        matrizMinHashTitles(k, :) = min([matrizMinHashTitles(k, :); h]);
        end
    end
    delete(x);
end

function distances = getDistancesMinHashTitles(numTitles,matrizMinHash,numHash) 
    distances = zeros(numTitles,numTitles);
    for n1= 1:numTitles
        for n2= n1+1:numTitles
            distances(n1,n2) = sum(matrizMinHash(n1,:)==matrizMinHash(n2,:))/numHash;
        end
    end
end

function years = getAllYears(dic)
    years = {};
    for i= 1:height(dic)
        titulo = dic{i,1};
        year = extractBetween(titulo, length(titulo)-4, length(titulo)-1);
        years{end+1} = year{1};
    end
end

function filtro = inicializarFiltro(n)
    filtro = zeros(n,1);
end

function filtro = adicionarElemento(filtro,chave,numHashFunc,tablesize)
    for i= 1:numHashFunc
        chave1 = [chave num2str(i)];
        code = mod(string2hash(chave1),tablesize)+1;
        filtro(code) = filtro(code)+1;
    end
end

function h= DJB31MA( chave, seed)
    len= length(chave);
    chave= double(chave);
    h= seed;
    for i=1:len
        h = mod(31 * h + chave(i), 2^32 -1) ;
    end
end

function hash=string2hash(str,type)
    str=double(str);
    if(nargin<2), type='djb2'; end
    switch(type)
        case 'djb2'
            hash = 5381*ones(size(str,1),1); 
            for i=1:size(str,2), 
                hash = mod(hash * 33 + str(:,i), 2^32-1); 
            end
        case 'sdbm'
            hash = zeros(size(str,1),1);
            for i=1:size(str,2), 
                hash = mod(hash * 65599 + str(:,i), 2^32-1);
            end
        otherwise
            error('string_hash:inputs','unknown type');
    end
end

function filtro = adicionarElementosFiltro(numYears,years,filtro,numHashFunc,filterSize)
    for i= 1:numYears
        yearstr = "";
        year1 = years{i};
        yearstr = yearstr+year1;
    
        if yearstr ~= "know" && yearstr ~= ") (V"
            filtro = adicionarElemento(filtro,yearstr,numHashFunc,filterSize);
        end
    end
end
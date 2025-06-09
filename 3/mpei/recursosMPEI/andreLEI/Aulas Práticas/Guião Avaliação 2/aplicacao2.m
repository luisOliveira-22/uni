clc;

current_user = 0;

while(current_user<1 || current_user>943)
    current_user = input('Insert User ID (1 to 943): ');
    if (current_user<1 || current_user>943)
        fprintf("ERROR: Enter a valid ID User\n");
    end
end


clear menu;
menu = menu('Aplicacao', ...
            '1 - Your Movies', ...
            '2 - Films from most similar user', ...
            '3 - Search Title', ...
            '4 - Find most similar films', ...
            '5 - Estimate the number of films from a year', ...
            '6 - Exit');

while(menu ~= 6 && menu ~=0)
    switch menu
        case 1
            watchedFilms = films{current_user};
            numWatchedFilmes = height(watchedFilms);
            
            fprintf("\n---------- MY FILMS ----------\n\n");

            for i= 1:numWatchedFilmes
                idFilm = watchedFilms(i);
                nameFilm = dic(idFilm,1);
                fprintf("(ID: %d) %s\n", idFilm,nameFilm{1});
            end

            fprintf("\n------------------------------\n\n");

        case 2
            min = 1;
            u2 = 0;
            for u2 = current_user+1:numUsers
                if distancesUsers(current_user,u2) < min
                    id = u2;
                    min = distancesUsers(current_user,u2);
                end
            end

            watchedFilms = films{u2};
            numWatchedFilmes = height(watchedFilms);

            fprintf("\n---------- WATCHED FILMS FOR MOST SIMILAR USER ----------\n\n");

            for i= 1:numWatchedFilmes
                idFilm = watchedFilms(i);
                nameFilm = dic(idFilm,1);
                fprintf("(ID: %d) %s\n", idFilm,nameFilm{1});
            end    

            fprintf("\n---------------------------------------------------------\n\n");

        case 3
            search = lower(input('Write a string: ', 's'));

            while (length(search) < shingleSize)
                fprintf('Write a minimum of %d characters\n', shingleSize);
                search = lower(input('Write a string: ', 's'));
            end
            
            fprintf("\n---------- MOST SIMILAR TITLES ----------\n\n");

            searchTitle(search, matrizMinHashTitles, numHash, titles, shingleSize); 

            fprintf("\n-----------------------------------------\n\n");

        case 4
            watchedFilms = films{current_user};
            numWatchedFilmes = height(watchedFilms);
            
            fprintf("\n---------- MY FILMS ----------\n\n");

            for i= 1:numWatchedFilmes
                idFilm = watchedFilms(i);
                nameFilm = dic(idFilm,1);
                fprintf("(ID: %d) %s\n", idFilm,nameFilm{1});
            end

            fprintf("\n------------------------------\n\n");
    
            verificador = false;
            while verificador == false
                verificador = false;
                filmIdInput = input('Choose a film ID: ');
                for i= 1:numWatchedFilmes
                    idFilm = watchedFilms(i);
                    if filmIdInput == idFilm
                        verificador = true;
                    end
                end

                if verificador == false
                    fprintf("ERROR: Enter a valid film ID\n");
                end
            end

            fprintf("\n-----------------------------\n\n");
            
        case 5
            year = 0;
            while(year<=0 || year>2023)
                year = input('Insert year (0 to current year): ');
                if (year<1 || year>2023)
                    fprintf("ERROR: Enter a valid year\n");
                end
            end
            
            yearUserStr = ""+year;

            quantidade = pertenceConjunto(filtro,yearUserStr,numHashFunc,filterSize);

            fprintf("There are %d movies from this year\n",quantidade);

            fprintf("\n-------------------------------------------\n\n");
    end
    
    clear menu;
    menu = menu('Aplicacao', ...
            '1 - Your Movies', ...
            '2 - Films from most similar user', ...
            '3 - Search Title', ...
            '4 - Find most similar films', ...
            '5 - Estimate the number of films from a year', ...
            '6 - Exit');  
end

function resultado = pertenceConjunto(filtro,chave,numHashFunc,tablesize)
    res = zeros(numHashFunc,1);
    for i= 1:numHashFunc
        chave1 = [chave num2str(i)];
        code = mod(string2hash(chave1),tablesize)+1;
        res(i) = filtro(code);
    end
    resultado = min(res);
end

function searchTitle(search, matrizMinHashTitles, numHash, titles, shingleSize)
    minHashSearch = inf(1, numHash);
    for j = 1 : (length(search) - shingleSize + 1)
        shingle = char(search(j:(j+shingleSize-1))); 
        h = zeros(1, numHash);
        for i = 1 : numHash
            shingle = [shingle num2str(i)];
            h(i) = DJB31MA(shingle, 127);
        end
        minHashSearch(1, :) = min([minHashSearch(1, :); h]);
    end
   
    threshold = 0.99;
    [similarTitles,distancesTitles,k] = filterSimilar(threshold,titles,matrizMinHashTitles,minHashSearch,numHash);
         
    if (k == 0)
        disp('No results found');
    elseif (k > 5)
        k = 5;
    end
    
    distances = cell2mat(distancesTitles);
    [distances, index] = sort(distances);
    
    for h = 1 : k
        fprintf('%s - Distância: %.3f\n', similarTitles{index(h)}, distances(h));
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

function [similarTitles,distancesTitles,k] = filterSimilar(threshold,titles,matrizMinHashTitles,minHash_search,numHash)
    similarTitles = {};
    distancesTitles = {};
    numTitles = length(titles);
    k=0;
    for n = 1 : numTitles
        distancia = 1 - (sum(minHash_search(1, :) == matrizMinHashTitles(n,:)) / numHash);
        if (distancia < threshold)
            k = k+1;
            similarTitles{k} = titles{n};
            distancesTitles{k} = distancia;
        end
    end
end
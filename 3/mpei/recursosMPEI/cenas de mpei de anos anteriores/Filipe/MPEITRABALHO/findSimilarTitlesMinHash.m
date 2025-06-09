function findSimilarTitlesMinHash(databaseFile)
    data = readtable(databaseFile, 'TextType', 'string');
    titles = data.title;

    numHashes = 100;
    shinglesSize = 2;
    similarityThreshold = 0.1;

    signatures = zeros(height(data), numHashes);

    h = waitbar(0, 'Processing titles...');

    for i = 1:height(data)
        title = preprocessTitle(titles(i));
        shingles = generateShingles(title, shinglesSize);
        signatures(i,:) = computeMinHashSignature(shingles, numHashes);
        
        waitbar(i/height(data), h);
    end

    close(h);

    userTitle = input('Enter title to check: ', 's');
    userTitle = preprocessTitle(userTitle);

    h = waitbar(0, 'Calculating similarities...');

    similarities = computeWordBasedSimilarity(userTitle, titles, h);
    [sortedSim, indices] = sort(similarities, 'descend');

    close(h);

    displaySimilarTitles(data, sortedSim, indices, similarityThreshold);
end

function similarity = computeWordBasedSimilarity(userTitle, titles, h)
    similarity = zeros(length(titles), 1);
    
    userTitle = normalizeString(userTitle);
    titles = arrayfun(@normalizeString, titles);
    
    for i = 1:length(titles)
        if strcmp(userTitle, titles(i))
            similarity(i) = 1.0;
            continue;
        end
        
        userWords = unique(split(userTitle));
        titleWords = unique(split(titles(i)));
        
        intersection = sum(ismember(userWords, titleWords));
        union = length(unique([userWords; titleWords]));
        
        if union > 0
            similarity(i) = intersection / union;
        end

        if mod(i, 100) == 0
            waitbar(i/length(titles), h);
        end
    end
end

function str = normalizeString(str)
    str = lower(str);
    
    str = regexprep(str, '[^a-z0-9\s]', '');
    
    str = regexprep(str, '\s+', ' ');
    
    str = strtrim(str);
end

function title = preprocessTitle(title)
    title = lower(title);
    
    title = regexprep(title, '[^a-z0-9\s]', '');
    
    title = regexprep(title, '\s+', ' ');
    
    title = strtrim(title);
end

function shingles = generateShingles(text, k)
    shingles = {};
    words = strsplit(text);
    if length(words) >= k
        for i = 1:(length(words)-k+1)
            shingle = strjoin(words(i:i+k-1));
            shingles{end+1} = shingle; %#ok<AGROW>
        end
    else
        shingles{1} = strjoin(words);
    end
end

function signature = computeMinHashSignature(shingles, numHashes)
    signature = inf(1, numHashes);
    for i = 1:numHashes
        for j = 1:length(shingles)
            hashValue = string2hash(shingles{j}, 'djb2', i);
            signature(i) = min(signature(i), hashValue);
        end
    end
end

function displaySimilarTitles(data, similarities, indices, threshold)
    fprintf('\nSimilar titles found:\n');
    for i = 1:min(5, length(indices))
        if similarities(i) >= threshold
            fprintf('%.2f%% similar: %s\n', ...
                similarities(i)*100, ...
                data.title(indices(i)));
        end
    end
end

function hash = string2hash(str, method, seed)
    if nargin < 3
        seed = 0;
    end
    if strcmp(method, 'djb2')
        hash = seed;
        for i = 1:length(str)
            hash = mod(hash * 33 + double(str(i)), 2^32);
        end
    else
        error('Unknown hashing method');
    end
end

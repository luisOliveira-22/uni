function FamoustitlesWithBloomFilter(databaseFile)
    data = readtable(databaseFile, 'TextType', 'string');
    
    expectedItems = height(data);
    desiredFPRate = 0.01;
    filterSize = ceil(-(expectedItems * log(desiredFPRate)) / (log(2)^2));
    numHashes = ceil((filterSize/expectedItems) * log(2));
    
    bf = false(1, filterSize);
    
    for i = 1:height(data)
        if ~ismissing(data.title(i)) && ~ismissing(data.tweet_num(i))
            key = strcat(data.title(i), '_', num2str(data.tweet_num(i)));
            isFamous = data.tweet_num(i) > 50;
            
            if isFamous
                [bf, wasPresent] = checkAndAddToFilter(bf, key, numHashes);
                if ~wasPresent
                    fprintf('New famous article: %s\n', data.title(i));
                end
            end
        end
    end
end

function [bf, wasPresent] = checkAndAddToFilter(bf, key, numHashes)
    positions = computeHashPositions(bf, key, numHashes);
    wasPresent = all(bf(positions));
    bf(positions) = true;
end

function positions = computeHashPositions(bf, key, numHashes)
    positions = zeros(1, numHashes);
    filterSize = length(bf);
    
    for i = 1:numHashes
        h1 = string2hash(key, 'djb2', i);
        h2 = string2hash(key, 'sdbm', i + numHashes);
        positions(i) = mod(h1 + i * h2, filterSize) + 1;
    end
end
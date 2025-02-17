function test_bloomFilter()
    fprintf('Starting Bloom Filter tests...\n\n');
    
    % Test different Bloom Filter sizes with different hash counts
    sizes = [1000, 10000, 100000];
    hashCounts = [3, 5, 7];
    
    for i = 1:length(sizes)
        fprintf('Testing Bloom Filter with size %d and %d hash functions\n', ...
            sizes(i), hashCounts(i));
        runBloomFilterTest(sizes(i), hashCounts(i));
        fprintf('\n');
    end
    
    testWithRealData('FakeNewsNet.csv');
    testPerformance();
end

function runBloomFilterTest(filterSize, numHashes)
    bf = false(1, filterSize);
    
    insertSet = arrayfun(@(x) sprintf('insert_%d_%d', x, randi([1, 1e6])),1:100, 'UniformOutput', false);
    querySet = arrayfun(@(x) sprintf('query_%d_%d', x, randi([2e6, 3e6])),1:100, 'UniformOutput', false);
    
    for i = 1:length(insertSet)
        positions = calculatePositions(insertSet{i}, numHashes, filterSize);
        bf(positions) = true;
    end
    
    falsePositives = 0;
    for i = 1:length(querySet)
        positions = calculatePositions(querySet{i}, numHashes, filterSize);
        if all(bf(positions))
            falsePositives = falsePositives + 1;
        end
    end
    
    fprintf('False positive rate: %.2f%%\n', (falsePositives/length(querySet))*100);
end

function testData = generateTestData(prefix, count)
    testData = cell(1, count);
    for i = 1:count
        testData{i} = sprintf('%s_data_%d_%d', prefix, i, randi(1e6));
    end
end

function testWithRealData(dataFile)
    fprintf('\nTesting with real data from %s\n', dataFile);
    
    try
        data = readtable(dataFile, 'TextType', 'string');
        uniqueTitles = unique(data.title);
        
        filterSize = length(uniqueTitles) * 10;
        numHashes = 5;
        bf = false(1, filterSize);
        
        midPoint = floor(length(uniqueTitles)/2);
        insertSet = uniqueTitles(1:midPoint);
        testSet = uniqueTitles(midPoint+1:end);
        
        for i = 1:length(insertSet)
            positions = calculatePositions(char(insertSet(i)), numHashes, filterSize);
            bf(positions) = true;
        end
        
        duplicates = 0;
        for i = 1:length(testSet)
            positions = calculatePositions(char(testSet(i)), numHashes, filterSize);
            if all(bf(positions))
                duplicates = duplicates + 1;
            end
        end
        
        fprintf('Processed %d unique titles\n', length(uniqueTitles));
        fprintf('Detected %d potential duplicates\n', duplicates);
        
    catch ME
        fprintf('Error testing with real data: %s\n', ME.message);
    end
end

function testPerformance()
    fprintf('\nPerformance Test\n');
    
    % Test parameters
    numItems = 1000;
    filterSize = numItems * 10;
    numHashes = 5;
    bf = false(1, filterSize);
    
    testData = generateTestData('perf', numItems);
    
    tic;
    for i = 1:numItems
        positions = calculatePositions(testData{i}, numHashes, filterSize);
        bf(positions) = true;
    end
    insertTime = toc;
    
    tic;
    for i = 1:numItems
        positions = calculatePositions(testData{i}, numHashes, filterSize);
        all(bf(positions));
    end
    lookupTime = toc;
    
    fprintf('Average insertion time: %.6f seconds per item\n', insertTime/numItems);
    fprintf('Average lookup time: %.6f seconds per item\n', lookupTime/numItems);
end

function positions = calculatePositions(key, numHashes, filterSize)
    positions = zeros(1, numHashes);
    
    keyBytes = double(uint8(key));
    keySum = sum(keyBytes);
    
    for i = 1:numHashes
        prime1 = getPrime(i);
        prime2 = getPrime(i + numHashes);
        
        hash = mod(keySum * prime1 + sum(keyBytes .* (1:length(keyBytes))') * prime2, filterSize);
        positions(i) = double(hash(1)) + 1;
    end
end

function prime = getPrime(n)
    primes = [31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97];
    prime = primes(mod(n-1, length(primes)) + 1);
end
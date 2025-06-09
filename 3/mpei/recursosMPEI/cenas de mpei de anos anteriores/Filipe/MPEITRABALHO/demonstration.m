% Fake News Detection System Demonstration
fprintf('=== Fake News Detection System Demo ===\n\n');

% 1. Ler e preparar Data
dataFile = 'FakeNewsNet.csv';
fprintf('1. Loading data from %s...\n', dataFile);
data = readtable(dataFile, 'TextType', 'string');
fprintf('Loaded %d news articles.\n\n', height(data));

% 2. Treinar o NaiveBayes
fprintf('2. Training Naive Bayes Model...\n');
naiveBayesModel(dataFile);
fprintf('Testing Naive Bayes Model...\n');
test_naiveBayesModel('naiveBayesModel.mat');
fprintf('\n');

% 3. Classificar dominios
fprintf('\n5. Classifying News Domains...\n');
classifyDomains(dataFile, 'naiveBayesModel.mat');

% 4. Inicializar bloom filter
fprintf('3. Processing Popular Articles with Bloom Filter...\n');
FamoustitlesWithBloomFilter(dataFile);
fprintf('\n');

% 5. Encontrar artigos similares usando Minhash
fprintf('4. MinHash Similarity Detection...\n');

for i = 1:2
    fprintf('\n==> Checking similarities to:"\n');
    findSimilarTitlesMinHash(dataFile);
end

% 6. Final Summary
fprintf('\n=== System Performance Summary ===\n');
fprintf('- Naive Bayes Classification completed\n');
fprintf('- Popular articles identified with Bloom Filter\n');
fprintf('- Similar articles detected with MinHash\n');
fprintf('- Domain trust levels evaluated\n');
fprintf('\nDemo completed successfully!\n');
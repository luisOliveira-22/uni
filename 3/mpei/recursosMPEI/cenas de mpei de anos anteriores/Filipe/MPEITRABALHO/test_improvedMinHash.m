databaseFile = 'FakeNewsNet.csv';

findSimilarTitlesMinHash(databaseFile);

testTitles = {
    'Breaking news about covid vaccine',
    'Breaking news: new covid vaccine announced',
    'Weather forecast for tomorrow'
};

fprintf('\nTest Results:\n');
for i = 1:length(testTitles)
    fprintf('\nSearching for similar titles to: %s\n', testTitles{i});
    findSimilarTitlesMinHash(databaseFile);
end
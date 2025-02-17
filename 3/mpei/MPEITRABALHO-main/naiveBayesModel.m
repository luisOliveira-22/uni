function naiveBayesModel(databaseFile)
    % Load data
    data = readtable(databaseFile, 'TextType', 'string');
    
    % Extract and preprocess features
    titles = lower(strtrim(string(data.title)))';
    domains = lower(data.source_domain)';
    labels = categorical(data.real)';
    
    % Remove invalid entries
    validRows = ~ismissing(domains) & domains ~= "na" & titles ~= "";
    titles = titles(validRows);
    domains = domains(validRows);
    labels = labels(validRows);
    
    % Enhanced feature extraction
    numInstances = length(titles);
    numFeatures = 10;  % Increased to 10 features
    features = zeros(numInstances, numFeatures);
    
    for i = 1:numInstances
        % Domain features
        features(i,1) = string2hash(domains(i));
        
        % Title length feature
        features(i,2) = strlength(titles(i));
        
        % Word count feature
        features(i,3) = count(titles(i), ' ') + 1;
        
        % Punctuation ratio
        features(i,4) = sum(isstrprop(char(titles(i)), 'punct')) / strlength(titles(i));
        
        % Uppercase ratio
        features(i,5) = sum(isstrprop(char(titles(i)), 'upper')) / strlength(titles(i));
        
        % Average word length
        words = split(titles(i));
        features(i,6) = mean(strlength(words));
        
        % Special characters ratio
        features(i,7) = sum(~isstrprop(char(titles(i)), 'alphanum')) / strlength(titles(i));
        
        % New features
        % Exclamation mark count
        features(i,8) = count(titles(i), "!");
        
        % Question mark count
        features(i,9) = count(titles(i), "?");
        
        % Number ratio
        features(i,10) = sum(isstrprop(char(titles(i)), 'digit')) / strlength(titles(i));
    end
    
    % Advanced normalization using robust statistics
    for j = 1:size(features,2)
        if range(features(:,j)) > 0
            median_val = median(features(:,j));
            mad_val = mad(features(:,j), 1);
            features(:,j) = (features(:,j) - median_val) / (mad_val + eps);
        end
    end
    
    % Enhanced probability calculations
    classLabels = categories(labels);
    numClasses = numel(classLabels);
    priors = zeros(numClasses, 1);
    
    for i = 1:numClasses
        priors(i) = (sum(labels == classLabels(i)) + 3) / (numInstances + 6);
    end
    
    % Improved conditional probabilities with adaptive smoothing
    condProbs = zeros(numClasses, size(features, 2));
    for i = 1:numClasses
        classInstances = features(labels == classLabels(i), :);
        feature_vars = var(classInstances);
        smoothing_factors = 0.1 ./ (feature_vars + 0.1);
        condProbs(i, :) = (mean(classInstances, 1) + smoothing_factors) ./ (1 + smoothing_factors);
    end
    
    model.priors = priors;
    model.condProbs = condProbs;
    model.classLabels = classLabels;
    model.features = features;
    save('naiveBayesModel.mat', 'model');
    
    fprintf('Enhanced model trained with %d features.\n', numFeatures);
end
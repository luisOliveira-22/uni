function classifyDomains(databaseFile, naiveBayesModel)
    data = readtable(databaseFile, 'TextType', 'string');
    load(naiveBayesModel, 'model'); 

    domainTrustList = table('Size', [0 2], 'VariableTypes', {'string', 'logical'}, 'VariableNames', {'Domain', 'IsTrusted'});
    
    fakeNewsCount = containers.Map('KeyType', 'char', 'ValueType', 'int32');
    trustedNewsCount = containers.Map('KeyType', 'char', 'ValueType', 'int32');
    
    for i = 1:height(data)
        domain = string(data.source_domain{i});
        
        % Exibição para depuração para verificar o domínio extraído
        % fprintf('Entrada %d - Domínio extraído: "%s"\n', i, domain);
        
        if strcmp(domain, 'Invalid URL')
            % fprintf('Pulando domínio inválido na entrada %d: "%s"\n', i, domain);
            continue;
        end
        
        % Extrair o título (se disponível)
        if ismember('title', data.Properties.VariableNames)
            title = data.title{i};
        else
            title = "default"; 
        end
        
        if any(ismissing(title)) || strlength(title) == 0
            title = "default";
        end
        
        domainHash = string2hash(domain);
        titleHash = string2hash(title);
        featureVector = [mod(domainHash, 100), mod(titleHash, 100)];
        
        prediction = predictNaiveBayes(model, featureVector);
        
        realValue = data.real(i);
        
        if realValue == 1
            if isKey(trustedNewsCount, domain)
                trustedNewsCount(domain) = trustedNewsCount(domain) + 1;
            else
                trustedNewsCount(domain) = 1;
            end
        else
            if isKey(fakeNewsCount, domain)
                fakeNewsCount(domain) = fakeNewsCount(domain) + 1;
            else
                fakeNewsCount(domain) = 1;
            end
        end
        
        if ~any(domainTrustList.Domain == domain)
            domainTrustList = [domainTrustList; {domain, false}];
        end
    end
    
    for i = 1:height(domainTrustList)
        domain = domainTrustList.Domain{i};
        
        if isKey(trustedNewsCount, domain)
            trustedCount = trustedNewsCount(domain);
        else
            trustedCount = 0;
        end
        
        if isKey(fakeNewsCount, domain)
            fakeCount = fakeNewsCount(domain);
        else
            fakeCount = 0;
        end
        
        if trustedCount > 2 * fakeCount
            domainTrustList.IsTrusted(i) = true; % Marca como confiável
            % fprintf('Domínio "%s" é confiável (mais do dobro de notícias reais).\n', domain);
        else
            domainTrustList.IsTrusted(i) = false; % Marca como não confiável
            % fprintf('Domínio "%s" não é confiável (não tem mais do dobro de notícias reais).\n', domain);
        end
    end
    
    disp('Lista de Confiança dos Domínios:');
    disp(domainTrustList);
end

function prediction = predictNaiveBayes(model, featureVector)
    numClasses = numel(model.classLabels);
    classLogProbs = log(model.priors);
    
    for classIdx = 1:numClasses
        for featureIdx = 1:length(featureVector)
            if featureVector(featureIdx) == 1
                classLogProbs(classIdx) = classLogProbs(classIdx) + log(model.condProbs(classIdx, featureIdx));
            end
        end
    end
    
    [~, predictedClassIdx] = max(classLogProbs);  
    prediction = model.classLabels(predictedClassIdx); 
    
    if iscell(prediction)
        prediction = prediction{1};
    end
end

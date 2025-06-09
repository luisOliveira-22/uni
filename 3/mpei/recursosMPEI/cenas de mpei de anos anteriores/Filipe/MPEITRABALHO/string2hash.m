function hash = string2hash(str, type, seed)
    if ~isstring(str) || isempty(str) || str == "NA" || strtrim(str) == ""
        str = "default";
    end

    str = convertStringsToChars(str);

    if nargin < 3
        seed = 1;
    end
    hash = uint32(seed);

    validTypes = ["djb2", "sdbm"];
    if nargin < 2
        type = 'djb2';
    elseif ~ismember(type, validTypes)
        error('Tipo de hash desconhecido. Use "djb2" ou "sdbm".');
    end

    switch type
        case 'djb2'
            for i = 1:numel(str)
                hash = mod(hash * 33 + uint32(str(i)) + seed, 2^32 - 1);
            end
        case 'sdbm'
            for i = 1:numel(str)
                hash = mod(hash * 65599 + uint32(str(i)) + seed, 2^32 - 1);
            end
    end
end
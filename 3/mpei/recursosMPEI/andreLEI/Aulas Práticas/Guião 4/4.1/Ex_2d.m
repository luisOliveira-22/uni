hashTableSizes = [5*1e5 1e6 2*1e6];

N = 1e5;
chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
i_min = 6;
i_max = 20;
strings = randStringArray(N,i_min,i_max,chars);

resultados = cell(4,3);
colisoes = zeros(4,3);
tempos=zeros(4,3);
codes1 = zeros(4,N);
codes2 = zeros(4,N);
codes3 = zeros(4,N);

for i= 1:3
    fprintf("string2hash(djb2):\n");
    tic;
    hash_table = zeros(hashTableSizes(i),1);
    for j= 1:N
        code = mod(string2hash(strings{j},'djb2'),hashTableSizes(i))+1;
        hash_table(code) = hash_table(code)+1;

        if i == 1
            codes1(1,j) = code;
        elseif i == 2
            codes2(1,j) = code;
        else
            codes3(1,j) = code;
        end
    end
    resultados{1,i} = hash_table;
    numColisoes = sum(hash_table(hash_table>1));
    fprintf("\tNúmero de colisões para Hash Table de tamanho %d: %d\n",hashTableSizes(i),numColisoes)
    colisoes(1,i) = numColisoes;
    tempos(1,i)=toc;
    fprintf("\tElapsed time: %f\n\n",tempos(1,i));

    fprintf("string2hash(sdbm):\n");
    tic;
    hash_table = zeros(hashTableSizes(i),1);
    for j= 1:N
        code = mod(string2hash(strings{j},'sdbm'),hashTableSizes(i))+1;
        hash_table(code) = hash_table(code)+1;

        if i == 1
            codes1(2,j) = code;
        elseif i == 2
            codes2(2,j) = code;
        else
            codes3(2,j) = code;
        end
    end
    resultados{2,i} = hash_table;
    numColisoes = sum(hash_table(hash_table>1));
    fprintf("\tNúmero de colisões para Hash Table de tamanho %d: %d\n",hashTableSizes(i),numColisoes)
    colisoes(2,i) = numColisoes;
    tempos(2,i)=toc;
    fprintf("\tElapsed time: %f\n\n",tempos(2,i));

    fprintf("hashstring:\n");
    tic;
    hash_table=zeros(hashTableSizes(i),1);
    for j= 1:N
        code = hashstring(strings{j},hashTableSizes(i))+1;
        hash_table(code) = hash_table(code)+1;

        if i == 1
            codes1(3,j) = code;
        elseif i == 2
            codes2(3,j) = code;
        else
            codes3(3,j) = code;
        end
    end
    resultados{3,i} = hash_table;
    numColisoes = sum(hash_table(hash_table>1));
    fprintf("\tNúmero de colisões para Hash Table de tamanho %d: %d\n",hashTableSizes(i),numColisoes)
    colisoes(3,i) = numColisoes;
    tempos(3,i)=toc;
    fprintf("\tElapsed time: %f\n\n",tempos(3,i));

    fprintf("DJB31MA:\n");
    tic;
    hash_table = zeros(hashTableSizes(i),1);
    for j= 1:N
        code = mod(DJB31MA(strings{j},13),hashTableSizes(i))+1;
        hash_table(code) = hash_table(code)+1;

        if i == 1
            codes1(4,j) = code;
        elseif i == 2
            codes2(4,j) = code;
        else
            codes3(4,j) = code;
        end
    end
    resultados{4,i} = hash_table;
    numColisoes = sum(hash_table(hash_table>1));
    fprintf("\tNúmero de colisões para Hash Table de tamanho %d: %d\n",hashTableSizes(i),numColisoes)
    colisoes(4,i) = numColisoes;
    tempos(4,i)=toc;
    fprintf("\tElapsed time: %f\n\n",tempos(4,i));
end
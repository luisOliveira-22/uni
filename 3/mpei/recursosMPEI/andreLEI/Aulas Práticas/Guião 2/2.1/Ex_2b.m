N = 1e5;
n = 20;
m = 100;
cf = 0;

lancamentos = randi(m,n,N);

for k=1:N
    sem_rep = unique(lancamentos(:,k));  
    if length(sem_rep)~=20
        cf = cf+1;
    end
end

prob = cf/N
N = 1e5;
prob = 0;
n = 1;
d  = 365;

while prob < 0.9
    n = n + 1;
    % calculo dos alvos
    dias = randi(d ,n ,N);

    cf = 0;
    for c = 1:N
        if length(unique(dias(:,c))) ~= n
            cf = cf + 1;
        end
    end

prob = cf/N;

end
fprintf('numero de pessoas %d \n', n);
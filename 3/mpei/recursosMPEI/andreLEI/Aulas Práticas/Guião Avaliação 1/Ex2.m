load("L.mat");

%% a)
% Sendo L uma matriz 100x100
disp("O valor de N é:")
N = size(L)
S=sum(L);
disp("Os dead-dens são:")
find(S==0)

%% b)
H=zeros(N(1),N(1));
n=0;
for i=1:100
    n=sum(L(:,i));
    H(:,i)=L(:,i)/n;
end

disp("A matriz H é:");
H

%% c) 
disp("A matriz H é:")
b=0.80;
A=b*H+(1-b)*(ones(N(1),N(1))/N(1))

%% d)

r = (ones(1,N(1))/N(1))';
r2=H.*r

%% e)
for i = 1:length(r2)
    if r2(i) > 0.015
        fprintf("A pagina %d tem um pagerank superior a 0.015 \n", i)
    end
end
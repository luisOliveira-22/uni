N=1e6;
M2=rand(2,N);
M4=rand(4,N);

falhar2=M2<0.3;
falhar4=M4<0.3;


cair2=sum(sum(falhar2)>1);
cair4=sum(sum(falhar4)>2);

probCair2=cair2/N
probCair4=cair4/N

%% Gráfico

p = logspace(-3,log10(1/2),100);

probc2 = zeros(1,100);
probc4 = zeros(1,100);
i = 1;

for f = p
        
    probc2(i) = prob_teorica(2,2,f);
    probc4(i) = prob_teorica(3,4,f) + prob_teorica(4,4,f);
    i = i + 1;

end

plot(p,probc2)
hold on 
plot(p, probc4)
hold off

legend('2 motores','4 motores')
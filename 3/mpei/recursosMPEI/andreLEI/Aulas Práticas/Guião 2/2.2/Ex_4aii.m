Sx=0:5;
N=1e6;

defeito=rand(5,N)<0.3;

defeito0=sum(sum(defeito) == 0);
defeito1=sum(sum(defeito) == 1);
defeito2=sum(sum(defeito) == 2);
defeito3=sum(sum(defeito) == 3);
defeito4=sum(sum(defeito) == 4);
defeito5=sum(sum(defeito) == 5);

prob0=defeito0/N;
prob1=defeito1/N;
prob2=defeito2/N;
prob3=defeito3/N;
prob4=defeito4/N;
prob5=defeito5/N;

probs = [prob0 prob1 prob2 prob3 prob4 prob5];

probs1=cumsum(probs);
stairs([-1 Sx 6],[0 probs1 1])
axis([-1 6 0 1.2])
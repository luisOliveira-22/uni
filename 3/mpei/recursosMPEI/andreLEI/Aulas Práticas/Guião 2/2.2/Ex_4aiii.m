Sx=0:5;
N=1e6;

defeito=rand(5,N)<0.3;

defeitomax2=sum(sum(defeito) <= 2);
pmax2 = defeitomax2/N
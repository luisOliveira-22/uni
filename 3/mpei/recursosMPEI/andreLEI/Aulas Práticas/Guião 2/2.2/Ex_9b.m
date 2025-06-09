N=1e5;
media=14;
desvio=2;

X = randn(1,N);
Y=X* desvio + media;

notas10a18 = sum(Y>10 & Y<18);
prob10a18=notas10a18/N

prob_teo_10a18=normcdf(18,14,2)-normcdf(10,14,2)
N=1e5;
media=14;
desvio=2;

X = randn(1,N);
Y=X* desvio + media

notas12a16 = sum(Y>12 & Y<16);
prob12a16=notas12a16/N

prob_teo_12a16=normcdf(16,media,desvio)-normcdf(12,media,desvio)
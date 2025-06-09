N=1e5;
media=14;
desvio=2;

X = randn(1,N);
Y=X* desvio + media;

notas10 = sum( Y>=10);
prob10=notas10/N

prob_teo_10=1-normcdf(10,14,2)
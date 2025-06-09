N = 1e5;

andre = rand(20,N) <=0.1;
bruno = rand(30, N)<=0.05;
carlos = rand(50, N)<=0.001;

M = [andre; bruno; carlos];
P_A = 20/(20+30+50); %probabilidade de o andre ser escolhido
P_B = 30/(20+30+50);; %probabilidade de o bruno ser escolhido
P_C = 50/(20+30+50);; %probabilidade de o carlos ser escolhido

PE_A=0.01; %P(Erro|André)
PE_B=0.05; %P(Erro|Bruno)
PE_C=0.001; %P(Erro|Carlos)

PE= sum(sum(M))/(N*100); %calcula todas os bugs, distribuídos por o número total de programas

PFC = (P_C * PE_C)/PE
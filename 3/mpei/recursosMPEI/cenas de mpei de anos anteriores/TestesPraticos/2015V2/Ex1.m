%%Ex 1

%a)
  display("A)")
  T = [ 0.01 0.07 0.02 ;
        0.04   0  0.08 ;
        0.04 0.15 0.09 ;
        0.01 0.20 0.01 ];
  
  Beta = 1 - sum(T(:))
  T(T==0) = Beta

%b)
  display("\nB)")
  
  pX = zeros(1,4); pY = zeros(1,3);
  for j = 1 : 4
    pX(j) = sum(T(j,:));
  endfor    
  for j = 1 : 3
    pY(j) = sum(T(:,j));
  endfor   
  
  pX
  pY


%c)
  display("\nC)")
  Ex = 0; Ex2 = 0; X = [1 2 3 4];
  Ey2 = 0; Ey = 0; Y = [0 2 3];
  for j = 1 : 4
    Ex += pX(j) * X(j);
    Ex2 += pX(j) * X(j)^2;
  endfor    
  Ex
  varX = Ex2 - Ex^2
  
  for j = 1 : 3
    Ey += pY(j) * Y(j);
    Ey2 += pY(j) * Y(j)^2;
  endfor    
  Ey
  varY = Ey2 - Ey^2

  
%d)
  display("\nD)")
  ind = 1;
  for i = 1 : 4
    for j = 1 : 3
      if(abs(T(i,j)-(pX(i)*pY(j)))>1e-5)
        ind=0;
        break;
      endif 
    endfor  
    if(ind==0)
      break;
    endif  
  endfor 
  
  ind
%e)
  display("\nD)")
  corr=0;
  for m = 1 : length(X)
    for n = 1 : length(Y)
      corr+=X(m)*Y(n)*T(m,n);
    endfor
  endfor
  
  %Corr = E[XY] = sum(sum(p(X=x,Y=y)*X(x)*Y(y)))
  corr
  %covariancia = Corr - E[X]*E[Y]
  cov = corr - Ex*Ey
  %coefCorrelacao = Cov / DesvioPadrao(X)*DesvioPadra(Y) = Cov/sqrt(Var(X)*Var(Y))
  coefCorr = cov/sqrt(var(X)*var(Y))
%f)
  display("\nE)")
  corr=0;
  for m = 1 : length(Y)
    for n = 1 : length(X)
      corr+=sqrt(X(n)+1)*Y(m)^2*T(n,m);
    endfor
  endfor
  
  corr
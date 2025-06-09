%%Ex 1

%a)
  display("A)")
  T = [ 0.01 0.07 0.02 ;
        0.04   0  0.08 ;
        0.04 0.15 0.09 ;
        0.01 0.20 0.01 ];
  
  Beta = 1 - sum(T(:))

%b)
  display("\nB)")
  
  T(T==0) = Beta;
  px = [];
  for i = 1 : size(T)(1)
    px = [px sum(T(i,:))]
  endfor
  display("");
  py = [];
  for i = 1 : size(T)(2)
    py = [py sum(T(:,i))]
  endfor

%c)
  display("\nC)")
  
  E = 0;
  E2 = 0;
  X = [1 2 3 4];
  Y = [0 2 3];
  
  
  for j = 1 : 2
    for i = 1 : size(T)(j)
      if(j==1)
        E += px(i)*X(i);
        E2 += X(i)^2 * px(i);    
      else
        E += py(i)*Y(i);
        E2 += Y(i)^2 * py(i);          
      endif
    endfor   
    E
    Var = E2 - E^2
    E=0;E2=0;
  endfor

  
%c)
  display("\nC)")
  ind = 1;
  
  for i = 1 : size(T)(1)
    for j = 1 : size(T)(2)
      if(T(i,j) != (px(i)*py(j)))
        ind=0;
        break;
      endif
    endfor
    
    if(ind==0)
      break;
    endif
  endfor
  
  if ind
    display("Independentes")
  else
    display("Nao independentes")
  endif

%d)
  display("\nD)")
  corr=0;
  for m = 1 : size(T)(1)
    for n = 1 : size(T)(2)
      corr+=X(m)*Y(n)*T(m,n);
    endfor
  endfor
  
  corr
  cov = corr - 2.62*2
  coef = cov/(sqrt(0.87560)*sqrt(0.6))
  
%e)
  for m = 1 : size(T)(2)
    for n = 1 : size(T)(1)
      corr+=Y(m)^2*sqrt(X(n)-1)*T(n,m);
    endfor
  endfor
  
  corr
  

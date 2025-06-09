%%Ex 2

%a)
  a = 1-0.1-0.05-0.01;
  b = 1-0.1-0.1-0.1;
  c = 1-0.2;
  d = 1-0.5-0.1-0.1;

  T = [ a   0.1 0.0 0.5;
       0.10  b  0.0 0.1;
       0.05 0.1  c  0.1;
       0.01 0.1 0.2  d ];
  
  %x0 - Antes de 1 de Janeiro de 2014
  ton0 = [1 2 10 5]'
  x0 = ton0./sum(ton0);
  %x1 - 1 de Janeiro (mes = 1)
  %x2 - 1 de Fevereiro (mes = 2)
  %...
  %x8 - 1 de Agosto (mes = 8)
  
  x8  = T^8*x0;
  ton8 = x8.*(sum(ton0))

  

  
%b)
  %M = [T - eye(size(T)) ; ones(1,size(T)(1))]
  %xEst = zeros(size(T)(1)+1,1);
  %xEst(size(T)(1)+1) = 1;
  %xEst = M\xEst;
  
  xMax = x0;
  xn = x0;
  i = 1;
  while 1
    xOld = xn;
    xn = T^i*x0;
    
    if(max(abs(xOld-xn))<1e-5)
      break;
    endif
    
    xMax(xMax<xn) = xn(xn>xMax);
    
    i++;
  endwhile
  

%c)
  xn = x0;
  i = 1;
  while 1
    xn = T^i*x0;

    if(xn(4)*sum(ton0)<2)
      break;
    endif    
    i++;
  endwhile
  
  i
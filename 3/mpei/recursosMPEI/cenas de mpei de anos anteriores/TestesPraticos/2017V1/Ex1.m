%%Ex 1


%a)
  x=1-0.09-0.01;
  y=1-0.4-0.1;
  
  T = [ x    y   y  ;
       0.09 0.4 0.4 ;
       0.01 0.1 0.1 ]
  
  x0 = [0 0 1]'
  
%b)
  x3 = T^3*x0;
  for i = 1 : 3
    x3(i)
  endfor

%c)
  display("");
  
  eps = 1e-3;
  xn = x0;
  iter=1;
  
  while 1
    xOld = xn;
    xn = T^iter*x0;
    
    if(max(abs(xn-xOld)) < eps)
      break;
    endif
    
    iter++;
  endwhile
  
  xn(3)
  1-xn(1)

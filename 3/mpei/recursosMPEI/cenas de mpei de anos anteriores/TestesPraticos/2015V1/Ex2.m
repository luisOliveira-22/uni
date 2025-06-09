%%Ex 2

%a)
  total = 1+2+10+5;
  
  x0 = [1 2 10 5]'./total
  
%b)
  T = [0.84 0.1 0.0 0.5;
       0.10 0.7 0.0 0.1;
       0.05 0.1 0.8 0.1 ;
       0.01 0.1 0.2 0.3];
  
  
  xMax = x0;
  eps = 1e-8;
  xn = x0;
  iter=1;
  
  while 1
    xOld = xn;
    xn = T^iter*x0;

    xMax(xMax<xn) = xn(xn>xMax);

    if(max(abs(xn-xOld)) < eps)
      break;
    endif
        
    iter++;
  endwhile

  xMax
  
%b)
  xn = x0;
  iter=1;
  
  while 1
    xn = T^iter*x0;

    if(xn(4)*total<2)
      break;
    endif
     
    iter++;
  endwhile

  year = 2014;
  dayOfYear = iter-1;
  [yy mm dd] = datevec(datenum(year,1,dayOfYear))

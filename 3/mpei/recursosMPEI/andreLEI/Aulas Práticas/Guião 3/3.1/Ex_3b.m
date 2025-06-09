T = zeros(20,20);

for k = 1 : 20
  r = rand(20, 1);
  r = r / sum(r);
  
  T(:,k) = r;
end 

x0 = zeros(1,20)';
x0(1) = 1;

x2 = (T^2)*x0;
res2 = x2(20)*100

x5 = (T^5)*x0;
res5 = x5(20)*100

x10 = (T^10)*x0;
res10 = x10(20)*100

x100 = (T^100)*x0;
res100 = x100(20)*100
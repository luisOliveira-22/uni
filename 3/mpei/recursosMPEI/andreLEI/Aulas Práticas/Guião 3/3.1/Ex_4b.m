p = 0.4;
q = 0.6;

AtoA = p^2;
AtoB = (1-p)^2;
AtoC = p*(1-p);
AtoD = p*(1-p);

BtoA = 0;
BtoB = 0;
BtoC = 0;
BtoD = 1;

CtoA = 0;
CtoB = 0;
CtoC = 0;
CtoD = 1;

DtoA = q^2;
DtoB = q*(1-q);
DtoC = q*(1-q);
DtoD = (1-q)^2;

T = [AtoA BtoA CtoA DtoA ; AtoB BtoB CtoB DtoB ; AtoC BtoC CtoC DtoC ; AtoD BtoD CtoD DtoD];
x0 = [1 ; 0 ; 0 ; 0];

x5 = (T^5)*x0;
x10 = (T^10)*x0;
x100 = (T^100)*x0;
x200 = (T^200)*x0;

probA_5 = x5(1)
probB_5 = x5(2)
probC_5 = x5(3)
probD_5 = x5(4)

probA_10 = x10(1)
probB_10 = x10(2)
probC_10 = x10(3)
probD_10 = x10(4)

probA_100 = x100(1)
probB_100 = x100(2)
probC_100 = x100(3)
probD_100 = x100(4)

probA_200 = x200(1)
probB_200 = x200(2)
probC_200 = x200(3)
probD_200 = x200(4)



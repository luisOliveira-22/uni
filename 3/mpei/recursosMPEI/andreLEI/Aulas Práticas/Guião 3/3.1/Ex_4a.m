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

T = [AtoA BtoA CtoA DtoA ; AtoB BtoB CtoB DtoB ; AtoC BtoC CtoC DtoC ; AtoD BtoD CtoD DtoD]
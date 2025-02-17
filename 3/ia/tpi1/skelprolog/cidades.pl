%

connection(coimbra, leiria, 73).
connection(aveiro, agueda, 35).
connection(porto, agueda, 79).
connection(agueda, coimbra, 45).
connection(viseu, agueda, 78).
connection(aveiro, porto, 78).
connection(aveiro, coimbra, 65).
connection(figueira, aveiro, 77).
connection(braga, porto, 57).
connection(viseu, guarda, 75).
connection(viseu, coimbra, 91).
connection(figueira, coimbra, 52).
connection(leiria, castelobranco, 169).
connection(figueira, leiria, 62).
connection(leiria, santarem, 78).
connection(santarem, lisboa, 82).
connection(santarem, castelobranco, 160).
connection(castelobranco, viseu, 174).
connection(santarem, evora, 122).
connection(lisboa, evora, 132).
connection(evora, beja, 105).
connection(lisboa, beja, 178).
connection(faro, beja, 147).
connection(braga, guimaraes, 25).
connection(porto, guimaraes, 44).
connection(guarda, covilha, 46).
connection(viseu, covilha, 57).
connection(castelobranco, covilha, 62).
connection(guarda, castelobranco, 96).
connection(lamego,guimaraes, 88).
connection(lamego,viseu, 47).
connection(lamego,guarda, 64).
connection(portalegre,castelobranco, 64).
connection(portalegre,santarem, 157).
connection(portalegre,evora, 194).

connected(C1,C2,D) :- connection(C1,C2,D).
connected(C1,C2,D) :- connection(C2,C1,D).

coordinates(aveiro, 41,215).
coordinates(figueira,  24, 161).
coordinates(coimbra,  60, 167).
coordinates(agueda,  58, 208).
coordinates(viseu,  104, 217).
coordinates(braga,  61, 317).
coordinates(porto,  45, 272).
coordinates(lisboa,  0, 0).
coordinates(santarem,  38, 59).
coordinates(leiria,  28, 115).
coordinates(castelobranco,  140, 124).
coordinates(guarda,  159, 204).
coordinates(evora, 120, -10).
coordinates(beja, 125, -110).
coordinates(faro, 120, -250).
coordinates(guimaraes,  71, 300).
coordinates(covilha,  130, 175).
coordinates(lamego, 125,250).
coordinates(portalegre, 130,170).

actions(cidades,City,LActions)
:- findall((City,Neighbor), connected(City,Neighbor,_), Unsorted ),
   sort(Unsorted,LActions).

result(cidades,City,(City,Neighbor),Neighbor).

satisfies(cidades,City,City).

cost(cidades,City,(City,Neighbor),Cost)
:- connected(City,Neighbor,Cost).

heuristic(cidades,City,GoalCity,Dist)
:- coordinates(City,X1,Y1),
   coordinates(GoalCity,X2,Y2),
   DX is X1-X2, DY is Y1-Y2,
   Dist is round(sqrt(DX^2 + DY^2)).



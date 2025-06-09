Sx = [5 50 100];
probs = [90 9 1]/100;

px=cumsum(probs);
stairs([0 Sx 105],[0 px 1])
axis([0 105 0 1.1])
grid on
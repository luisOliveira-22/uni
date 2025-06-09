x=1:6;
probs = ones(1,6)/6; 

px = cumsum(probs);
stairs([0 x 7], [0 px 1])
axis([0 7 0 1.1])
grid on
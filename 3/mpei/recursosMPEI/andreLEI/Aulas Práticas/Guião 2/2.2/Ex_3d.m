p = 1/2;

prob0Teo = prob_teorica(0, 4, p);
prob1Teo = prob_teorica(1, 4, p);
prob2Teo = prob_teorica(2, 4, p);
prob3Teo = prob_teorica(3, 4, p);
prob4Teo = prob_teorica(4, 4, p);

fprintf("Px(0)= %.6f\nPx(1)= %.6f\nPx(2)= %.6f\nPx(3)= %.6f\nPx(4)= %.6f\n", prob0Teo, prob1Teo, prob2Teo, prob3Teo, prob4Teo)
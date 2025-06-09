N = 1e5;
chars = 'abcdefghijklmnopqrstuvwxyz';
prob_chars = load("prob_pt.txt");
i_min = 6;
i_max = 20;

strings = randStringArray(N, i_min, i_max, chars, prob_chars)
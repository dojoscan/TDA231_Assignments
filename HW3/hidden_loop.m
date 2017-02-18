no_n_hl = [18; 37; 83; 113; 236];
vc = zeros(1,5);

for n = 1:5
    cost = net(10^-3, no_n_hl(n), 1000, 0.35, 0.9, true, 4);
    vc(n) = cost(2);
end
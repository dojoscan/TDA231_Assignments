learn_rate = [0.002, 0.01, 0.05, 0.2, 1.0, 5.0, 20.0];
momentum = [0, 0.9];
tc = zeros(2,7);

for m = 1:2
    for lr = 1:7
        cost = net(0, 10, 70, learn_rate(lr), momentum(m), false, 4);
        tc(m,lr) = cost(1);
    end
end
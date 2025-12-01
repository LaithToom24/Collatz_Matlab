clc;clear;

n = 5;
A = 10;
inputs = (2:A)'.^(1:n);

for i=1:A-1

[sequences, durations, converged] = vectorized_collatz(inputs(i,:), 1e3);

fig = figure(Theme="light", Visible="off");
semilogy(diff(sequences, 1, 2)'.^2);
title(sprintf("Square Differences for Inputs of %d^1 to %d^{%d}", i+1, i+1, n));
ylabel("Square Difference");
xlabel("Input");
saveas(fig, sprintf("differences_for_powers_of_%d.png", i+1));
close(fig);

end




clc;clear;

n = 20;
A = 10;
inputs = (2:A)'.^(1:n);

for i=1:A-1

[sequences, durations, converged] = vectorized_collatz(inputs(i,:), 1e3);
sequences(sequences==0) = NaN;
fig = figure(Theme="light");
semilogx(inputs(i,:), std(sequences, 0, 2, 'omitnan')/mean(std(sequences, 0, 2, 'omitnan')));
title(sprintf("Variation Coefficients for Inputs of %d^1 to %d^{%d}", i+1, i+1, n));
ylabel("Coefficient");
xlabel("Input");
xlim([inputs(i,1) inputs(i,end)]);
saveas(fig, sprintf("variation_coeffs_for_powers_of_%d.png", i+1));

end




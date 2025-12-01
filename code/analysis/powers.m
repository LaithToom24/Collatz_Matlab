clc;clear;

for a=2:1:15
    
n = 10;
inputs = a.^(1:n);

[sequences, durations, converged] = vectorized_collatz(inputs, 1e3);

fig = figure(Theme="light", Visible="off");
plot(log2(sequences'));
title(sprintf("Sequences for Inputs of %d^1 to %d^{%d}", a, a, n));
ylabel("Value");
xlabel("Step");
legend("n="+string(inputs));
xlim([1 max(durations)+1]);
drawnow;
saveas(fig, sprintf("collatz_for_powers_of_%d.png", a));
close(fig);

end



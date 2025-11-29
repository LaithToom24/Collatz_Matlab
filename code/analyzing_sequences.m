max_iterations = 10000;
max_n = 10000;
k = 10; % Define the number of logarithmic steps
n = logspace(1, k, k);
num_inputs = size(n);
num_inputs = num_inputs(2);

a = zeros(num_inputs, max_iterations);
for i = 1:1:num_inputs
    [a(i,:), steps, converged] = collatz(n(i), max_iterations);
end

fig = figure(Theme="light");

labels = strings(1, num_inputs-1);
for i = 2:1:num_inputs
    data = log2(a(i, a(i, :)>0));
    len = size(data);
    len = len(2);
    plot(1:1:len, data, "LineWidth", 0.5);
    hold on;
    labels(i-1) = sprintf("n=%d", n(i));
end
title("Logarithm Base 2 of Sequences");
xlabel('Iteration');
ylabel('Value');
legend(labels);
exportgraphics(fig, 'log2sequences.png');
max_iterations = 10000;
n = 0:1:max_iterations;
num_inputs = size(n);
num_inputs = num_inputs(2);
durations = zeros(1, num_inputs);

for i = 1:1:num_inputs
    [steps, converged] = fast_collatz(n(i), max_iterations);
    if (converged)
        durations(i) = steps;
    else
        warning("Failed to converge under %d iterations for n = %d", max_iterations, n(i))
        durations(i) = 0;
    end
end

durations = durations(durations > 0);
n = n(durations > 0);

rolling_average_duration = cumsum(durations)./cumsum(n > 0);

fig = figure(Theme="light");
scatter(n, durations, "x", "Color", "b");
hold on;
plot(n, rolling_average_duration, "--", "LineWidth", 1, "Color", "r");
title("Durations");
xlabel('Input Values');
ylabel('Steps to Converge');
exportgraphics(fig, 'durations_scatter.png');

fig = figure(Theme="light");
histogram(durations);
title("Duration Frequency");
xlabel('Steps to Converge');
ylabel('Frequency');
exportgraphics(fig, 'durations_hist.png');

fig = figure(Theme="light");
plot(n, rolling_average_duration, "--", "LineWidth", 1, "Color", "r");
title("Rolling Average Duration");
xlabel('Input Values');
ylabel('Steps to Converge');
exportgraphics(fig, 'rolling_average_duration.png');
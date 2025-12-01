max_iterations = 100000;
n = 0:1:max_iterations;
num_inputs = size(n);
num_inputs = num_inputs(2);
peaks = zeros(1, num_inputs);

for i = 1:1:num_inputs
    [peaks(i), converged] = fast_collatz_peak(n(i), max_iterations);
    if (not(converged))
        warning('Convergence not achieved for n = %d, disregarding peaks(%d)', n(i), i);
        peaks(i) = 0;
    end
end

fig = figure(Theme="light");

loglog(n(peaks > 0), peaks(peaks > 0));
title("Peaks");
xlabel('Input');
ylabel('Peak');
exportgraphics(fig, 'peaks.png');

loglog(n(peaks > 0), peaks(peaks > 0)./n(peaks > 0));
title("Peak Growth");
xlabel('Input');
ylabel('Peak/Input');
exportgraphics(fig, 'peak_growths.png');
num = 2:1:1e4;
maxSize = 1e4;

vectorized_method = @() vectorized_collatz(num, maxSize);
vectorized_runtime = timeit(vectorized_method) * 1e3;

nonvectorized_method = @() nonvectorized_collatz(num, maxSize);
nonvectorized_runtime = timeit(nonvectorized_method) * 1e3;

fprintf("Non-vectorized method runtime: %.2fms\nVectorized method runtime: %.2fms\n", nonvectorized_runtime, vectorized_runtime)

function [a, steps, has_converged] = nonvectorized_collatz(num, maxSize)
    a = zeros(length(num), maxSize);
    steps = zeros(1, length(num));
    has_converged = zeros(1, length(num));
    for i = 1:1:length(num)
        [a(i,:), steps(i), has_converged(i)] = collatz(num(i), maxSize);
    end
end
function [sequences, steps, converged] = vectorized_collatz(num, maxSize)
%collatz Summary of this function goes here
%   Detailed explanation goes here
arguments (Input)
    num;
    maxSize;
end

arguments (Output)
    sequences;
    steps;
    converged;
end

steps = zeros(1, length(num));
sequences = zeros(length(num), maxSize);
sequences(:,1) = num;
i = 1;
while (i < maxSize)
    converged = num == 1;
    active = num(~converged);
    if (isempty(active))
        break
    end
    odd_num = mod(active, 2) == 1;
    active(odd_num) = (3 * active(odd_num) + 1)/2;
    active(~odd_num) = active(~odd_num) / 2;
    num(~converged) = active; % Update num with the new values

    steps(~converged) = steps(~converged) + 1;
    i = i + 1; % Increment the iteration counter
    sequences(~converged, i) = num(~converged);
end

converged = num == 1;
sequences = sequences(:, 1:max(steps)+1);

end
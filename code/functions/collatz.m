function [sequence, steps, converged] = collatz(num, maxSize)
%collatz Summary of this function goes here
%   Detailed explanation goes here
arguments (Input)
    num;
    maxSize;
end

arguments (Output)
    sequence;
    steps;
    converged;
end

sequence = zeros(1, maxSize);
sequence(1, 1) = num;

i = 1;
while ((sequence(1, i) > 1) && (i < maxSize))
    if (mod(sequence(1, i), 2) == 1)
        sequence(1, i+1) = (3 * sequence(1, i) + 1)/2;
    else
        sequence(1, i+1) = sequence(1, i) / 2;
    end
    i = i + 1;
end

steps = i - 1;
converged = true;
if (sequence(1, i) > 1)
    converged = false;
end

end
function [steps, converged] = fast_collatz(num, maxSize)
%collatz Summary of this function goes here
%   Detailed explanation goes here
arguments (Input)
    num;
    maxSize;
end

arguments (Output)
    steps;
    converged;
end

i = 1;
while ((num > 1) && (i < maxSize))
    if (mod(num, 2) == 1)
        num = (3 * num + 1)/2;
    else
        num = num / 2;
    end
    i = i + 1;
end

steps = i - 1;
converged = true;
if (num > 1)
    converged = false;
end

end
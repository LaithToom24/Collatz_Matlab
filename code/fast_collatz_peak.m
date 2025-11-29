function [peak, converged] = fast_collatz_peak(num, maxSize)
%collatz Summary of this function goes here
%   Detailed explanation goes here
arguments (Input)
    num;
    maxSize;
end

arguments (Output)
    peak;
    converged;
end

peak = num;
i = 1;
while ((num > 1) && (i < maxSize))
    if (mod(num, 2) == 1)
        num = (3 * num + 1);
        if (num > peak)
            peak = num; % Update peak if the current number is greater
        end
        num = num/2;
    else
        num = num / 2;
    end

    i = i + 1;
end

converged = true;
if (num > 1)
    converged = false;
end

end
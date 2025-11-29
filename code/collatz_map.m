% 1. Define vectors
n_values = 1:1000; % Vector A (Input)
steps = 1:200;     % Vector B (Steps)

% 2. Pre-allocate nxn Matrix (or nxm)
% We use zeros to start
Landscape = zeros(length(n_values), length(steps));

% 3. Fill it (Simulation)
for i = 1:length(n_values)
    % Run Collatz for this specific number
    [seq, ~] = collatz(n_values(i), length(steps)); 
    
    % Store the sequence in the row
    Landscape(i, :) = seq;
end

% 4. Visualize
fig = figure(Theme="dark");
% Add 1 to avoid log(0) errors if any element is 0
% Use log2 to represent "bits" (powers of two)
imagesc(steps, n_values, log2(Landscape + 1)); 
% Update the title and colorbar label
title('The Collatz Landscape (Log2 Scale)');
cb = colorbar;
ylabel(cb, 'Magnitude (Bits)');
title('The Collatz Landscape');
exportgraphics(fig, "collatz_map.png");

% 1. Calculate the 'Active Duration' for each row (count values > 1)
[~, sortIdx] = sort(sum(Landscape > 1, 2));

% 2. Re-order the matrix rows using these indices
SortedLandscape = Landscape(sortIdx, :);

% 3. Plot the Sorted Map
fig = figure(Theme="light");
imagesc(steps, 1:length(n_values), log2(SortedLandscape + 1));

title('The Collatz Landscape (Sorted by Difficulty)');
xlabel('Steps');
ylabel('Sorted Inputs (Easiest to Hardest)');
cb = colorbar;
ylabel(cb, 'Magnitude (Bits)');
exportgraphics(fig, "collatz_exponential_map.png");
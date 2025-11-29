% Configuration
max_nodes = 500; % Keep this under 2000 for readability

% Initialize Queue for BFS (Start at 1)
% Queue stores: [Number]
queue = [1];

% Initialize Edge Lists for the Graph
sources = [];
targets = [];
nodes_found = [1]; % Keep track to avoid duplicates

while ~isempty(queue) && length(nodes_found) < max_nodes
    % Pop the current root node
    current = queue(1);
    queue(1) = [];
    
    % --- GENERATE CHILDREN (Reverse Collatz Steps) ---
    
    % Child 1: The "Even" Predecessor (Always exists: 2*n)
    child_even = 2 * current;
    
    % Add edge (Child -> Current) to show flow towards 1
    sources(end+1) = child_even;
    targets(end+1) = current;
    
    % Add to queue
    if ~ismember(child_even, nodes_found)
        nodes_found(end+1) = child_even;
        queue(end+1) = child_even;
    end
    
    % Child 2: The "Odd" Predecessor ((n-1)/3)
    % Conditions: Must be integer, must be odd, must be > 1
    if (current > 4) && (mod(current - 1, 3) == 0)
        child_odd = (current - 1) / 3;
        
        if mod(child_odd, 2) == 1 % Must be odd
             % Add edge (Child -> Current)
            sources(end+1) = child_odd;
            targets(end+1) = current;
            
            % Add to queue
            if ~ismember(child_odd, nodes_found)
                nodes_found(end+1) = child_odd;
                queue(end+1) = child_odd;
            end
        end
    end
end

% --- PLOTTING ---
fig = figure(Theme="light");
% CHANGE: Use 'force' layout instead of 'layered'
p = plot(G, 'Layout', 'force', 'Iterations', 1000); 

% Styling (Same as before)
p.NodeColor = [0 0.4470 0.7410]; 
p.EdgeColor = [0.5 0.5 0.5];    
p.MarkerSize = 4;              % Slightly smaller nodes helps visibility
p.ArrowSize = 4;

% Re-highlight the Trunk
power_of_2_nodes = [];
for i = 1:max(nodes_found)
    if ismember(i, nodes_found)
        % Check if power of 2
        if abs(log2(i) - round(log2(i))) < 1e-10
            power_of_2_nodes(end+1) = i;
        end
    end
end
highlight(p, power_of_2_nodes, 'NodeColor', 'r', 'MarkerSize', 6);

title(['The Collatz Tree (First ' num2str(max_nodes) ' Nodes)']);
subtitle('Force-Directed Layout: Showing the "Organic" Structure');
axis off;
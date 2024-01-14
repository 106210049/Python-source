function [idx, C] = kmeans_code(data, k)
% Set fixed centroids
C = [0 0; 0 9; 9 0; 9 9];

% Initialize cluster assignments
n = size(data, 1);
idx = zeros(1, n);      

% Iterate until convergence
prev_idx = ones(1, n);
while ~isequal(prev_idx, idx)
    prev_idx = idx;
    % Assign data points to nearest centroids
    for i = 1:n
        t = zeros(1, k);
        disp(size(t, 2));
        for j = 1:size(t, 2)
            t(j) = (data(i,1) - C(j,1))^2  + (data(i,2) - C(j,2))^2;
        end
        [~, idx(i)] = min(t);AA
    end
    % Update centroids
    for j = 1:k
        points_in_cluster = data(idx == j, :);
        C(j, :) = mean(points_in_cluster, 1);
    end
end
end
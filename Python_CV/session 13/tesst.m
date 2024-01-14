% Number of data points in each cluster
n = 100; 

% Define the parameters for each cluster
mu = [-2 -2; -2 2; 2 -2; 2 2]; % Mean of each cluster (in 2D)
sigma = cat(3, [1 0; 0 1], [0.5 0; 0 0.5], [1 0; 0 1], [0.5 0; 0 0.5]); % Covariance matrix of each cluster (in 2D)
p = ones(1, 4) * 0.25; % Mixing proportion for each cluster

% Generate data points from the Gaussian mixture model
obj = gmdistribution(mu, sigma, p); % Create a Gaussian mixture model object
data = random(obj, n); % Generate random data points from the Gaussian mixture model

% Translate the data points to start at the origin (0,0)
data = bsxfun(@minus, data, min(data));

% Perform k-means clustering with 4 clusters
numClusters = 4;

C = [0 0; 0 9; 9 0; 9 9];
n = size(data, 1);
idx = zeros(1, n);
for i = 1:n
    distances = sqrt(sum((data(i,:) - C).^2, 2));
    [~, idx(i)] = min(distances);
end
%[idx, C] = kmeans_code(data, numClusters); % idx contains the cluster assignments, C contains the cluster centroids

% Plot the clustered data with different colors for each cluster
colors = ['r', 'g', 'b', 'm']; % Colors for each cluster
figure;
hold on;
for i = 1:numClusters
    clusterData = data(idx == i, :); % Extract data points belonging to current cluster
    scatter(clusterData(:,1), clusterData(:,2), [], colors(i)); % Scatter plot with different color for each cluster
end
scatter(C(:,1), C(:,2), 100, 'k', 'x', 'LineWidth', 2); % Plot cluster centroids as black crosses
xlabel('X'); % X-axis label

image = imread('kodak/kodim10.png');
[h, w, ~] = size(image);
data = reshape(image, h*w, 3);
num_clusters = 3;

% �p d?ng ph��ng ph�p K-means
[cluster_idx, cluster_center] = kmeans(double(data), num_clusters);

% G�n nh?n c?m cho t?ng �i?m d? li?u
cluster_label = reshape(cluster_idx, h, w);   

% T�nh gi� tr? m�u trung b?nh c?a t?ng c?m
avg_colors = zeros(num_clusters, 3);
for i = 1:num_clusters
    cluster_data = data(cluster_idx == i, :);
    avg_color = mean(cluster_data, 1);
    avg_colors(i, :) = avg_color;
end

figure;
subplot(1, 2, 1);
imshow(image);
title('Original');
subplot(1, 2, 2);
imagesc(cluster_label);
axis off;
title('Clustered');

colormap(gca, avg_colors/255); 

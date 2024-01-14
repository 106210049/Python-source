% �?c ?nh v�o
image = imread('kodak/kodim10.png');

% Chu?n b? d? li?u cho K-means
% Chuy?n ma tr?n ?nh th�nh ma tr?n 2D v?i c�c �i?m d? li?u l� c�c pixel
[h, w, ~] = size(image);
data = reshape(image, h*w, 3);

% S? l�?ng c?m mong mu?n
num_clusters = 20;

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

% Hi?n th? k?t qu?
figure;
subplot(1, 2, 1);
imshow(image);
title('?nh g?c');
subplot(1, 2, 2);
imagesc(cluster_label);
axis off;
title('K?t qu? ph�n c?m K-means tr�n ?nh');

% �?i m�u s?c cho c�c c?m d?a tr�n gi� tr? m�u trung b?nh c?a t?ng c?m
colormap(gca, avg_colors/255); 

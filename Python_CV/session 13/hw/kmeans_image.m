% Ð?c ?nh vào
image = imread('kodak/kodim10.png');

% Chu?n b? d? li?u cho K-means
% Chuy?n ma tr?n ?nh thành ma tr?n 2D v?i các ði?m d? li?u là các pixel
[h, w, ~] = size(image);
data = reshape(image, h*w, 3);

% S? lý?ng c?m mong mu?n
num_clusters = 20;

% Áp d?ng phýõng pháp K-means
[cluster_idx, cluster_center] = kmeans(double(data), num_clusters);

% Gán nh?n c?m cho t?ng ði?m d? li?u
cluster_label = reshape(cluster_idx, h, w);   

% Tính giá tr? màu trung b?nh c?a t?ng c?m
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
title('K?t qu? phân c?m K-means trên ?nh');

% Ð?i màu s?c cho các c?m d?a trên giá tr? màu trung b?nh c?a t?ng c?m
colormap(gca, avg_colors/255); 

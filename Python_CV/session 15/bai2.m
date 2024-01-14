% Load the image
bw = imread('circles.png');
figure
imshow(bw);
title('Original');
% Apply imerode
se1 = strel('disk', 10);
x = imdilate(bw, se1);
se2 = strel('disk', 18);
y = imerode(x, se2);
% Apply imdilate
% Display the results
figure
imshow(y | bw, []), title('After')
A = imread('image/square.png');
B = strel('square', 50); % T?o ph?n t? c?u tr�c h?nh vu�ng 3x3
C = strel('disk', 50, 8); % T?o ph?n t? c?u tr�c h?nh vu�ng 3x3
eroded1_img = imerode(A, B); % Th?c hi?n ph�p erosion
eroded2_img = imerode(A, C);
dilation1_img = imdilate(A,B);
dilation2_img = imdilate(A,C);
subplot(2,3,1);
imshow(A,[]);
title('Original Image');

subplot(2,3,2);
imshow(eroded1_img,[]);
title('Erosion using Square-shaped SE');

subplot(2,3,5);
imshow(eroded2_img,[]);
title('Erosion using Disk-shaped SE');

subplot(2,3,3);
imshow(dilation1_img,[]);
title('Dilation using Square-shaped SE');

subplot(2,3,6);
imshow(dilation2_img,[]);
title('Dilation using Disk-shaped SE');
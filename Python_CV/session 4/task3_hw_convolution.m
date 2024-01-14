img = rgb2gray(imread('image\12.jpg'));
[h, w] = size(img)
H1 = [1 ;2 ;1] / 4;
H2 = transpose(H1);
% Cau A
Y1 = conv2(img, H1,'same');
Y2 = conv2(img, H2,'same');
subplot(2,2,1);
imshow(Y1,[]);
title('Y1');
subplot(2,2,2);
imshow(Y2,[]);
title('Y2');
% Cau B
H = [1 2 1; 2 4 2; 1 2 1] / 16;
Y3 = conv2(img, H, 'same');
size(Y3);
subplot(2,2,3);
imshow(Y3,[]);
title('Y3');
subplot(2,2,4);
imshow(img,[]);
title('Original');
max(abs(Y2-Y1));
max(abs(Y3-Y2));
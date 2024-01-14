img = rgb2gray(imread('image\12.jpg'));
[h, w] = size(img);
I = ones(10,10) * 128;
H1 = [0 1 0; 1 -4 1; 0 1 0];
H2 = [-1 2 -1];
H3 = [1;0;-1];
Y1 = conv2(I,H1)
Y2 = conv2(I,H2)
Y3 = conv2(I,H3)
subplot(2,2,1);
imshow(Y1,[]);
title('Y1');
subplot(2,2,2);
imshow(Y2,[]);
title('Y2');
subplot(2,2,3);
imshow(Y3,[]);
title('Y3');
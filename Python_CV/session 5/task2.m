I= imread('image\12.jpg');
I=rgb2gray(I);
J = imnoise(I,'salt & pepper', 0.1);
%a
H=[1 2 1;2 4 2;1 2 1]/16;
I1=uint8(conv2(J,H,'same'));
%b
K=medfilt2(J,[3,3])
K2=medfilt2(K,[4,4]);
K3=medfilt2(K2,[4,4]);

subplot(331); imshow(J);
subplot(332); imshow(I1);
subplot(333); imshow(K);
subplot(334); imshow(K2);
subplot(335); imshow(K3);
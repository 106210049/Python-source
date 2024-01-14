I = imread('image\cameraman.jpg');
[h, w] = size(I);
sigma = 0.3;
I = im2double(I) + sigma * randn(size(I));
figure
imshow(I);
figure
H = [-1 0 1];
Y1 = conv2(I,H,'same');
Y2 = conv2(I,transpose(H),'same');
Y3 = abs(Y1) + abs(Y2);
subplot(2,3,1);
imshow(Y1,[]);
subplot(2,3,2);
imshow(Y2,[]);
subplot(2,3,3);
imshow(Y3,[]);

G = [-1 0 1; -2 0 2; -1 0 1];
Z1 = conv2(I,G,'same');
Z2 = conv2(I,transpose(G),'same');
Z3 = abs(Z1) + abs(Z2);
subplot(2,3,4);
imshow(Z1,[]);
subplot(2,3,5);
imshow(Z2,[]);
subplot(2,3,6);
imshow(Z3,[]);

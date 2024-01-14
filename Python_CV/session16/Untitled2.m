clc
clear
close all
img = imread('kodak/kodim19.png');
img = rgb2gray(img);
% Kích thý?c ?nh
[m,n] = size(img);
% T?o nhi?u Gaussian v?i trung b?nh b?ng 0 và ð? l?ch chu?n b?ng 1
noise = randn(m, n);
F = [1 1 1;1 1 1; 1 1 1]/9;
%a) sigma = 0
I1 = conv2(img,F,'full') ;
%b) sigma = 0.01
I2 = conv2(img,F,'same') + 0.01*noise;
%c) sigma = 0.1
I3 = conv2(img,F,'same') + 0.1*noise;
%d) sigma = 1
I4 = conv2(img,F,'same') + noise;
%e) sigma = 3
I5 = conv2(img,F,'same') + 3*noise;
figure
imshow(img, []);title('Original');

S = fft2(double(I1));

SF = fft2(F,size(I1,1),size(I1,2));

So = S./SF;
Io = uint8(real(ifft2(So)));
figure
imshow(Io,[]);title('anh restore')
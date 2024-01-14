img1 = imread('image/beach.jpg');
img2 = imread('image/building.jpg');
img3 = imread('image/household.jpg');
img4 = imread('image/pedestrian.jpg');
img5 = imread('image/tree.jpg');
Arr = [2 4 6 8 10];
Arr = Arr(randperm(length(Arr)))
figure
subplot(3,4,1);imshow(img1,[]);
subplot(3,4,3);imshow(img2,[]);
subplot(3,4,5);imshow(img3,[]);
subplot(3,4,7);imshow(img4,[]);
subplot(3,4,9);imshow(img5,[]);
if size(img1, 3) == 3
    img1 = rgb2gray(img1);
end
if size(img2, 3) == 3
    img2 = rgb2gray(img2);
end
if size(img3, 3) == 3
    img3 = rgb2gray(img3);
end
if size(img4, 3) == 3
    img4 = rgb2gray(img4);
end
if size(img5, 3) == 3
    img5 = rgb2gray(img5);
end

F1 = fft2(double(img1));
F2 = fft2(double(img2));
F3 = fft2(double(img3));
F4 = fft2(double(img4));
F5 = fft2(double(img5));

% Shift the zero-frequency component to the center of the spectrum
F1 = fftshift(F1);
F2 = fftshift(F2);
F3 = fftshift(F3);
F4 = fftshift(F4);
F5 = fftshift(F5);

% Compute the magnitude spectrum
F_mag1 = abs(F1);
F_mag2 = abs(F2);
F_mag3 = abs(F3);
F_mag4 = abs(F4);
F_mag5 = abs(F5);
% Display the magnitude spectrum
subplot(3,4,Arr(1));imshow(log(1+F_mag1), []);
subplot(3,4,Arr(2));imshow(log(1+F_mag2), []);
subplot(3,4,Arr(3));imshow(log(1+F_mag3), []);
subplot(3,4,Arr(4));imshow(log(1+F_mag4), []);
subplot(3,4,Arr(5));imshow(log(1+F_mag5), []);
%L?n th? nén, nh? tãng
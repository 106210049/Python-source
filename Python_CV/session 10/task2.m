img = imread('image\19.jpg');


[h, w, t] = size(img);
I = zeros(h,w);
I(1:2:h,1:2:w) = img(1:2:h,1:2:w,1);
I(1:2:h,2:2:w) = img(1:2:h,2:2:w,2);
I(2:2:h,1:2:w) = img(2:2:h,1:2:w,2);
I(2:2:h,2:2:w) = img(2:2:h,2:2:w,3);
imshow(I,[]);

F = fft2(double(I));

% Shift the zero-frequency component to the center of the spectrum
F = fftshift(F);

% Compute the magnitude spectrum
figure
F_mag = abs(F);imagesc(log(1+F_mag));


img2 = rgb2gray(img);
F2 = fft2(double(img2));

% Shift the zero-frequency component to the center of the spectrum
F2 = fftshift(F2);

% Compute the magnitude spectrum
figure
F2_mag = abs(F2);imagesc(log(1+F2_mag));

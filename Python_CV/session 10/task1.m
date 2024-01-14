img = imread('kodak/kodim19.png');
if size(img, 3) == 3
    img = rgb2gray(img);
end

subplot(2, 4,1);imshow(img,[]);
F = fft2(double(img));

% Shift the zero-frequency component to the center of the spectrum
F = fftshift(F);

% Compute the magnitude spectrum
F_mag = abs(F);
F_phase  = angle(F);
% Display the magnitude spectrum
subplot(2, 4,2);imshow(log(1+F_mag), []);
subplot(2, 4,3);imshow(F_phase, []);

I1 = ifft2(ifftshift(1 * exp(1i * F_phase)));
I2 = ifft2(ifftshift(F_mag .* exp(1i)));
% Display the reconstructed image
subplot(2, 4,4);
imshow(real(I1), []);
title('MAG');
subplot(2, 4, 5);
imshow(real(I2), []);

img2 = imread('kodak/kodim18.png');
img2 = rgb2gray(img2);
subplot(2,4, 6);
imshow(img2, []);
F2 = fft2(double(img2));
F2 = fftshift(F2);
F2_mag = abs(F2);
F2_phase  = angle(F2);
F2 = fft2(double(img2));
F2 = fftshift(F2);
F2_mag = abs(F2);
F2_phase  = angle(F2);
S3 = ifft2(ifftshift(F_mag .* exp(1i * F2_phase)));
S4 = ifft2(ifftshift(F2_mag .* exp(1i * F_phase)));
subplot(2, 4, 7);
imshow(real(S3), []);
subplot(2,4,8);
imshow(real(S4), []);


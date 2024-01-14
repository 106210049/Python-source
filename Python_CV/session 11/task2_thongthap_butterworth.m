img = imread('kodak/kodim19.png');
gray = rgb2gray(img);
F = fft2(double(gray));
[M, N] = size(gray);
H = zeros(M, N);
D0 = 100;
n = 2;
F = fftshift(F);
for u = 1:M
    for v = 1:N
        d = sqrt((u - M/2)^2 + (v-N/2)^2);
        H(u,v) = 1 / (1 + (d / D0)^(2*n));
    end
end
Sy = F .* H;
Y = ifft2(ifftshift(Sy));
figure
mesh(H);
figure
imshow(real(Y), []);
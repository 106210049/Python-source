img = imread('kodak/kodim19.png');
gray = rgb2gray(img);
F = fft2(double(gray));
[M, N] = size(gray);
H = zeros(M, N);
D0 = 200;
F = fftshift(F);
for u = 1:M
    for v = 1:N
        d = sqrt((u - M/2)^2 + (v-N/2)^2);
        if (d<=D0)
            H(u,v) = 1;
        else
            H(u,v) = 0;
        end
    end
end

Sy = F .* H;
Y = ifft2(ifftshift(Sy));
figure
mesh(H);
figure
imshow(real(Y), []);
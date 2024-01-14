img = imread('kodak/kodim19.png');
[h, w, t] = size(img);
I = zeros(h,w);
I(1:2:h,1:2:w) = img(1:2:h,1:2:w,1);
I(1:2:h,2:2:w) = img(1:2:h,2:2:w,2);
I(2:2:h,1:2:w) = img(2:2:h,1:2:w,2);
I(2:2:h,2:2:w) = img(2:2:h,2:2:w,3);
F = fft2(double(I));
[M, N] = size(I);
H1 = zeros(M, N);H2 = zeros(M, N);H3 = zeros(M, N);
D0 = 300;
n = 3;
F = fftshift(F);
for u = 1:M
    for v = 1:N
        d = sqrt((u - M/2)^2 + (v-N/2)^2);
        if (d<=D0)
            H1(u,v) = 1;
        else
            H1(u,v) = 0;
        end
        H2(u,v) = 1 / (1 + (d / D0)^(2*n));
        H3(u,v) = exp(-d^2 / (2 * D0^2));
    end
end

Sy1 = F .* H1;
Y1 = ifft2(ifftshift(Sy1));
Sy2 = F .* H2;
Y2 = ifft2(ifftshift(Sy2));
Sy3 = F .* H3;
Y3 = ifft2(ifftshift(Sy3));
subplot(1,3,1);
imshow(real(Y1), []);
subplot(1,3,2);
imshow(real(Y2), []);
subplot(1,3,3);
imshow(real(Y3), []);
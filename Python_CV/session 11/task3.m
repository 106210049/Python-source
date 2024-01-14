img = imread('kodak/kodim19.png');
I = rgb2gray(img);
[h, w] = size(I);
SI = fft2(double(I));
N = 1;
distance = 0.5 / N;
R = zeros(1, N+1); E = zeros(1, N);% initialize R array
R(1) = 0;
for i = 1:N
    R(i+1) = i * distance;
end
H = zeros(h, w, N);
S = zeros(h, w, N);
%figure
%imshow(I);
for k = 1:N
    for u = 1:h
        for v = 1:w
            
            d = sqrt(u^2 + v^2);
            if (d>R(k) && d<R(k+1))
                H(u,v,k) = 1;
            else
                H(u,v,k) = 0;
            end
        end
    end
end
for k = 1:N
    S(:,:,k) = SI .* H(:,:,k);
    for u = 1:h
        for v = 1:w
            E(k) = E(k) + abs(S(u,v,k))^2;
        end
    end
end


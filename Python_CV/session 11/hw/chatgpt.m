imgList{1} = imread('kodak/kodim16.png');
imgList{2} = imread('kodak/kodim20.png');
imgList{3} = imread('kodak/kodim21.png');
imgList{4} = imread('kodak/kodim22.png');
imgList{5} = imread('kodak/kodim23.png');
for t = 1:5
    I = imgList{t};
    subplot(3,5,t)
    imshow(I);title('Image'+num2str(t));
    I_gray = rgb2gray(I);
    I = double(I_gray);
    [M,N] = size(I);
    SI = fftshift(fft2(I));
    subplot(3,5,t+5)
    imagesc(log(abs(SI)));title('Ph?'+num2str(t));
    [u,v] = meshgrid(1:N,1:M);
    u = u - (1+N)/2;
    v = v - (1+M)/2;
    u = u/N;v = v/M;
    D = sqrt(u.^2+v.^2);
    Hk = zeros(size(D));
    Ek = zeros(1,50);
    for i = 2:50 
        r1 = 0.01*(i-1);
        r2 = 0.01*(i);
        for x = 1:M
            for y = 1:N
                if (r1<=D(x,y)&&D(x,y)<r2)
                    Hk(x,y) = 1;
                else
                    Hk(x,y) = 0;
                end
            end
        end
        Sk = SI.*Hk;
        sum = 0;
        for x = 1:M
            for y = 1:N
                sum = sum + abs(Sk(x,y))^2;
            end
        end
        Ek(1,i) = sum;
    end
    subplot(3,5,t+5+5)
    plot(Ek);title('EK('+num2str(t)+')');
end

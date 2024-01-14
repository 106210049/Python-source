img = imread('kodak/kodim19.png');
img = rgb2gray(img);
imshow(img, []);
x = 1;
F = [1 1 1;1 1 1; 1 1 1]/9;
I = conv2(img,F,'full');
noise = x * randn(size(I,1),size(I,2));
I = I + noise;
S = fft2(double(I));

SF = fft2(F,size(I,1),size(I,2));

So = S./SF;

Io = real(ifft2(So));
figure
imshow(Io,[]);title('Anh restore')
x = abs(Io(1:size(Io,1)-2, 1:size(Io,2)-2) - img);
max(x(:))
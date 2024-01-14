img = rgb2gray(imread('image\12.jpg'));
[h, w] = size(img);
img = double(img) + 20 * randn(h,w);
subplot(2,2,1)
imshow(img,[])
H1 = ones(3,3)/9;
H2 = ones(5,5)/25;
H3 = ones(9,9)/81;
I1 = conv2(img, H1,'same');
[h1, w1] = size(I1)
I2 = conv2(img, H2,'same');
I3 = conv2(img, H3,'same');
subplot(2,2,2)
imshow(I1,[]);
subplot(2,2,3)
imshow(I2,[]);
subplot(2,2,4)
imshow(I3,[]);
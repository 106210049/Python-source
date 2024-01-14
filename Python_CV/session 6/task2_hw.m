img = imread('image\19.jpg');
[h, w, t] = size(img);
I = zeros(h,w);
I(1:2:h,1:2:w) = img(1:2:h,1:2:w,1);
I(1:2:h,2:2:w) = img(1:2:h,2:2:w,2);
I(2:2:h,1:2:w) = img(2:2:h,1:2:w,2);
I(2:2:h,2:2:w) = img(2:2:h,2:2:w,3);
FL = [-2 3 -6 3 -2, 3 4 2 4 3, -6 2 48 2 -6, 3 4 2 4 3, -2 3 -6 3 -2]/64;
lmn = conv2(I,FL,'same');
MC = I - lmn;
%imshow(MC,[])
C = img;
SC = zeros(h,w,3);
C1= zeros(h,w); C2 = zeros(h,w); C3 = zeros(h,w);
C1(1:2:h,1:2:w) = MC(1:2:h,1:2:w);
C2(1:2:h,2:2:w) = MC(1:2:h,2:2:w);
C2(2:2:h,1:2:w) = MC(2:2:h,1:2:w);
C3(2:2:h,2:2:w) = MC(2:2:h,2:2:w);
SC(:,:,1) = C1;
SC(:,:,2) = C2;
SC(:,:,3) = C3;
WRB = [1 2 1;2 4 2;1 2 1] / 4;
WG = [0 1 0; 1 4 1; 0 1 0] / 4;
SC(:,:,1) = conv2(SC(:,:,1),WRB,'same') + lmn;
SC(:,:,2) = conv2(SC(:,:,2), WG,'same') + lmn;
SC(:,:,3) = conv2(SC(:,:,3), WRB,'same') + lmn;
figure
imshow(img)
figure
imshow(res,[]);

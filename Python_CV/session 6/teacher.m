% THUAT TOAN ALLEYSSON

img = imread('image\19.jpg');
[h, w, t] = size(img);
I = zeros(h,w);
I(1:2:h,1:2:w) = img(1:2:h,1:2:w,1);
I(1:2:h,2:2:w) = img(1:2:h,2:2:w,2);
I(2:2:h,1:2:w) = img(2:2:h,1:2:w,2);
I(2:2:h,2:2:w) = img(2:2:h,2:2:w,3);

FL = [-2 3 -6 3 -2;3 4 2 4 3;-6 2 48 2 -6;3 4 2 4 3;-2 3 -6 3 -2]/64;
lmn = conv2(I,FL,'same');
MC = I - lmn;
C = img;
mR = zeros(h,w);mG = zeros(h,w);mB = zeros(h,w);
mR(1:2:h,1:2:w) = 1;
mG(1:2:h,2:2:w) = 1;mG(2:2:h,1:2:w) = 1;
mB(2:2:h,2:2:w) = 1;
C1 = MC .* mR;
C2 = MC .* mG;
C3 = MC .* mB;
WRB = [1 2 1;2 4 2;1 2 1] / 4;
WG = [0 1 0; 1 4 1; 0 1 0] / 4;
res = img;
res(:,:,1) = conv2(C1,WRB,'same') + lmn;
res(:,:,2) = conv2(C2, WG,'same') + lmn;
res(:,:,3) = conv2(C3, WRB,'same') + lmn;
%imshow(res,[])
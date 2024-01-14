img = imread('image\19.jpg');res = img;
figure;imshow(img,[])
[h, w, t] = size(img);
img = double(img);
mR = zeros(h,w);mB = zeros(h,w);
mR(1:2:h,1:2:w) = 1;
mB(2:2:h,2:2:w) = 1;
mG = 1 - mR - mB;

I1 = img(:,:,1) .* mR;
I2 = img(:,:,2) .* mG;
I3 = img(:,:,3) .* mB;
Im = I1 + I2 + I3;

FL = [-2 3 -6 3 -2, 3 4 2 4 3, -6 2 48 2 -6, 3 4 2 4 3, -2 3 -6 3 -2]/64;
     [-2 3 -6 3 -2;3 4 2 4 3;-6 2 48 2 -6;3 4 2 4 3;-2 3 -6 3 -2]/64;
lmn = conv2(Im,FL,'same');



MC = Im - lmn;



C1 = MC .* double(mR);
C2 = MC .* double(mG);
C3 = MC .* double(mB);


WRB = [1 2 1;2 4 2;1 2 1] / 4;
WG = [0 1 0; 1 4 1; 0 1 0] / 4;
C1 = conv2(C1,WRB,'same') ;
C2 = conv2(C2, WG,'same') ;
C3 = conv2(C3, WRB,'same') ;



res(:,:,1) = C1+ lmn;
res(:,:,2) = C2+ lmn;
res(:,:,3) = C3+ lmn;
figure 
imshow(res,[])



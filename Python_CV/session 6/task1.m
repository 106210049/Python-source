% THUAT TOAN NOI SUY SONG TUYEN TINH
img = imread('kodak\kodim24.png');
[h, w, t] = size(img);
I = img;
I(2:2:h,:,1) = 0;I(:,2:2:w,1) = 0;
I(1:2:h,1:2:w,2) = 0;I(2:2:h,2:2:w,2) = 0;
I(1:2:h,:,3) = 0;I(:,1:2:w,3) = 0;
WRB = [1 2 1;2 4 2;1 2 1] / 4;
WG = [0 1 0; 1 4 1; 0 1 0] / 4;
I(:,:,1) = imfilter(I(:,:,1),WRB,'replicate');
I(:,:,2) = imfilter(I(:,:,2), WG,'replicate');
I(:,:,3) = imfilter(I(:,:,3), WRB,'replicate');
%figure
%imshow(I,[])
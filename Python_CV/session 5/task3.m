img = imread('image\12.jpg');
[h, w, t] = size(img)
R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);
for i=2:2:h
    R(i,:) = 0;
end
for j=2:2:w
    R(:,j) = 0;
end

%imshow(R,[]);
for i=1:2:h
    for j=1:2:w
        G(i,j) = 0;
    end
end
for j=2:2:w
    for i=2:2:h
        G(i,j) = 0;
    end
end
%imshow(G,[]);
for i=1:2:h
    B(i,:) = 0;
end
for j=1:2:w
    B(:,j) = 0;
end
I = img;
I(:,:,1) = R;
I(:,:,2) = G;
I(:,:,3) = B;figure
imshow(I,[])
WRB = [1 2 1;2 4 2;1 2 1] / 4;
WG = [0 1 0; 1 4 1; 0 1 0] / 4;
R = conv2(R,WRB,'same');
G = conv2(G, WG,'same');
B = conv2(B, WRB,'same');
I(:,:,1) = R;
I(:,:,2) = G;
I(:,:,3) = B;

figure
imshow(I,[])
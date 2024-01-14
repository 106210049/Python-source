img = imread('image\12.jpg');
[h, w, t] = size(img);
R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);
for i=2:2:h
    R(i,:) = 0;
end
for j=2:2:800
    R(:,j) = 0;
end

%imshow(R,[]);
for i=1:2:h
    for j=1:2:800
        G(i,j) = 0;
    end
end
for j=2:2:800
    for i=2:2:h
        G(i,j) = 0;
    end
end

%imshow(G,[]);
for i=1:2:h
    B(i,:) = 0;
end
for j=1:2:800
    B(:,j) = 0;
end
I = img;

for i=1:h
    for j = 1:w
        if mod(i,2) == 0 && mod(j,2) ==0
            R(i,j) = (R(i-1, j+1) + R(i-1, j-1) + R(i+1, j -1) + R(i+1, j+1)) / 4;
        elseif mod(i,2) == 0 && mod(j,2) ~= 0
            R(i,j) = (R(i-1,j) + R(i+1, j)) / 2;
        elseif mod(i,2) ~= 0 && mod(j,2) == 0
            R(i,j) = (R(i,j-1) + R(i, j+1)) / 2;
        end
    end
end

I(:,:,1) = R;
I(:,:,2) = G;
I(:,:,3) = B;
imshow(I,[])

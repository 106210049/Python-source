im = rgb2gray(imread('image\12.jpg'));
I = im;
figure;
ax1 = axes();

a = 0.3; % 10% pixels altered
b = 0.5; % 50% percent white pixels among all altered pixels

n = numel(im(:,:));
m = fix(a*n);
idx = randperm(n, m);

k = fix(b*m);
idx1 = idx(1:k);
idx2 = idx(k+1:end);

idx1 = idx1' + n.*(0:size(im,3)-1);
idx1 = idx1(:);
idx2 = idx2' + n.*(0:size(im,3)-1);
idx2 = idx2(:);

im(idx1) = 255;
im(idx2) = 0;

ax2 = axes();
subplot(2,2,1);
imshow(im,[]);
H1 = [1 2 1; 2 4 2; 1 2 1] / 16;
Y1 = conv2(im,H1);
subplot(2,2,2);
imshow(Y1,[]);
%%%%%%%%%%%%%%%%%%
ikq = ig;
s=size(im);
for i=2:s(1)-1
    for j=2:s(2)-1
        for ii = -2:2
            for jj = -2:2
              if (i+ii >=1 and i+ii<)
              a=[a im(i+ii,j+jj)];
            end
        end
        a=sort(a);
        ikq(i,j)=uint8(a(5));
    end
end
subplot(2,2,3)
imshow(ikq,[]);
%%%
Y2 = medfilt2(im);
subplot(2,2,4)
imshow(Y2,[]);
img = imread('image\19.jpg');
figure
imshow(img,[]);
R=img( : ,:  ,1);
B=img(:,:,3);
G=img(:,:,2);
%Red channel
mR=zeros(size(R));
mR(1:2:end ,1:2:end)=1;
Cr=R.*uint8(mR);
%Blue channel
mB=zeros(size(R));
mB(2:2:end , 2:2:end)=1;
Cb=B.*uint8(mB);
%Green channel
mG=ones(size(R));
mG=mG-mB-mR;
Cg=G.*uint8(mG);
RGB=Cr+Cg+Cb;

F=[-2 3 -6 3 -2;3 4 2 4 3;-6 2 48 2 -6;3 4 2 4 3;-2 3 -6 3 -2]/64;
%Luminance
L=conv2(RGB,F,'same');
%chrominance
ChR=double(Cr)-L;
ChB=double(Cb)-L;
ChG=double(Cg)-L;
%demultiplex chr;
ChR2=ChR.*double(mR);
ChG2=ChG.*double(mG);
ChB2=ChB.*double(mB);

dempl=cat(3,ChR2,ChG2,ChB2);
%intepol
Fg=[0 1/4 0;1/4 1 1/4; 0 1/4 0];
Frb=[1/4 1/2 1/4;1/2 1 1/2;1/4 1/2 1/4];
ChR3=conv2(ChR2,Frb,'same');
ChG3=conv2(ChG2,Fg,'same');
ChB3=conv2(ChB2,Frb,'same');

chrom=cat(3,ChR3,ChG3,ChB3);
%new R G B
new_R=L+ChR3;
new_B=L+ChB3;
new_G=L+ChG3;
new_RGB=cat(3,new_R,new_G,new_B);

%display
figure
imshow(uint8(new_RGB));


  




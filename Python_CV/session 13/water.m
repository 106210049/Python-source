clc
clear all
close all
warning off
bw=imread('circles.png');
nexttile;
imshow(bw)
title('Original Image');
mk=imhmin(255-uint8(bwdist(~bw)),2);
nexttile;
imshow(mk,[]);
title('Pre-processed Image');
gs=watershed(mk);
abs=gs==0;
nexttile;
imshow(labeloverlay(double(bw),double(abs),'Colormap',[1 1 0],'Transparency',0))
title('Segmented Image');
nexttile;
imshow(label2rgb(gs));
title('Segmented Color Image');
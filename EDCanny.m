clc;
clear;
close all;
% Edge detection...(SOBEL)
img=imread('./test-img.jpg');
img= rgb2gray(img);
[h,w,c]=size(img);
img2=zeros(h,w);
imgL1=zeros(h,w);
imgL2=zeros(h,w);
imgL3=zeros(h,w);

GX=[1,2,1;0,0,0;-1,-2,-1];
GY=[-1,-2,-1;0,0,0;1,2,1];

for i=2:h-1
    for j=2:w-1
        imgL1(i,j)= img(i-1,j-1)*GX(1,1)+ img(i, j-1)* GX(2,1)+img(i+1,j-1)*GX(3,1)+ img(i-1, j)* GX(1,2)+img(i,j)*GX(2,2)+ img(i+1, j)* GX(3,2)+img(i-1,j+1)*GX(1,3)+ img(i, j+1)* GX(2,3)+img(i+1,j+1)*GX(3,3);
    end
end
for i=2:h-1
    for j=2:w-1
        imgL2(i,j)= imgL1(i-1,j-1)*GY(1,1)+ imgL1(i, j-1)* GY(2,1)+imgL1(i+1,j-1)*GY(3,1)+ imgL1(i-1, j)* GY(1,2)+imgL1(i,j)*GY(2,2)+ imgL1(i+1, j)* GY(3,2)+imgL1(i-1,j+1)*GY(1,3)+ imgL1(i, j+1)* GY(2,3)+imgL1(i+1,j+1)*GY(3,3);
    end
end

img2= imgL2;
imshow(img); 
figure;
img2= uint8(img2);
imshow(img2);

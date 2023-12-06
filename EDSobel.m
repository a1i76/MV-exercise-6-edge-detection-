clc;
clear;
close all;
% 9.Edge detection...(SOBEL)
img=imread('./test-img.jpg');
img= rgb2gray(img);
[h,w,c]=size(img);
img2=zeros(h,w);
Gx=[-1,0,1;-2,0,2; -1,0,1];
Gy=[-1, -2, -1;0,0,0;1,2,1];

for i = 2:h-1
    for j = 2:w-1
    target= GetTarget (img,i,j);
    G1= ApplyMask (Gx, target);
    G2= ApplyMask (Gy, target); 
    G = G1 + G2;
    img2(i,j)= G;
    end
end
target = GetTarget(img,i,j);
target2 = ApplyMask(Gx,target);
imshow(img); 
figure;
img2= uint8(img2);
imshow(img2);

function G =ApplyMask (mask, target)
    m=mask .* target;
    G =sum(m, 'all');
end



function target= GetTarget (M,i,j)
    target= zeros (3,3);
    for x=-1:1
        for y=-1:1
            target (x+2,y+2)=M(i+x, j+y);
        end
    end
end

% Sourabh Tirodkar
% 3589406164
% tirodkar@usc.edu
% Submission Date- 16th Feb,20
 
 
% PROBLEM 2A_1
% HALFTONING- DITHERING
% LIGHT HOUSE IMAGE
% DITHERING MATRIX

%Input image
N=750;
M=500;
I = readraw_grey('C:\Users\user\Desktop\USC Classes\Spring 2020\EE569- Digital Image Processing\Homeworks\HW #2\EE569_Spring_2020_HW2_Materials\Problem2\LightHouse.raw', N,M);
figure(1)
imshow(uint8(I));
I = double (I);


n2=2;
n8=8;
n16=16;
n32=32;

D2=[1 2;3 0];
D4=[4*D2+1 4*D2+2;4*D2+3 4*D2];
D8=[4*D4+1 4*D4+2;4*D4+3 4*D4];
D16=[4*D8+1 4*D8+2;4*D8+3 4*D8];
D32=[4*D16+1 4*D16+2;4*D16+3 4*D16];

T2=((D2+0.5)/(n2^2))*255;
T8=((D8+0.5)/(n8^2))*255;
T16=((D16+0.5)/(n16^2))*255;
T32=((D32+0.5)/(n32^2))*255;

for i=1:1:500
    for j=1:1:750
        if I(i,j)<T2(1+mod(i,n2),1+mod(j,n2))
            II(i,j)=0;
        else
            II(i,j)=255;
        end
    end
end
figure(2)
imshow((II))
title('Dithering Matrix-2');


for i=1:1:500
    for j=1:1:750
        if I(i,j)<T8(1+mod(i,n8),1+mod(j,n8))
            II(i,j)=0;
        else
            II(i,j)=255;
        end
    end
end
figure(3)
imshow((II))
title('Dithering Matrix-8');

for i=1:1:500
    for j=1:1:750
        if I(i,j)<T32(1+mod(i,n32),1+mod(j,n32))
            II(i,j)=0;
        else
            II(i,j)=255;
        end
    end
end
figure(4)
imshow((II))
title('Dithering Matrix-32');
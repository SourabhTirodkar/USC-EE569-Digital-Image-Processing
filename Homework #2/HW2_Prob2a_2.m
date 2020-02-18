% Sourabh Tirodkar
% 3589406164
% tirodkar@usc.edu
% Submission Date- 16th Feb,20
 
 
% PROBLEM 2A_1
% HALFTONING- DITHERING
% LIGHT HOUSE IMAGE
% RANDOM THRESHOLDING

%Input image
N=750;
M=500;
I = readraw_grey('C:\Users\user\Desktop\USC Classes\Spring 2020\EE569- Digital Image Processing\Homeworks\HW #2\EE569_Spring_2020_HW2_Materials\Problem2\LightHouse.raw', N,M);
figure(1)
imshow(uint8(I));
I = double (I);

T=rand(M,N)*255;
for i=1:1:500
    for j=1:1:750
        if I(i,j)<T(i,j)
            II(i,j)=0;
        else
            II(i,j)=255;
        end
    end
end
figure(2)
imshow(uint8(II))
title('Random Thresholding');
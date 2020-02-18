% Sourabh Tirodkar
% 3589406164
% tirodkar@usc.edu
% Submission Date- 16th Feb,20


% PROBLEM 1A
% SOBEL EDGE DETECTOR
% DOG IMAGE

N=481;
M=321;
%I = readraw_color('C:\Users\user\Desktop\USC Classes\Spring 2020\EE569- Digital Image Processing\MATLAB Files\EE569_Spring_2020_HW2_Materials\Problem1\Dogs.raw',N,M);
I = imread('C:\Users\user\Desktop\USC Classes\Spring 2020\EE569- Digital Image Processing\Homeworks\HW #2\EE569_Spring_2020_HW2_Materials\Problem1\Dogs.jpg');
I=double(I);
figure(1)
imshow(uint8(I));

%[row col]= size(I);
% row=321;
% col=481;

%%padding
% II=zeros(row+2,col+2,3);
% for i=1:1:row
%     for j=1:1:col
%         II(i+1,j+1)=I(i,j);
%     end
% end
% 
% for j=1:1:col
%     II(1,j+1)=I(1,j);
%     II(row+2,j+1)=I(row,j);
% end
% 
% for i=1:1:row+2
%     II(i,1)=II(i,2);
%     II(i,col+2)=II(i,col+1);
% end

%%

R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);

Y=0.2989*R + 0.5870*G + 0.1140*B;
figure(2)
imshow(uint8(Y))

for i=2:1:320
    for j=2:1:480
    Gx(i,j)=(-1*Y(i-1,j-1)+ 0 + 1*Y(i-1,j+1) -2*Y(i,j-1)+ 0 + 2*Y(i,j+1) -1*Y(i+1,j-1)+ 0 + 1*Y(i+1,j+1));
    end
end

for j=2:1:480
    for i=2:1:320
    Gy(i,j)=(1*Y(i-1,j-1)+ 2*Y(i-1,j) + 1*Y(i-1,j+1)+ 0 + 0+ 0 -1*Y(i+1,j-1) -2*Y(i+1,j)-1*Y(i+1,j+1));
    end
end

YY=zeros(320,480);
YY=sqrt((Gx).^2+(Gy).^2);

for i=2:1:320
    for j=2:1:480
Gx1(i,j)= 255*(Gx(i,j) - min(Gx))/(max(Gx) - min(Gx));
Gy1(i,j)= 255*(Gy(i,j) - min(Gy))/(max(Gy) - min(Gy));
YY1(i,j)= 255*(YY(i,j) - min(YY))/(max(YY) - min(YY));
    end
end

% X gradient
figure(3)
imshow(uint8(Gx1))
% Y gradient
figure(4)
imshow(uint8(Gy1))
% gradient magnitude
figure(5)
imshow(uint8(YY))

%%

T=80;
% thre=0.85;
% abc=thre*(320*480);
% abc=count;

count=0;
for i=1:1:320
    for j=1:1:480
        %0.85*(320*480)/100
        if YY1(i,j)<T
            zz(i,j)=255;
            count=count+1;
        else
            zz(i,j)=0;
        end
    end
end
figure(6)
imshow(uint8(zz))
thre=(count/(320*480))*100;
title("Thresholding to invert the image- Pixel val:60, Threshold %="+(thre));

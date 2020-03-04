% Sourabh Tirodkar
% 3589406164
% tirodkar@usc.edu
% Submission Date- 3rd March,20
%Problem 1A

% Hedwig, Raccoon, bb8

N=512;
M=512;
%I = readraw_color('C:\Users\user\Desktop\USC Classes\Spring 2020\EE569- Digital Image Processing\MATLAB Files\EE569_Spring_2020_HW2_Materials\Problem1\hedwig.raw',M,N);
given_image = imread('C:\Users\user\Desktop\USC Classes\Spring 2020\EE569- Digital Image Processing\Homeworks\HW #3\EE569_2020_Spring_HW3_materials_updated\hedwig.jpg');
given_image=double(given_image);
figure(1)
imshow(uint8(given_image));


[row col n]=size(given_image);
warped_image=zeros(row,row);

for i=1:1:row
   for j=1:1:row
       r(i,j)=given_image(i,j,1); % Seprating into R,G and B
       g(i,j)=given_image(i,j,2);
       b(i,j)=given_image(i,j,3);
       x_mappedrange=(i-257)/256; % Image Pixels ranging from -1 to 1
       y_mappedrange=(j-257)/256;  
       u=x_mappedrange*sqrt(1-((y_mappedrange)^2)/2);  % Square to Circle in range of -1 to 1
       v=y_mappedrange*sqrt(1-((x_mappedrange)^2)/2);
       x_new=round((u*256)+257);  % Position remapped
       y_new=round((v*256)+257);
       warped_image(x_new,y_new,1)=r(i,j); % combining channels
       warped_image(x_new,y_new,2)=g(i,j);
       warped_image(x_new,y_new,3)=b(i,j);
   end
end
figure(2)
imshow(uint8(warped_image))
title('Wraped Image')

restored_image=given_image;
for i=1:1:row
   for j=1:1:row
       r1(i,j)=warped_image(x_new,y_new,1);
       g1(i,j)=warped_image(x_new,y_new,2);
       b1(i,j)=warped_image(x_new,y_new,3);
       xx_m=(i-257)/256;
       yy_m=(j-257)/256;
       uu=((0.5*(sqrt(2+2*xx_m*sqrt(2)+xx_m^2-yy_m^2+1.9))-0.5*(sqrt(2-2*xx_m*sqrt(2)+xx_m^2-yy_m^2+1.9))));
       vv=((0.5*(sqrt(2+2*yy_m*sqrt(2)-xx_m^2+yy_m^2+1.9))-0.5*(sqrt(2-2*yy_m*sqrt(2)-xx_m^2+yy_m^2+1.9))));
       xx=round((uu*256)+257);
       yy=round((vv*256)+257);
       restored_image(xx,yy,1)=r1(i,j);
       restored_image(xx,yy,2)=g1(i,j);
       restored_image(xx,yy,3)=b1(i,j);
   end
end
figure(3)
imshow(uint8(restored_image))
title('Restored Image')
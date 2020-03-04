% Sourabh Tirodkar
% 3589406164
% tirodkar@usc.edu
% Submission Date- 3rd March,20
%Problem 1B

% Panorama

%I = readraw_color('C:\Users\user\Desktop\USC Classes\Spring 2020\EE569- Digital Image Processing\MATLAB Files\EE569_Spring_2020_HW2_Materials\Problem1\hedwig.raw',M,N);
I1 = imread('C:\Users\user\Desktop\USC Classes\Spring 2020\EE569- Digital Image Processing\Homeworks\HW #3\EE569_2020_Spring_HW3_materials_updated\left.jpg');
% I1=double(I1);
I1=rgb2gray(I1);
figure(1)
imshow((I1));

I2 = imread('C:\Users\user\Desktop\USC Classes\Spring 2020\EE569- Digital Image Processing\Homeworks\HW #3\EE569_2020_Spring_HW3_materials_updated\middle.jpg');
% I2=double(I2);
I2=rgb2gray(I2);
figure(2)
imshow((I2));

I3 = imread('C:\Users\user\Desktop\USC Classes\Spring 2020\EE569- Digital Image Processing\Homeworks\HW #3\EE569_2020_Spring_HW3_materials_updated\right.jpg');
% I3=double(I3);
I3=rgb2gray(I3);
figure(3)
imshow((I3));

%
points1 = detectHarrisFeatures(I1);
points2 = detectHarrisFeatures(I2);
points3 = detectHarrisFeatures(I3);

[features1,valid_points1] = extractFeatures(I1,points1);
[features2,valid_points2] = extractFeatures(I2,points2);
[features3,valid_points3] = extractFeatures(I3,points3);

indexPairs1 = matchFeatures(features1,features2);
indexPairs2 = matchFeatures(features2,features3);

matchedPoints1 = valid_points1(indexPairs1(:,1),:);
matchedPoints2 = valid_points2(indexPairs1(:,2),:);

matchedPoints3 = valid_points2(indexPairs2(:,1),:);
matchedPoints4 = valid_points3(indexPairs2(:,2),:);

figure(4)
showMatchedFeatures(I1,I2, matchedPoints1,matchedPoints2);
legend('matched points 1','matched points 2');

figure(5)
showMatchedFeatures(I2,I3, matchedPoints3,matchedPoints4);
legend('matched points 2','matched points 3');


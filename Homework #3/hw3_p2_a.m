% Sourabh Tirodkar
% 3589406164
% tirodkar@usc.edu
% Submission Date- 3rd March,20
%Problem 2A

% Shrinking, Thinning and Skeletonizing
%%
%image = readraw_grey('C:\Users\user\Desktop\USC Classes\Spring 2020\EE569- Digital Image Processing\Homeworks\HW #3\EE569_2020_Spring_HW3_materials_updated\maze.raw',558,558);
I = imread('C:\Users\user\Desktop\USC Classes\Spring 2020\EE569- Digital Image Processing\Homeworks\HW #3\EE569_2020_Spring_HW3_materials_updated\maze.jpg');
figure(1);
imshow(I);
title('Original Binary Image');

load('S_conditional.mat');
load('K_conditional.mat');
load('T_conditional.mat');

[row col]=size(I);
I=I/255;
Boundary_image(2:row+1,2:col+1)=I;
Boundary_image(1,2:col+1)=I(2,:);
Boundary_image(row+2,2:col+1)=I(row-1,:);
Boundary_image(2:row+1,1)=I(:,2);
Boundary_image(2:row+1,col+2)=I(:,col-1);
%%

%%Shrinking
F=Boundary_image;
M=zeros(row+2,col+2);
G1=zeros(row+2,col+2);
h=1;
flag=true;
while(flag)
temp=G1;
for i=2:row+1
    for j=2:col+1
        if(F(i,j)==1)
           temp1=[F(i,j+1),F(i-1,j+1),F(i-1,j),F(i-1,j-1),F(i,j-1),F(i+1,j-1),F(i+1,j),F(i+1,j+1)];
           m=0;
           for n=1:length(S_conditional)
              if(isequal(temp1,S_conditional(n,:)))  
                  m=1;
              end
           end
           M(i,j)=m;        
        end
    end
end
%figure(2);
%imshow(M);
for i=2:row+1
    for j=2:col+1
            G1(i,j)=S_T_unconditional(F(i,j),M(i,j),M(i,j+1),M(i-1,j+1),M(i-1,j),M(i-1,j-1),M(i,j-1),M(i+1,j-1),M(i+1,j),M(i+1,j+1)); 
    end
end
%figure(3);
%imshow(G1);
h=h+1;
if(isequal(temp,G1))
  flag=false;
end
F=G1;
M=zeros(row+2,col+2);
end
figure(4);
imshow(G1);
title('Shrinking Image');
%%


%%
%%Thinning
F=Boundary_image;
M=zeros(row+2,col+2);
G1=zeros(row+2,col+2);
h=1;
flag=true;
while(flag)
temp=G1;
for i=2:row+1
    for j=2:col+1
        if(F(i,j)==1)
           temp1=[F(i,j+1),F(i-1,j+1),F(i-1,j),F(i-1,j-1),F(i,j-1),F(i+1,j-1),F(i+1,j),F(i+1,j+1)];
           m=0;
           for n=1:length(T_conditional)
              if(isequal(temp1,T_conditional(n,:)))
                  m=1;
              end
           end
           M(i,j)=m;        
        end
    end
end
figure(2);
imshow(M);
for i=2:row+1
    for j=2:col+1
            G1(i,j)=S_T_unconditional(F(i,j),M(i,j),M(i,j+1),M(i-1,j+1),M(i-1,j),M(i-1,j-1),M(i,j-1),M(i+1,j-1),M(i+1,j),M(i+1,j+1)); 
    end
end
figure(3);
imshow(G1);
h=h+1;
if(isequal(temp,G1))
  flag=false;
end
F=G1;
M=zeros(row+2,col+2);
end
figure(5);
imshow(G1);
title('Thinning Image');
%%


%%
%%Skeletonizing
F=Boundary_image;
M=zeros(row+2,col+2);
G1=zeros(row+2,col+2);
h=1;
flag=true;
while(flag)
temp=G1;
for i=2:row+1
    for j=2:col+1
        if(F(i,j)==1)
           temp1=[F(i,j+1),F(i-1,j+1),F(i-1,j),F(i-1,j-1),F(i,j-1),F(i+1,j-1),F(i+1,j),F(i+1,j+1)];
           m=0;
           for n=1:length(K_conditional)
              if(isequal(temp1,K_conditional(n,:))) 
                  m=1;
              end
           end
           M(i,j)=m;        
        end
    end
end
figure(2);
imshow(M);
for i=2:row+1
    for j=2:col+1
            G1(i,j)=K_unconditional(F(i,j),M(i,j),M(i,j+1),M(i-1,j+1),M(i-1,j),M(i-1,j-1),M(i,j-1),M(i+1,j-1),M(i+1,j),M(i+1,j+1));
    end
end
figure(3);
imshow(G1);
h=h+1;
if(isequal(temp,G1))
  flag=false;
end
F=G1;
M=zeros(row+2,col+2);
end
figure(6);
imshow(G1);
title('Skeletonizing Image');

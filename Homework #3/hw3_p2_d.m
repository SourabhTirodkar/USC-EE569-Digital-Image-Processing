% Sourabh Tirodkar
% 3589406164
% tirodkar@usc.edu
% Submission Date- 3rd March,20
%Problem 2D

% defect detection
I = imread('C:\Users\user\Desktop\USC Classes\Spring 2020\EE569- Digital Image Processing\Homeworks\HW #3\EE569_2020_Spring_HW3_materials_updated\Geartooth.jpg');
figure(1);
imshow(I);
title('Original Binary Image');

load('S_conditional.mat');
load('T_conditional.mat');
load('K_conditional.mat');

[row col]=size(I);
I=I/255;

%No reverse for counting holes
I_rev=zeros(row,col);
for i= 1:row
    for j=1:col
        if(I(i,j)==0)
            I_rev(i,j)=1;
        else
            I_rev(i,j)=0;
        end
    end
end
figure(2);
imshow(I_rev);
% I_rev=I;

Boundary_image(2:row+1,2:col+1)=I_rev;
Boundary_image(1,2:col+1)=I_rev(2,:);
Boundary_image(row+2,2:col+1)=I_rev(row-1,:);
Boundary_image(2:row+1,1)=I_rev(:,2);
Boundary_image(2:row+1,col+2)=I_rev(:,col-1);

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
% figure(2);
% imshow(M);
for i=2:row+1
    for j=2:col+1
            G1(i,j)=S_T_unconditional(F(i,j),M(i,j),M(i,j+1),M(i-1,j+1),M(i-1,j),M(i-1,j-1),M(i,j-1),M(i+1,j-1),M(i+1,j),M(i+1,j+1));  
    end
end
% figure(3);
% imshow(G);
h=h+1;
if(isequal(temp,G1))
  flag=false;
end
F=G1;
M=zeros(row+2,col+2);
end
figure(4);
imshow(G1);
title('Shrink Image');

%%
x1 = 0;
y1 = 0;
count = 0;
Stencil = zeros(row,col);
present = zeros(row,col);
absent = zeros(row,col);

 for i=2:1:row+1     
    for j=2:1:col+1
        if (G1(i,j) == 1)
            if ((G1(i-1,j-1) == 0) && (G1(i-1,j) == 0) && (G1(i-1,j+1) == 0) && (G1(i,j-1) == 0) && (G1(i,j+1) == 0) && (G1(i+1,j-1) == 0) && (G1(i+1,j) == 0) && (G1(i+1,j+1) == 0))
                count = count + 1;
                x1 = x1 + i;
                y1 = y1 + j;
                x = round((x1)/4);
                y = round((y1)/4);
            end
        end
    end
end
center(x,y) = 1;

for i=1:1:row     
    if(I(i,126) == 1)
        outermost = i;    
        break;
    end
end
radius = x - outermost;

for angle = 0:30:360
    a = ((angle * pi)/180);
    for i=105:1:radius-2
        x2 = round(x + (i * cos(a)));
        y2 = round(y + (i * sin(a)));
        Stencil(x2,y2) = 1;
    end   
end
figure(5)
imshow(Stencil)

for i=1:1:row   
    for j = 1:1:col
        present(i,j) = and(Stencil(i,j),I(i,j)) ;
        absent(i,j) = xor(Stencil(i,j),present(i,j));
    end
end
figure(6)
imshow(present)
figure(7)
imshow(absent)
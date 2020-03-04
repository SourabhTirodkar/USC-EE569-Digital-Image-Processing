% Sourabh Tirodkar
% 3589406164
% tirodkar@usc.edu
% Submission Date- 3rd March,20
%Problem 2B

% Shrinking to count

I = imread('C:\Users\user\Desktop\USC Classes\Spring 2020\EE569- Digital Image Processing\Homeworks\HW #3\EE569_2020_Spring_HW3_materials_updated\stars.jpg');
figure(1);
imshow(I);
title('Original Binary Image');

load('S_conditional.mat');

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
% figure(2);
% imshow(M);
for i=2:row+1
    for j=2:col+1
            G1(i,j)=S_T_unconditional(F(i,j),M(i,j),M(i,j+1),M(i-1,j+1),M(i-1,j),M(i-1,j-1),M(i,j-1),M(i+1,j-1),M(i+1,j),M(i+1,j+1));  
    end
end
% figure(3);
% imshow(G1);
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



count_stars=0;
for i=2:row+1
    for j=2:col+1
            if G1(i,j)==1;
                count_stars=count_stars+1
            end
    end
end

%%
% CCL algorithm
AA=Boundary_image;
label=2;
onesCount = 0;
for i=2:row+1
    for j=2:col+1
        if AA(i,j)==1
            onesCount = onesCount + 1;
            if (AA(i-1,j-1)==0 && AA(i-1,j)==0 && AA(i-1,j+1)==0 && AA(i,j-1)==0)
                AA(i,j)=label;
                label = label+1;
            else
                if (AA(i-1,j-1)~=0)
                    store1= AA(i-1,j-1);
                else
                    store1 = 9999;
                end
                if (AA(i-1,j)~=0)
                    store2= AA(i-1,j);
                else
                    store2 = 9999;
                end
                if (AA(i-1,j+1)~=0)
                    store3= AA(i-1,j+1);
                else
                    store3= 9999;
                end
                if (AA(i,j-1)~=0)
                    store4= AA(i,j-1); 
                else
                    store4 = 9999;
                end
                abc=[store1,store2,store3,store4];
                AA(i,j) = min(abc);
            end
        end
    end
end
pre =1;
cur = 0;
counter = 0;
while(pre ~= cur)
    counter = counter + 1;
    previousUnique=size(unique(AA));
    pre=previousUnique(1);
for i=2:row+1
    for j=2:col+1
        if AA(i,j)~=0
                if (AA(i-1,j-1)~=0)
                    store1= AA(i-1,j-1);
                else
                    store1 = 9999;
                end
                if (AA(i-1,j)~=0)
                    store2= AA(i-1,j);
                else
                    store2 = 9999;
                end
                if (AA(i-1,j+1)~=0)
                    store3= AA(i-1,j+1);
                else
                    store3= 9999;
                end
                if (AA(i,j-1)~=0)
                    store4= AA(i,j-1); 
                else
                    store4 = 9999;
                end
                if (AA(i,j+1)~=0)
                    store5= AA(i,j+1);
                else
                    store5 = 9999;
                end
                if (AA(i+1,j-1)~=0)
                    store6= AA(i+1,j-1);
                else
                    store6 = 9999;
                end
                if (AA(i+1,j)~=0)
                    store7= AA(i+1,j);
                else
                    store7= 9999;
                end
                if (AA(i+1,j+1)~=0)
                    store8= AA(i+1,j+1); 
                else
                    store8 = 9999;
                end
                abc=[store1,store2,store3,store4,store5,store6,store7,store8];
                value= min(abc(:));
                if( value ~= 9999 && value ~= 0)
                    AA(i,j) = value;
                end
        end
    end
end
currentUnique = size(unique(AA));
cur=currentUnique(1);
end
%%
CC=unique(AA);
count_stars_ccl= size(CC(:))
%counting stars sizes
arr=zeros(1,162)
for i=2:row+1
    for j=2:col+1
        val = AA(i,j);
        if val >0
            arr(1,val) = arr(1,val)+ 1;
        end
        
       
    end
end

%total star size count
DD=unique(arr)
EE=size(DD)
star_size_count=EE(1,2)-1

%%
%Verifying with inbuilt function
BW3 = bwmorph(Boundary_image,'shrink',Inf);
figure(5)
imshow(BW3)


count_stars1=0;
for i=2:row+1
    for j=2:col+1
            if BW3(i,j)==1;
                count_stars1=count_stars1+1;
            end
    end
end



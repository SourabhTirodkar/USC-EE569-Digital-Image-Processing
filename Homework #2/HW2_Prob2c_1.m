% Sourabh Tirodkar
% 3589406164
% tirodkar@usc.edu
% Submission Date- 16th Feb,20
 
% PROBLEM 2B
% COLOR HALFTONING
% ROSE IMAGE
% SEPARABLE ERROR METHOD


%read image
I = imread('C:\Users\user\Desktop\USC Classes\Spring 2020\EE569- Digital Image Processing\Homeworks\HW #2\EE569_Spring_2020_HW2_Materials\Problem2\Rose.jpg');
figure(1)
imshow(uint8(I));
I = double(I);

R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);

%Calculating C,M,Y
C=255-R;
M=255-G;
Y=255-B;

CMY=cat(3,C,M,Y);
figure(2)
imshow(uint8(CMY))

%%
% %Floyd Steinberg Matrix
% h=(1/16)*[0 0 0;0 0 7;3 5 1];
% h1=(1/16)*[0 0 0;7 0 0;1 5 3];

T=127;
row=480;
col=640;
%%
%for cyan
for i = 1 : row
% odd row
   if mod(i,2) ~= 0
        for j = 1 : col
            if C(i,j)>T
              b1(i,j)=255;
            else
              b1(i,j)=0;
            end
            e = C(i,j) - b1(i,j);
            if j==1 
               C(i,j+1)=C(i,j+1)+(7/16)*e;
               C(i+1,j+1)=C(i+1,j+1)+(1/16)*e;
               C(i+1,j)=C(i+1,j)+(5/16)*e;
           elseif j==col              
               C(i+1,j-1)=C(i+1,j-1)+(3/16)*e;
               C(i+1,j)=C(i+1,j)+(5/16)*e;
           else 
               C(i,j+1)=C(i,j+1)+(7/16)*e;
               C(i+1,j-1)=C(i+1,j-1)+(3/16)*e;
               C(i+1,j)=C(i+1,j)+(5/16)*e;
               C(i+1,j+1)=C(i+1,j+1)+(1/16)*e;
           end 
        end
   end
% even row
   if mod(i,2) == 0
       if i~=row
        for j = col:-1:1
             if C(i,j)>T
                 b1(i,j)=255;
             else
                 b1(i,j)=0;
             end
             e = C(i,j) - b1(i,j);
             if j==col
                   C(i,j-1)=C(i,j-1)+(7/16)*e;
                   C(i+1,j-1)=C(i+1,j-1)+(1/16)*e;
                   C(i+1,j)=C(i+1,j)+(5/16)*e;
               elseif j==1
                   C(i+1,j+1)=C(i+1,j+1)+(3/16)*e;
                   C(i+1,j)=C(i+1,j)+(5/16)*e;
               else
                   C(i,j-1)=C(i,j-1)+(7/16)*e;
                   C(i+1,j-1)=C(i+1,j-1)+(1/16)*e;
                   C(i+1,j)=C(i+1,j)+(5/16)*e;
                   C(i+1,j+1)=C(i+1,j+1)+(3/16)*e;                
               end 
        end

       end
   end
end


%for magenta
for i = 1 : row
% odd row
   if mod(i,2) ~= 0
        for j = 1 : col
            if M(i,j)>T
              b2(i,j)=255;
            else
              b2(i,j)=0;
            end
            e = M(i,j) - b2(i,j);
            if j==1 
               M(i,j+1)=M(i,j+1)+(7/16)*e;
               M(i+1,j+1)=M(i+1,j+1)+(1/16)*e;
               M(i+1,j)=M(i+1,j)+(5/16)*e;
           elseif j==col              
               M(i+1,j-1)=M(i+1,j-1)+(3/16)*e;
               M(i+1,j)=M(i+1,j)+(5/16)*e;
           else 
               M(i,j+1)=M(i,j+1)+(7/16)*e;
               M(i+1,j-1)=M(i+1,j-1)+(3/16)*e;
               M(i+1,j)=M(i+1,j)+(5/16)*e;
               M(i+1,j+1)=M(i+1,j+1)+(1/16)*e;
           end 
        end
   end
% even row
   if mod(i,2) == 0
       if i~=row
        for j = col:-1:1
             if M(i,j)>T
                 b2(i,j)=255;
             else
                 b2(i,j)=0;
             end
             e = M(i,j) - b2(i,j);
             if j==col
                   M(i,j-1)=M(i,j-1)+(7/16)*e;
                   M(i+1,j-1)=M(i+1,j-1)+(1/16)*e;
                   M(i+1,j)=M(i+1,j)+(5/16)*e;
               elseif j==1
                   M(i+1,j+1)=M(i+1,j+1)+(3/16)*e;
                   M(i+1,j)=M(i+1,j)+(5/16)*e;
               else
                   M(i,j-1)=M(i,j-1)+(7/16)*e;
                   M(i+1,j-1)=M(i+1,j-1)+(1/16)*e;
                   M(i+1,j)=M(i+1,j)+(5/16)*e;
                   M(i+1,j+1)=M(i+1,j+1)+(3/16)*e;                
               end 
        end

       end
   end
end


%for yellow
for i = 1 : row
% odd row
   if mod(i,2) ~= 0
        for j = 1 : col
            if Y(i,j)>T
              b3(i,j)=255;
            else
              b3(i,j)=0;
            end
            e = Y(i,j) - b3(i,j);
            if j==1 
               Y(i,j+1)=Y(i,j+1)+(7/16)*e;
               Y(i+1,j+1)=Y(i+1,j+1)+(1/16)*e;
               Y(i+1,j)=Y(i+1,j)+(5/16)*e;
           elseif j==col              
               Y(i+1,j-1)=Y(i+1,j-1)+(3/16)*e;
               Y(i+1,j)=Y(i+1,j)+(5/16)*e;
           else 
               Y(i,j+1)=Y(i,j+1)+(7/16)*e;
               Y(i+1,j-1)=Y(i+1,j-1)+(3/16)*e;
               Y(i+1,j)=Y(i+1,j)+(5/16)*e;
               Y(i+1,j+1)=Y(i+1,j+1)+(1/16)*e;
           end 
        end
   end
% even row
   if mod(i,2) == 0
       if i~=row
        for j = col:-1:1
             if Y(i,j)>T
                 b3(i,j)=255;
             else
                 b3(i,j)=0;
             end
             e = Y(i,j) - b3(i,j);
             if j==col
                   Y(i,j-1)=Y(i,j-1)+(7/16)*e;
                   Y(i+1,j-1)=Y(i+1,j-1)+(1/16)*e;
                   Y(i+1,j)=Y(i+1,j)+(5/16)*e;
               elseif j==1
                   Y(i+1,j+1)=Y(i+1,j+1)+(3/16)*e;
                   Y(i+1,j)=Y(i+1,j)+(5/16)*e;
               else
                   Y(i,j-1)=Y(i,j-1)+(7/16)*e;
                   Y(i+1,j-1)=Y(i+1,j-1)+(1/16)*e;
                   Y(i+1,j)=Y(i+1,j)+(5/16)*e;
                   Y(i+1,j+1)=Y(i+1,j+1)+(3/16)*e;                
               end 
        end

       end
   end
end

rr=255-b1;
gg=255-b2;
bb=255-b3;
RGB123=zeros(479,640, 3);
RGB123(:,:,1)=rr;
RGB123(:,:,2)=gg;
RGB123(:,:,3)=bb;
figure(3)
imshow(uint8(RGB123))
title('Color Halftone By Separable Error Diffusion')



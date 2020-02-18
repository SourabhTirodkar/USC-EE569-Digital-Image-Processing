% Sourabh Tirodkar
% 3589406164
% tirodkar@usc.edu
% Submission Date- 16th Feb,20
 
% PROBLEM 2B
% HALFTONING- ERROR DIFFUSION
% LIGHT HOUSE IMAGE
% FLOYD, JJN AND STUCKI


N=750;
M=500;
I = readraw_grey('C:\Users\user\Desktop\USC Classes\Spring 2020\EE569- Digital Image Processing\Homeworks\HW #2\EE569_Spring_2020_HW2_Materials\Problem2\LightHouse.raw', N,M);
figure(1)
imshow(uint8(I));
I = double(I);

%copying image into f
f=I;

%Floyd Steinberg Matrix
h=(1/16)*[0 0 0;0 0 7;3 5 1];
h1=(1/16)*[0 0 0;7 0 0;1 5 3];
 

T=128;
row=500;
col=750;
for i = 1 : row
% odd row
   if mod(i,2) ~= 0
        for j = 1 : col
            if f(i,j)>T
              b(i,j)=255;
            else
              b(i,j)=0;
            end
            e = f(i,j) - b(i,j);
            if j==1 
               f(i,j+1)=f(i,j+1)+(7/16)*e;
               f(i+1,j+1)=f(i+1,j+1)+(1/16)*e;
               f(i+1,j)=f(i+1,j)+(5/16)*e;
           elseif j==col              
               f(i+1,j-1)=f(i+1,j-1)+(3/16)*e;
               f(i+1,j)=f(i+1,j)+(5/16)*e;
           else 
               f(i,j+1)=f(i,j+1)+(7/16)*e;
               f(i+1,j-1)=f(i+1,j-1)+(3/16)*e;
               f(i+1,j)=f(i+1,j)+(5/16)*e;
               f(i+1,j+1)=f(i+1,j+1)+(1/16)*e;
           end 
        end
   end
% even row
   if mod(i,2) == 0
       if i~=row
        for j = col:-1:1
             if f(i,j)>T
                 b(i,j)=255;
             else
                 b(i,j)=0;
             end
             e = f(i,j) - b(i,j);
             if j==col
                   f(i,j-1)=f(i,j-1)+(7/16)*e;
                   f(i+1,j-1)=f(i+1,j-1)+(1/16)*e;
                   f(i+1,j)=f(i+1,j)+(5/16)*e;
               elseif j==1
                   f(i+1,j+1)=f(i+1,j+1)+(3/16)*e;
                   f(i+1,j)=f(i+1,j)+(5/16)*e;
               else
                   f(i,j-1)=f(i,j-1)+(7/16)*e;
                   f(i+1,j-1)=f(i+1,j-1)+(1/16)*e;
                   f(i+1,j)=f(i+1,j)+(5/16)*e;
                   f(i+1,j+1)=f(i+1,j+1)+(3/16)*e;                
               end 
        end

       end
   end
end
figure(2);
imshow(uint8(b))
title('Floyd - Steinberg Algorithm')


%JJN
%copying image into f
f=I;
b=zeros(row,col);
for i=1:row    
    if(mod(i,2)~=0)
      if i~= (row-1)
       for j=1:col
           if (f(i,j)>T)
               b(i,j)=255;
           else
               b(i,j)=0;
           end
           e=f(i,j)-b(i,j);
           if j==1 
               f(i,j+1)=f(i,j+1)+(7/48)*e;
               f(i,j+2)=f(i,j+2)+(5/48)*e;
               f(i+1,j+1)=f(i+1,j+1)+(5/48)*e;
               f(i+1,j+2)=f(i+1,j+2)+(3/48)*e;
               f(i+2,j+1)=f(i+2,j+1)+(3/48)*e;
               f(i+2,j+2)=f(i+2,j+2)+(1/48)*e;
               f(i+1,j)=f(i+1,j)+(7/48)*e;
               f(i+2,j)=f(i+2,j)+(5/48)*e;
           elseif j==2
               f(i,j+1)=f(i,j+1)+(7/48)*e;
               f(i,j+2)=f(i,j+2)+(5/48)*e;
               f(i+1,j)=f(i+1,j)+(7/48)*e;
               f(i+2,j)=f(i+2,j)+(5/48)*e;
               f(i+1,j+1)=f(i+1,j+1)+(5/48)*e;
               f(i+1,j+2)=f(i+1,j+2)+(3/48)*e;
               f(i+2,j+1)=f(i+2,j+1)+(3/48)*e;
               f(i+2,j+2)=f(i+2,j+2)+(1/48)*e;
               f(i+1,j-1)=f(i+1,j-1)+(5/48)*e; 
               f(i+2,j-1)=f(i+2,j-1)+(3/48)*e;
           elseif j==col              
               f(i+1,j-1)=f(i+1,j-1)+(5/48)*e;
               f(i+1,j-2)=f(i+1,j-2)+(3/48)*e;
               f(i+2,j-1)=f(i+2,j-1)+(3/48)*e;
               f(i+2,j-2)=f(i+2,j-2)+(1/48)*e;
               f(i+1,j)=f(i+1,j)+(7/48)*e;
               f(i+2,j)=f(i+2,j)+(5/48)*e;
           elseif j==col-1
               f(i+1,j-1)=f(i+1,j-1)+(5/48)*e;
               f(i+1,j-2)=f(i+1,j-2)+(3/48)*e;
               f(i+2,j-1)=f(i+2,j-1)+(3/48)*e;
               f(i+2,j-2)=f(i+2,j-2)+(1/48)*e;
               f(i+1,j)=f(i+1,j)+(7/48)*e;
               f(i+2,j)=f(i+2,j)+(5/48)*e;
               f(i,j+1)=f(i,j+1)+(7/48)*e;
               f(i+1,j+1)=f(i+1,j+1)+(5/48)*e;
               f(i+2,j+1)=f(i+2,j+1)+(3/48)*e;             
           else 
               f(i,j+1)=f(i,j+1)+(7/48)*e;
               f(i,j+2)=f(i,j+2)+(5/48)*e;
               f(i+1,j)=f(i+1,j)+(7/48)*e;
               f(i+2,j)=f(i+2,j)+(5/48)*e;
               f(i+1,j+1)=f(i+1,j+1)+(5/48)*e;
               f(i+1,j+2)=f(i+1,j+2)+(3/48)*e;
               f(i+2,j+1)=f(i+2,j+1)+(3/48)*e;
               f(i+2,j+2)=f(i+2,j+2)+(1/48)*e;
               f(i+1,j-1)=f(i+1,j-1)+(5/48)*e;
               f(i+1,j-2)=f(i+1,j-2)+(3/48)*e;
               f(i+2,j-1)=f(i+2,j-1)+(3/48)*e;
               f(i+2,j-2)=f(i+2,j-2)+(1/48)*e;
           end  
       end
      else
          for j=col:-1:1
               if (f(i,j)>T)
                    b(i,j)=255;
               else
                    b(i,j)=0;
               end
               e=f(i,j)-b(i,j);
            if j==1 
               f(i,j+1)=f(i,j+1)+(7/48)*e;
               f(i,j+2)=f(i,j+2)+(5/48)*e;
               f(i+1,j)=f(i+1,j)+(7/48)*e;
               f(i+1,j+1)=f(i+1,j+1)+(5/48)*e;
               f(i+1,j+2)=f(i+1,j+2)+(3/48)*e;              
            elseif j==2
               f(i,j+1)=f(i,j+1)+(7/48)*e;
               f(i,j+2)=f(i,j+2)+(5/48)*e;
               f(i+1,j)=f(i+1,j)+(7/48)*e;
               f(i+1,j+1)=f(i+1,j+1)+(5/48)*e;
               f(i+1,j+2)=f(i+1,j+2)+(3/48)*e;
               f(i+1,j-1)=f(i+1,j-1)+(5/48)*e; 
           elseif j==col              
               f(i+1,j-1)=f(i+1,j-1)+(5/48)*e;
               f(i+1,j-2)=f(i+1,j-2)+(3/48)*e;
               f(i+1,j)=f(i+1,j)+(7/48)*e;
           elseif j==col-1
               f(i+1,j-1)=f(i+1,j-1)+(5/48)*e;
               f(i+1,j-2)=f(i+1,j-2)+(3/48)*e;
               f(i+1,j)=f(i+1,j)+(7/48)*e;
               f(i,j+1)=f(i,j+1)+(7/48)*e;
               f(i+1,j+1)=f(i+1,j+1)+(5/48)*e;           
           else 
               f(i,j+1)=f(i,j+1)+(7/48)*e;
               f(i,j+2)=f(i,j+2)+(5/48)*e;
               f(i+1,j)=f(i+1,j)+(7/48)*e;
               f(i+1,j+1)=f(i+1,j+1)+(5/48)*e;
               f(i+1,j+2)=f(i+1,j+2)+(3/48)*e;
               f(i+1,j-1)=f(i+1,j-1)+(5/48)*e;
               f(i+1,j-2)=f(i+1,j-2)+(3/48)*e;
            end 
          end
      end
      
    else
        if i~=row
            for j=col:-1:1
                if (f(i,j)>T)
                    b(i,j)=255;
                else
                    b(i,j)=0;
                end
                e=f(i,j)-b(i,j);
               if j==col
                   f(i,j-1)=f(i,j-1)+(7/48)*e;
                   f(i,j-2)=f(i,j-2)+(5/48)*e;
                   f(i+1,j)=f(i+1,j)+(7/48)*e;
                   f(i+2,j)=f(i+2,j)+(5/48)*e;
                   f(i+2,j-1)=f(i+2,j-1)+(3/48)*e;
                   f(i+2,j-2)=f(i+2,j-2)+(1/48)*e;
                   f(i+1,j-1)=f(i+1,j-1)+(5/48)*e;
                   f(i+1,j-2)=f(i+1,j-2)+(3/48)*e;
               elseif j==col-1
                   f(i+1,j)=f(i+1,j)+(7/48)*e;
                   f(i+2,j)=f(i+2,j)+(5/48)*e;
                   f(i,j-1)=f(i,j-1)+(7/48)*e;
                   f(i,j-2)=f(i,j-2)+(5/48)*e;
                   f(i+2,j-1)=f(i+2,j-1)+(3/48)*e;
                   f(i+2,j-2)=f(i+2,j-2)+(1/48)*e;
                   f(i+1,j-1)=f(i+1,j-1)+(5/48)*e;
                   f(i+1,j-2)=f(i+1,j-2)+(3/48)*e;
                   f(i+2,j+1)=f(i+2,j+1)+(3/48)*e;
                   f(i+1,j+1)=f(i+1,j+1)+(5/48)*e;      
               elseif j==1
                   f(i+1,j)=f(i+1,j)+(7/48)*e;
                   f(i+2,j)=f(i+2,j)+(5/48)*e;
                   f(i+2,j+1)=f(i+2,j+1)+(3/48)*e;
                   f(i+2,j+2)=f(i+2,j+2)+(1/48)*e;
                   f(i+1,j+1)=f(i+1,j+1)+(5/48)*e;
                   f(i+1,j+2)=f(i+1,j+2)+(3/48)*e;
               elseif j==2
                   f(i,j-1)=f(i,j-1)+(7/48)*e;
                   f(i+2,j-1)=f(i+2,j-1)+(3/48)*e;
                   f(i+1,j-1)=f(i+1,j-1)+(5/48)*e;
                   f(i+1,j)=f(i+1,j)+(7/48)*e;
                   f(i+2,j)=f(i+2,j)+(5/48)*e;
                   f(i+2,j+1)=f(i+2,j+1)+(3/48)*e;
                   f(i+2,j+2)=f(i+2,j+2)+(1/48)*e;
                   f(i+1,j+1)=f(i+1,j+1)+(5/48)*e;
                   f(i+1,j+2)=f(i+1,j+2)+(3/48)*e;                   
               else
                   f(i+1,j)=f(i+1,j)+(7/48)*e;
                   f(i+2,j)=f(i+2,j)+(5/48)*e;
                   f(i,j-1)=f(i,j-1)+(7/48)*e;
                   f(i,j-2)=f(i,j-2)+(5/48)*e;
                   f(i+2,j-1)=f(i+2,j-1)+(3/48)*e;
                   f(i+2,j-2)=f(i+2,j-2)+(1/48)*e;
                   f(i+1,j-1)=f(i+1,j-1)+(5/48)*e;
                   f(i+1,j-2)=f(i+1,j-2)+(3/48)*e;
                   f(i+2,j+1)=f(i+2,j+1)+(3/48)*e;
                   f(i+2,j+2)=f(i+2,j+2)+(1/48)*e;
                   f(i+1,j+1)=f(i+1,j+1)+(5/48)*e;
                   f(i+1,j+2)=f(i+1,j+2)+(3/48)*e;     
               end 
            end
        else
            for j=col:-1:1
               if (f(i,j)>T)
                    b(i,j)=255;
               else
                    b(i,j)=0;
               end
               e=f(i,j)-b(i,j);
               if (j==2)
                   f(i,j-1)=f(i,j-1)+(7/48)*e;
               elseif (j==1)
               else
                   f(i,j-1)=f(i,j-1)+(7/48)*e;
                   f(i,j-2)=f(i,j-2)+(5/48)*e;
               end
            end
        end
    end
end
figure(3);
imshow(uint8(b));
title('Jarvis Error Diffusion');


%Stucki
b=zeros(row,col);
f=I;
for i=1:row    
    if(mod(i,2)~=0)
      if i~= (row-1)
       for j=1:col
           if (f(i,j)>T)
               b(i,j)=255;
           else
               b(i,j)=0;
           end
           e=f(i,j)-b(i,j);
           if j==1 
               f(i,j+1)=f(i,j+1)+(8/42)*e;
               f(i,j+2)=f(i,j+2)+(4/42)*e;
               f(i+1,j+1)=f(i+1,j+1)+(4/42)*e;
               f(i+1,j+2)=f(i+1,j+2)+(2/42)*e;
               f(i+2,j+1)=f(i+2,j+1)+(2/42)*e;
               f(i+2,j+2)=f(i+2,j+2)+(1/42)*e;
               f(i+1,j)=f(i+1,j)+(8/42)*e;
               f(i+2,j)=f(i+2,j)+(4/42)*e;
           elseif j==2
               f(i,j+1)=f(i,j+1)+(8/42)*e;
               f(i,j+2)=f(i,j+2)+(4/42)*e;
               f(i+1,j)=f(i+1,j)+(8/42)*e;
               f(i+2,j)=f(i+2,j)+(4/42)*e;
               f(i+1,j+1)=f(i+1,j+1)+(4/42)*e;
               f(i+1,j+2)=f(i+1,j+2)+(2/42)*e;
               f(i+2,j+1)=f(i+2,j+1)+(2/42)*e;
               f(i+2,j+2)=f(i+2,j+2)+(1/42)*e;
               f(i+1,j-1)=f(i+1,j-1)+(4/42)*e; 
               f(i+2,j-1)=f(i+2,j-1)+(2/42)*e;
           elseif j==col              
               f(i+1,j-1)=f(i+1,j-1)+(4/42)*e;
               f(i+1,j-2)=f(i+1,j-2)+(2/42)*e;
               f(i+2,j-1)=f(i+2,j-1)+(2/42)*e;
               f(i+2,j-2)=f(i+2,j-2)+(1/42)*e;
               f(i+1,j)=f(i+1,j)+(8/42)*e;
               f(i+2,j)=f(i+2,j)+(4/42)*e;
           elseif j==col-1
               f(i+1,j-1)=f(i+1,j-1)+(4/42)*e;
               f(i+1,j-2)=f(i+1,j-2)+(2/42)*e;
               f(i+2,j-1)=f(i+2,j-1)+(2/42)*e;
               f(i+2,j-2)=f(i+2,j-2)+(1/42)*e;
               f(i+1,j)=f(i+1,j)+(8/42)*e;
               f(i+2,j)=f(i+2,j)+(4/42)*e;
               f(i,j+1)=f(i,j+1)+(8/42)*e;
               f(i+1,j+1)=f(i+1,j+1)+(4/42)*e;
               f(i+2,j+1)=f(i+2,j+1)+(2/42)*e;             
           else 
               f(i,j+1)=f(i,j+1)+(8/42)*e;
               f(i,j+2)=f(i,j+2)+(4/42)*e;
               f(i+1,j)=f(i+1,j)+(8/42)*e;
               f(i+2,j)=f(i+2,j)+(4/42)*e;
               f(i+1,j+1)=f(i+1,j+1)+(4/42)*e;
               f(i+1,j+2)=f(i+1,j+2)+(2/42)*e;
               f(i+2,j+1)=f(i+2,j+1)+(2/42)*e;
               f(i+2,j+2)=f(i+2,j+2)+(1/42)*e;
               f(i+1,j-1)=f(i+1,j-1)+(4/42)*e;
               f(i+1,j-2)=f(i+1,j-2)+(2/42)*e;
               f(i+2,j-1)=f(i+2,j-1)+(2/42)*e;
               f(i+2,j-2)=f(i+2,j-2)+(1/42)*e;
           end 
       end
      else
          for j=col:-1:1
               if (f(i,j)>T)
                    b(i,j)=255;
               else
                    b(i,j)=0;
               end
               e=f(i,j)-b(i,j);
            if j==1 
               f(i,j+1)=f(i,j+1)+(8/42)*e;
               f(i,j+2)=f(i,j+2)+(4/42)*e;
               f(i+1,j)=f(i+1,j)+(8/42)*e;
               f(i+1,j+1)=f(i+1,j+1)+(4/42)*e;
               f(i+1,j+2)=f(i+1,j+2)+(2/42)*e;              
            elseif j==2
               f(i,j+1)=f(i,j+1)+(8/42)*e;
               f(i,j+2)=f(i,j+2)+(4/42)*e;
               f(i+1,j)=f(i+1,j)+(8/42)*e;
               f(i+1,j+1)=f(i+1,j+1)+(4/42)*e;
               f(i+1,j+2)=f(i+1,j+2)+(2/42)*e;
               f(i+1,j-1)=f(i+1,j-1)+(4/42)*e; 
           elseif j==col              
               f(i+1,j-1)=f(i+1,j-1)+(4/42)*e;
               f(i+1,j-2)=f(i+1,j-2)+(2/42)*e;
               f(i+1,j)=f(i+1,j)+(8/42)*e;
           elseif j==col-1
               f(i+1,j-1)=f(i+1,j-1)+(4/42)*e;
               f(i+1,j-2)=f(i+1,j-2)+(2/42)*e;
               f(i+1,j)=f(i+1,j)+(8/42)*e;
               f(i,j+1)=f(i,j+1)+(8/42)*e;
               f(i+1,j+1)=f(i+1,j+1)+(4/42)*e;           
           else 
               f(i,j+1)=f(i,j+1)+(8/42)*e;
               f(i,j+2)=f(i,j+2)+(4/42)*e;
               f(i+1,j)=f(i+1,j)+(8/42)*e;
               f(i+1,j+1)=f(i+1,j+1)+(4/42)*e;
               f(i+1,j+2)=f(i+1,j+2)+(2/42)*e;
               f(i+1,j-1)=f(i+1,j-1)+(4/42)*e;
               f(i+1,j-2)=f(i+1,j-2)+(2/42)*e;
            end 
          end
      end
      
    else
        if i~=row
            for j=col:-1:1
                if (f(i,j)>T)
                    b(i,j)=255;
                else
                    b(i,j)=0;
                end
                e=f(i,j)-b(i,j);
               if j==col
                   f(i,j-1)=f(i,j-1)+(8/42)*e;
                   f(i,j-2)=f(i,j-2)+(4/42)*e;
                   f(i+1,j)=f(i+1,j)+(8/42)*e;
                   f(i+2,j)=f(i+2,j)+(4/42)*e;
                   f(i+2,j-1)=f(i+2,j-1)+(2/42)*e;
                   f(i+2,j-2)=f(i+2,j-2)+(1/42)*e;
                   f(i+1,j-1)=f(i+1,j-1)+(4/42)*e;
                   f(i+1,j-2)=f(i+1,j-2)+(2/42)*e;
               elseif j==col-1
                   f(i+1,j)=f(i+1,j)+(8/42)*e;
                   f(i+2,j)=f(i+2,j)+(4/42)*e;
                   f(i,j-1)=f(i,j-1)+(8/42)*e;
                   f(i,j-2)=f(i,j-2)+(4/42)*e;
                   f(i+2,j-1)=f(i+2,j-1)+(2/42)*e;
                   f(i+2,j-2)=f(i+2,j-2)+(1/42)*e;
                   f(i+1,j-1)=f(i+1,j-1)+(4/42)*e;
                   f(i+1,j-2)=f(i+1,j-2)+(2/42)*e;
                   f(i+2,j+1)=f(i+2,j+1)+(2/42)*e;
                   f(i+1,j+1)=f(i+1,j+1)+(4/42)*e;      
               elseif j==1
                   f(i+1,j)=f(i+1,j)+(8/42)*e;
                   f(i+2,j)=f(i+2,j)+(4/42)*e;
                   f(i+2,j+1)=f(i+2,j+1)+(2/42)*e;
                   f(i+2,j+2)=f(i+2,j+2)+(1/42)*e;
                   f(i+1,j+1)=f(i+1,j+1)+(4/42)*e;
                   f(i+1,j+2)=f(i+1,j+2)+(2/42)*e;
               elseif j==2
                   f(i,j-1)=f(i,j-1)+(8/42)*e;
                   f(i+2,j-1)=f(i+2,j-1)+(2/42)*e;
                   f(i+1,j-1)=f(i+1,j-1)+(4/42)*e;
                   f(i+1,j)=f(i+1,j)+(8/42)*e;
                   f(i+2,j)=f(i+2,j)+(4/42)*e;
                   f(i+2,j+1)=f(i+2,j+1)+(2/42)*e;
                   f(i+2,j+2)=f(i+2,j+2)+(1/42)*e;
                   f(i+1,j+1)=f(i+1,j+1)+(4/42)*e;
                   f(i+1,j+2)=f(i+1,j+2)+(2/42)*e;                   
               else
                   f(i+1,j)=f(i+1,j)+(8/42)*e;
                   f(i+2,j)=f(i+2,j)+(4/42)*e;
                   f(i,j-1)=f(i,j-1)+(8/42)*e;
                   f(i,j-2)=f(i,j-2)+(4/42)*e;
                   f(i+2,j-1)=f(i+2,j-1)+(2/42)*e;
                   f(i+2,j-2)=f(i+2,j-2)+(1/42)*e;
                   f(i+1,j-1)=f(i+1,j-1)+(4/42)*e;
                   f(i+1,j-2)=f(i+1,j-2)+(2/42)*e;
                   f(i+2,j+1)=f(i+2,j+1)+(2/42)*e;
                   f(i+2,j+2)=f(i+2,j+2)+(1/42)*e;
                   f(i+1,j+1)=f(i+1,j+1)+(4/42)*e;
                   f(i+1,j+2)=f(i+1,j+2)+(2/42)*e;     
               end   
            end
        else
            for j=col:-1:1
               if (f(i,j)>T)
                    b(i,j)=255;
               else
                    b(i,j)=0;
               end
               e=f(i,j)-b(i,j);
               if (j==2)
                   f(i,j-1)=f(i,j-1)+(8/42)*e;
               elseif (j==1)
               else
                   f(i,j-1)=f(i,j-1)+(8/42)*e;
                   f(i,j-2)=f(i,j-2)+(4/42)*e;
               end
            end
        end
    end
end
figure(4);
imshow(uint8(b));
title('Stucki Error Diffusion');


% Sourabh Tirodkar
% 3589406164
% tirodkar@usc.edu
% Submission Date- 16th Feb,20
 
% PROBLEM 2C
% COLOR HALFTONING
% ROSE IMAGE
% MBVQ METHOD


I = imread('C:\Users\user\Desktop\USC Classes\Spring 2020\EE569- Digital Image Processing\Homeworks\HW #2\EE569_Spring_2020_HW2_Materials\Problem2\Rose.jpg');
figure(1)
imshow(uint8(I));
I = double(I);

R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);

v=zeros(480,640,3);
[row, col]=size(R);
fr=double(R);
fg=double(G);
fb=double(B);

for i=1:row    
    if(mod(i,2)~=0)
      if i~=row
       for j=1:col              
           [mbvq,v]=MBVQ(double(R(i,j)),double(G(i,j)),double(B(i,j)),fr(i,j),fg(i,j),fb(i,j));
            br(i,j)=v(1,1,1);
            bg(i,j)=v(1,1,2);
            bb(i,j)=v(1,1,3);
           er=fr(i,j)-br(i,j);
           eg=fg(i,j)-bg(i,j);
           eb=fb(i,j)-bb(i,j);
           if j==1 
               fr(i,j+1)=fr(i,j+1)+(7/16)*er;
               fr(i+1,j+1)=fr(i+1,j+1)+(1/16)*er;
               fr(i+1,j)=fr(i+1,j)+(5/16)*er;
               
               fg(i,j+1)=fg(i,j+1)+(7/16)*eg;
               fg(i+1,j+1)=fg(i+1,j+1)+(1/16)*eg;
               fg(i+1,j)=fg(i+1,j)+(5/16)*eg;
               
               fb(i,j+1)=fb(i,j+1)+(7/16)*eb;
               fb(i+1,j+1)=fb(i+1,j+1)+(1/16)*eb;
               fb(i+1,j)=fb(i+1,j)+(5/16)*eb; 
               
           elseif j==col              
               fr(i+1,j-1)=fr(i+1,j-1)+(3/16)*er;
               fr(i+1,j)=fr(i+1,j)+(5/16)*er;
               
               fg(i+1,j-1)=fg(i+1,j-1)+(3/16)*eg;
               fg(i+1,j)=fg(i+1,j)+(5/16)*eg;
               
               fb(i+1,j-1)=fb(i+1,j-1)+(3/16)*eb;
               fb(i+1,j)=fb(i+1,j)+(5/16)*eb;
           else 
               fr(i,j+1)=fr(i,j+1)+(7/16)*er;
               fr(i+1,j-1)=fr(i+1,j-1)+(3/16)*er;
               fr(i+1,j)=fr(i+1,j)+(5/16)*er;
               fr(i+1,j+1)=fr(i+1,j+1)+(1/16)*er;
               
               fg(i,j+1)=fg(i,j+1)+(7/16)*eg;
               fg(i+1,j-1)=fg(i+1,j-1)+(3/16)*eg;
               fg(i+1,j)=fg(i+1,j)+(5/16)*eg;
               fg(i+1,j+1)=fg(i+1,j+1)+(1/16)*eg;
               
               fb(i,j+1)=fb(i,j+1)+(7/16)*eb;
               fb(i+1,j-1)=fb(i+1,j-1)+(3/16)*eb;
               fb(i+1,j)=fb(i+1,j)+(5/16)*eb;
               fb(i+1,j+1)=fb(i+1,j+1)+(1/16)*eb;
           end 
       end
      else
         for j=1:col
           [mbvq,v]=MBVQ(double(R(i,j)),double(G(i,j)),double(B(i,j)),fr(i,j),fg(i,j),fb(i,j));
            br(i,j)=v(1,1,1);
            bg(i,j)=v(1,1,2);
            bb(i,j)=v(1,1,3);
           er=fr(i,j)-br(i,j);
           eg=fg(i,j)-bg(i,j);
           eb=fb(i,j)-bb(i,j);
               if j~=col
                   fr(i,j+1)=fr(i,j+1)+(7/16)*er;
                   fg(i,j+1)=fg(i,j+1)+(7/16)*eg;
                   fb(i,j+1)=fb(i,j+1)+(7/16)*eb;
               end     
         end
      end
    else
        if i~=row
            for j=col:-1:1
                  [mbvq,v]=MBVQ(double(R(i,j)),double(G(i,j)),double(B(i,j)),fr(i,j),fg(i,j),fb(i,j)); 
                   br(i,j)=v(1,1,1);
                   bg(i,j)=v(1,1,2);
                   bb(i,j)=v(1,1,3);
                   er=fr(i,j)-br(i,j);
                   eg=fg(i,j)-bg(i,j);
                   eb=fb(i,j)-bb(i,j);
               if j==col
                   fr(i,j-1)=fr(i,j-1)+(7/16)*er;
                   fr(i+1,j-1)=fr(i+1,j-1)+(1/16)*er;
                   fr(i+1,j)=fr(i+1,j)+(5/16)*er;
                   
                   fg(i,j-1)=fg(i,j-1)+(7/16)*eg;
                   fg(i+1,j-1)=fg(i+1,j-1)+(1/16)*eg;
                   fg(i+1,j)=fg(i+1,j)+(5/16)*eg;
                   
                   fb(i,j-1)=fb(i,j-1)+(7/16)*eb;
                   fb(i+1,j-1)=fb(i+1,j-1)+(1/16)*eb;
                   fb(i+1,j)=fb(i+1,j)+(5/16)*eb;
               elseif j==1
                   fr(i+1,j+1)=fr(i+1,j+1)+(3/16)*er;
                   fr(i+1,j)=fr(i+1,j)+(5/16)*er;
                   
                   fg(i+1,j+1)=fg(i+1,j+1)+(3/16)*eg;
                   fg(i+1,j)=fg(i+1,j)+(5/16)*eg;
                   
                   fb(i+1,j+1)=fb(i+1,j+1)+(3/16)*eb;
                   fb(i+1,j)=fb(i+1,j)+(5/16)*eb;
               else
                   fr(i,j-1)=fr(i,j-1)+(7/16)*er;
                   fr(i+1,j-1)=fr(i+1,j-1)+(1/16)*er;
                   fr(i+1,j)=fr(i+1,j)+(5/16)*er;
                   fr(i+1,j+1)=fr(i+1,j+1)+(3/16)*er;
                   
                   fg(i,j-1)=fg(i,j-1)+(7/16)*eg;
                   fg(i+1,j-1)=fg(i+1,j-1)+(1/16)*eg;
                   fg(i+1,j)=fg(i+1,j)+(5/16)*eg;
                   fg(i+1,j+1)=fg(i+1,j+1)+(3/16)*eg;
                   
                   fb(i,j-1)=fb(i,j-1)+(7/16)*eb;
                   fb(i+1,j-1)=fb(i+1,j-1)+(1/16)*eb;
                   fb(i+1,j)=fb(i+1,j)+(5/16)*eb;
                   fb(i+1,j+1)=fb(i+1,j+1)+(3/16)*eb;
               end  
            end
        else
            for j=col:-1:1
                [mbvq,v]=MBVQ(double(R(i,j)),double(G(i,j)),double(B(i,j)),fr(i,j),fg(i,j),fb(i,j));
                br(i,j)=v(1,1,1);
                bg(i,j)=v(1,1,2);
                bb(i,j)=v(1,1,3);
                er=fr(i,j)-br(i,j);
                eg=fg(i,j)-bg(i,j);
                eb=fb(i,j)-bb(i,j); 
               if j~=1
                   fr(i,j-1)=fr(i,j-1)+(7/16)*er;
                   fg(i,j-1)=fg(i,j-1)+(7/16)*eg;
                   fb(i,j-1)=fb(i,j-1)+(7/16)*eb;
               end  
            end
        end
    end
end

mbvq_rgb(:,:,1)=br;
figure(2);
imshow(uint8(mbvq_rgb(:,:,1)));
title('MBVQ - Red');

mbvq_rgb(:,:,2)=bg;
figure(3);
imshow(uint8(mbvq_rgb(:,:,2)));
title('MBVQ - Green');

mbvq_rgb(:,:,3)=bb;
figure(4);
imshow(uint8(mbvq_rgb(:,:,3)));
title('MBVQ - Blue');

figure(5);
imshow(uint8(mbvq_rgb));
title('MBVQ algorithm');

 
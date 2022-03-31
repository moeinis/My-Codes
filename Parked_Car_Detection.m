##########################################################################################################
###### This function is written in MATLAB and detect parked cars from moving cars      ###################
####### by calculating the car pixels distance to the center of the roads on satellite images ###########
########################################################################################################

function  classifiedroad3class=fasele_noghte_az_khat

% clc;
% clear all;
tt=classified_road;  %the same : tt=predict_lable_kol
[p, q]=find(tt==5);
p=p';
q=q';
start_end_points=dlmread('C:\Users\moein\Desktop\start-end-local-coordination of axe for line equation-car elimination.txt');
x=start_end_points(:,2);
y=start_end_points(:,3);
allpoint_to_certain_line=[];
alldistans_to_all_lines=[];
for j=1:size(start_end_points,1)/2
    for i=1:numel(p)
        
        landa=((x(2*j)-x(2*j-1))*(q(1,i)-x(2*j-1))+(y(2*j)-y(2*j-1))*(p(1,i)-y(2*j-1)))/((x(2*j)-x(2*j-1))^2+(y(2*j)-y(2*j-1))^2);
        distans=sqrt((q(1,i)-x(2*j-1)-landa*(x(2*j)-x(2*j-1)))^2+(p(1,i)-y(2*j-1)-landa*(y(2*j)-y(2*j-1)))^2);
        allpoint_to_certain_line=[allpoint_to_certain_line distans];
    end
    alldistans_to_all_lines=[alldistans_to_all_lines;allpoint_to_certain_line];
    allpoint_to_certain_line=[];
end

threshold=6;    % its in the pixel scale

 
s1=find(alldistans_to_all_lines(1,:)<threshold);
close_points_x = p(s1);
close_points_y = q(s1);
for i=1:size(close_points_x,2)
       tt(close_points_x(1,i),close_points_y(1,i))=1;
end
s2=find(alldistans_to_all_lines(2,:)<threshold);
close_points_x = p(s2);
close_points_y = q(s2);
for i=1:size(close_points_x,2)
       tt(close_points_x(1,i),close_points_y(1,i))=1;
end
s3=find(alldistans_to_all_lines(3,:)<threshold);
close_points_x = p(s3);
close_points_y = q(s3);
for i=1:size(close_points_x,2)
       tt(close_points_x(1,i),close_points_y(1,i))=1;
end
s4=find(alldistans_to_all_lines(4,:)<threshold);
close_points_x = p(s4);
close_points_y = q(s4);
for i=1:size(close_points_x,2)
       tt(close_points_x(1,i),close_points_y(1,i))=1;
end
s5=find(alldistans_to_all_lines(5,:)<threshold);
close_points_x = p(s5);
close_points_y = q(s5);
for i=1:size(close_points_x,2)
       tt(close_points_x(1,i),close_points_y(1,i))=1;
end
s6=find(alldistans_to_all_lines(6,:)<threshold);
close_points_x = p(s6);
close_points_y = q(s6);
for i=1:size(close_points_x,2)
       tt(close_points_x(1,i),close_points_y(1,i))=1;
end
s7=find(alldistans_to_all_lines(7,:)<threshold);
close_points_x = p(s7);
close_points_y = q(s7);
for i=1:size(close_points_x,2)
       tt(close_points_x(1,i),close_points_y(1,i))=1;
end
s8=find(alldistans_to_all_lines(8,:)<threshold);
close_points_x = p(s8);
close_points_y = q(s8);
for i=1:size(close_points_x,2)
       tt(close_points_x(1,i),close_points_y(1,i))=1;
end
s9=find(alldistans_to_all_lines(9,:)<threshold);
close_points_x = p(s9);
close_points_y = q(s9);
for i=1:size(close_points_x,2)
       tt(close_points_x(1,i),close_points_y(1,i))=1;
end
s10=find(alldistans_to_all_lines(10,:)<threshold);
close_points_x = p(s10);
close_points_y = q(s10);
for i=1:size(close_points_x,2)
       tt(close_points_x(1,i),close_points_y(1,i))=1;
end
s11=find(alldistans_to_all_lines(11,:)<threshold);
close_points_x = p(s11);
close_points_y = q(s11);
for i=1:size(close_points_x,2)
       tt(close_points_x(1,i),close_points_y(1,i))=1;
end
s12=find(alldistans_to_all_lines(12,:)<threshold);
close_points_x = p(s12);
close_points_y = q(s12);
for i=1:size(close_points_x,2)
       tt(close_points_x(1,i),close_points_y(1,i))=1;
end
s13=find(alldistans_to_all_lines(13,:)<threshold);
close_points_x = p(s13);
close_points_y = q(s13);
for i=1:size(close_points_x,2)
       tt(close_points_x(1,i),close_points_y(1,i))=1;
end
s14=find(alldistans_to_all_lines(14,:)<threshold);
close_points_x = p(s14);
close_points_y = q(s14);
for i=1:size(close_points_x,2)
       tt(close_points_x(1,i),close_points_y(1,i))=1;
end
s15=find(alldistans_to_all_lines(15,:)<threshold);
close_points_x = p(s15);
close_points_y = q(s15);
for i=1:size(close_points_x,2)
       tt(close_points_x(1,i),close_points_y(1,i))=1;
end
s16=find(alldistans_to_all_lines(16,:)<threshold);
close_points_x = p(s16);
close_points_y = q(s16);
for i=1:size(close_points_x,2)
       tt(close_points_x(1,i),close_points_y(1,i))=1;
end
s17=find(alldistans_to_all_lines(17,:)<threshold);
close_points_x = p(s17);
close_points_y = q(s17);
for i=1:size(close_points_x,2)
       tt(close_points_x(1,i),close_points_y(1,i))=1;
end
s18=find(alldistans_to_all_lines(18,:)<threshold);
close_points_x = p(s18);
close_points_y = q(s18);
for i=1:size(close_points_x,2)
       tt(close_points_x(1,i),close_points_y(1,i))=1;
end
s19=find(alldistans_to_all_lines(19,:)<threshold);
close_points_x = p(s19);
close_points_y = q(s19);
for i=1:size(close_points_x,2)
       tt(close_points_x(1,i),close_points_y(1,i))=1;
end
s20=find(alldistans_to_all_lines(20,:)<threshold);
close_points_x = p(s20);
close_points_y = q(s20);
for i=1:size(close_points_x,2)
       tt(close_points_x(1,i),close_points_y(1,i))=1;
end
s21=find(alldistans_to_all_lines(21,:)<threshold);
close_points_x = p(s21);
close_points_y = q(s21);
for i=1:size(close_points_x,2)
       tt(close_points_x(1,i),close_points_y(1,i))=1;
end
s22=find(alldistans_to_all_lines(22,:)<threshold);
close_points_x = p(s22);
close_points_y = q(s22);
for i=1:size(close_points_x,2)
       tt(close_points_x(1,i),close_points_y(1,i))=1;
end
s23=find(alldistans_to_all_lines(23,:)<threshold);
close_points_x = p(s23);
close_points_y = q(s23);
for i=1:size(close_points_x,2)
       tt(close_points_x(1,i),close_points_y(1,i))=1;
end
s24=find(alldistans_to_all_lines(24,:)<threshold);
close_points_x = p(s24);
close_points_y = q(s24);
for i=1:size(close_points_x,2)
       tt(close_points_x(1,i),close_points_y(1,i))=1;
end
s25=find(alldistans_to_all_lines(25,:)<threshold);
close_points_x = p(s25);
close_points_y = q(s25);
for i=1:size(close_points_x,2)
       tt(close_points_x(1,i),close_points_y(1,i))=1;
end
s26=find(alldistans_to_all_lines(26,:)<threshold);
close_points_x = p(s26);
close_points_y = q(s26);
for i=1:size(close_points_x,2)
       tt(close_points_x(1,i),close_points_y(1,i))=1;
end
s27=find(alldistans_to_all_lines(27,:)<threshold);
close_points_x = p(s27);
close_points_y = q(s27);
for i=1:size(close_points_x,2)
       tt(close_points_x(1,i),close_points_y(1,i))=1;
end
s28=find(alldistans_to_all_lines(28,:)<threshold);
close_points_x = p(s28);
close_points_y = q(s28);
for i=1:size(close_points_x,2)
       tt(close_points_x(1,i),close_points_y(1,i))=1;
end
s29=find(alldistans_to_all_lines(29,:)<threshold);
close_points_x = p(s29);
close_points_y = q(s29);
for i=1:size(close_points_x,2)
       tt(close_points_x(1,i),close_points_y(1,i))=1;
end
s30=find(alldistans_to_all_lines(30,:)<threshold);
close_points_x = p(s30);
close_points_y = q(s30);
for i=1:size(close_points_x,2)
       tt(close_points_x(1,i),close_points_y(1,i))=1;
end
s31=find(alldistans_to_all_lines(31,:)<threshold);
close_points_x = p(s31);
close_points_y = q(s31);
for i=1:size(close_points_x,2)
       tt(close_points_x(1,i),close_points_y(1,i))=1;
end
s32=find(alldistans_to_all_lines(32,:)<threshold);
close_points_x = p(s32);
close_points_y = q(s32);
for i=1:size(close_points_x,2)
       tt(close_points_x(1,i),close_points_y(1,i))=1;
end

tt(tt==5)=4;                                            %% convert the parked car to debris 
classifiedroad3class=tt;
% imagesc(tt);
end

clc;
clear all;
a=dlmread('C:\Users\moein\Desktop\my thises\point_offset_start_end.txt');
[p q]=size(a);
x_samp=a(:,2);
y_samp=a(:,3);
point_axe_arz=dlmread('C:\Users\moein\Desktop\my thises\point_axe_10metr_arz_az_mabdae.txt');
x_10m=point_axe_arz(:,3);
y_10m=point_axe_arz(:,2);
M=[];
m=zeros(1,p/2);
format short
% X=[];
% Y=[];
%% calculate all the roads's lines slope
for i=1:p/2
    A=y_samp(2*i)-y_samp(2*i-1);
    B=x_samp(2*i)-x_samp(2*i-1);
    m(i)=  A  /  B ;
    M=[M m(i)];
end
c=zeros(1026,1014);
%% road 1      % road distans=156.12     arz=8m(215)pix-ent-per-pol  ama   217pix-ent-per-pol     156\10=15.6    15.6*217=3385pix
% rond=3255
d=[];
u=[];
v=[];
s=[];
dist=77.69;
num_of_line=34;
kk=(-(M(2*num_of_line))^-1)*(0-x_samp(4*num_of_line-1))+y_samp(4*num_of_line-1);    %x_10m(indx)(=num of line)*2=M(indx)&M(indx)*2-1=x_samp(indx)
kg=(-(M(2*num_of_line))^-1)*(0-x_10m(num_of_line))+y_10m(num_of_line);        % m indix= 2* num of line
arz=abs(kg-kk);

couple_odd=133;
   for H=0:arz:arz*(dist/10-1)

   for x=632408.196:0.61:633033.45
        for y=3218606.037:-0.61:3217988.107

             if  (y-M(2*num_of_line)*(x-(x_samp(couple_odd)))-y_samp(couple_odd))<0      &     (y-M(2*num_of_line)*(x-(x_samp(couple_odd+2)))-y_samp(couple_odd+2))>0 ...             % -H-arz marboot be rah ro be bala & +H+arz ro be paein
             & ((y-(-(M(2*num_of_line)^-1))*(x-(x_samp(couple_odd)))-y_samp(couple_odd))-H)>0   &   ((y-(-(M(2*num_of_line)^-1))*(x-(x_samp(couple_odd)))-y_samp(couple_odd))-H-arz)<0  %indix dar 3 taye samte chap yeksan va adade fard 
                                                                                                                         %va khate akhar bala samte rast adadde farde baedi:1-3 5-7
           d=[d x];
           u=[u y];

           end
        end
   end

            numpix=269;
             if   numpix-numel(d)>0      %%217 az rooye halgheye avale for birooni hesab shod
                  d=[d d(1,end)*ones(1,numpix-numel(d))];
             elseif numpix-numel(d)<0
                 d(numpix+1:end)=[];
                  
             end
             if   numpix-numel(u)>0
                  u=[u u(1,end)*ones(1,numpix-numel(u))];
             elseif numpix-numel(u)<0
                 u(numpix+1:end)=[];
                  
             end
        
                            v=[v;d];
                            s=[s;u];
                            d=[];  
                             u=[];   
 end
 
   v=((v-632408.196)./0.61)+1;
   s=(-(s-3218606.037)./0.61)+1;
   v=round(v);
   s=round(s);
     %% obstacles show
    
   image=road33_img;
    vv=v(1,:);ss=s(1,:);segment=[ss;vv]; indix=zeros(1,numel(vv));

   anfisresults=road34;
   n=numel(indix);
   for iii=1:numel(anfisresults)
       vv=v(iii,:);ss=s(iii,:);segment=[ss;vv];segment=segment(:);
       if anfisresults(iii)==3
           for i=0:n-1
               image(segment(2*i+1),segment(2*i+2))=30;
           end
                  elseif  anfisresults(iii)==2
           for i=0:n-1
               image(segment(2*i+1),segment(2*i+2))=20;
           end
       else
           for i=0:n-1
               image(segment(2*i+1),segment(2*i+2))=5;
           end
       end
   end
   figure;
   imagesc(image);

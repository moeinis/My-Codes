##########################################################################################
############## This function divide the roads into 10 meter partitions and  ###############
############## count the number of pixels within each section and  #######################
############# pass it into the decision making algorithm (Neuro fuzzy model) ############
##########################################################################################


function anfisresults=road34
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
%    classified_road2=classified_road';
   classified_road2=fasele_noghte_az_khat';
   hich=[];
   pixof_eachclass_in_10m=[];
   pixof_eachclass_in_kol=[];
   for k=1:size(v,1)
   gh=v(k,:);
   hg=s(k,:);
     for j=1:5
        for i=1:numel(gh)
          flag=(classified_road2(gh(1,i),hg(1,i))==j);
          
          hich=[hich flag];
          javab=sum(hich);
  
        end
        hich=[];
          pixof_eachclass_in_10m=[pixof_eachclass_in_10m javab];
     end
     pixof_eachclass_in_kol=[pixof_eachclass_in_kol ; pixof_eachclass_in_10m];
     pixof_eachclass_in_10m=[];
   end
   pixof_eachclass_in_kol=(pixof_eachclass_in_kol./size(v,2));
      pixof_eachclass_in_kol(:,3)=[];
   pixof_eachclass_in_kol(:,4)=[];
   pixof_eachclass_in_kol=pixof_eachclass_in_kol(:,[1 3 2]);     %%input1=road    input2=debris   input3=shadow  ( according to fuzzy inf sys)
  
        %% fuzzy RESULTS 
  q=readfis('fis_new10');
  fisresults=evalfis(pixof_eachclass_in_kol,q)

    %% anfis RESULTS after training
    % bayad 'results_of_anfis' besiar be 'results' ke khorooji ya 'y' dade haye train hast nazdik bashad zira shabake ba eina amoozesh yafte
   
p=readfis('anfis0.4');
anfisresults=round(evalfis(pixof_eachclass_in_kol,p))

   
  %% in ANFIS case :aggregation of results for all segments in one road 
a=numel(find(anfisresults==3));
aa=numel(find(anfisresults==4));
a=a+aa
b=numel(find(anfisresults==2))
d=numel(find(anfisresults==1));
dd=numel(find(anfisresults==0));
d=d+dd
  if a>=2 
      disp('in anfis case: the road has became obstacle');          %final decision for a road in fuzzy case
%   elseif a<2 && (c/numel(results_of_anfis))>0.5
%       disp('in anfis case: the road is a low damaged road');
  elseif a<2 && (b/numel(anfisresults))>0.5
      disp('in anfis case: the road is a moderate damaged road');
  else
      disp('in anfis case:the road is an undamaged road');
  end
  
    %% in fuzzy case aggregation of results for all segments in one road 

  degre3=0;
  degre2=0;
  degre1=0;
for i=1:size(fisresults,1)     
    if 0.75<=fisresults(i)
        fisresults(i)=3;degre3=degre3+1;
    elseif fisresults(i)<0.75 &  0.3<=fisresults(i)
       fisresults(i)=2;degre2=degre2+1;
    elseif  fisresults(i)<0.3 &  0<=fisresults(i)
        fisresults(i)=1;degre1=degre1+1;
    end
end

  
  afis= degre3
  bfis= degre2
  dfis= degre1
  if afis>=2
      disp('in fuzzy case: the road has became obstacle');          %final decision for a road in fuzzy case

  elseif afis<2 && (bfis/numel(fisresults))>0.5
      disp('in fuzzy case: the road is a moderate damaged road');
  else
      disp('in fuzzy case: the road is an undamaged road');
  end
end

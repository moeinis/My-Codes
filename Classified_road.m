function predicted_label_kol=classified_road
%%  glcm & gabor generation
 %clc;
 %clear all;
ag=double(geotiffread('C:\Users\moein\Desktop\my thises\glcm & gabor\envi_glcm_x1y1_tiff.tif'));
mean=ag(:,:,[1 9 17 25]);mean=sum(mean,3)./4;               a7=double(mean);
var=ag(:,:,[2 10 18 26]);var=sum(var,3)./4;                 a8=double(var);
homogen=ag(:,:,[3 11 19 27]);homogen=sum(homogen,3)./4;     a9=double(homogen);
cont=ag(:,:,[4 12 20 28]);cont=sum(cont,3)./4;              a10=double(cont);
dissim=ag(:,:,[5 13 21 29]);dissim=sum(dissim,3)./4;        a11=double(dissim);
entr=ag(:,:,[6 14 22 30]);entr=sum(entr,3)./4;              a12=double(entr);
secmom=ag(:,:,[7 15 23 31]);secmom=sum(secmom,3)./4;        a13=double(secmom);
% cor=ag(:,:,[8 16 24 32]);cor=(sum(cor,3)./4);               a14=double(cor);

% gaabor
gaabor=load('C:\Users\moein\Desktop\my thises\image.mat');
g=double(gaabor.image);
gaabor_kol=cell(1,20);
for j=1:20
      gaabor_kol{j}=sum(g(:,:,[j j+20 j+40]),3)./3; 
      
end


a=geotiffread('C:\Users\moein\Desktop\my thises\ASL_glob_test_train_updat_road_mapup\road_aftrer_tif_glob_updat.tif');
a=double(a);
%  x=[1 0 1 1 1 1];
a5=double(geotiffread('C:\Users\moein\Desktop\my thises\ASL_glob_test_train_updat_road_mapup\ndvi_envi_road_mapup_tif\ndvi.tif'));
a6=double(shadow_ndvi_zaree);

a(:,:,5)=a5;
a(:,:,6)=a6;
  a(:,:,7)=a7;
 a(:,:,8)=a8;
a(:,:,9)=a9;
a(:,:,10)=a10;
a(:,:,11)=a11;
a(:,:,12)=a12;
a(:,:,13)=a13;
% a(:,:,14)=a14;
a(:,:,14)=gaabor_kol{1};
a(:,:,15)=gaabor_kol{2};
a(:,:,16)=gaabor_kol{3};
a(:,:,17)=gaabor_kol{4};
a(:,:,18)=gaabor_kol{5};
a(:,:,19)=gaabor_kol{6};
a(:,:,20)=gaabor_kol{7};
a(:,:,21)=gaabor_kol{8};
a(:,:,22)=gaabor_kol{9};
a(:,:,23)=gaabor_kol{10};
a(:,:,24)=gaabor_kol{11};
a(:,:,25)=gaabor_kol{12};
a(:,:,26)=gaabor_kol{13};
a(:,:,27)=gaabor_kol{14};
a(:,:,28)=gaabor_kol{15};
a(:,:,29)=gaabor_kol{16};
a(:,:,30)=gaabor_kol{17};
a(:,:,31)=gaabor_kol{18};
a(:,:,32)=gaabor_kol{19};
a(:,:,33)=gaabor_kol{20};
x=[1 0 1 0 1 1 0 0 0 0 0 0 1 1 0 0 1 0 1 1 0 0 0 1 1 0 0 1 0 1 0 0 0];
a(:,:,1)=x(1)*a(:,:,1);
a(:,:,2)=x(2)*a(:,:,2);
a(:,:,3)=x(3)*a(:,:,3);
a(:,:,4)=x(4)*a(:,:,4);
a(:,:,5)=x(5)*a(:,:,5);
a(:,:,6)=x(6)*a(:,:,6);
a(:,:,7)=x(7)*a(:,:,7);
a(:,:,8)=x(8)*a(:,:,8);
a(:,:,9)=x(9)*a(:,:,9);
a(:,:,10)=x(10)*a(:,:,10);
a(:,:,11)=x(11)*a(:,:,11);
a(:,:,12)=x(12)*a(:,:,12);
a(:,:,13)=x(13)*a(:,:,13);
a(:,:,14)=x(14)*a(:,:,14);
a(:,:,15)=x(15)*a(:,:,15);
a(:,:,16)=x(16)*a(:,:,16);
a(:,:,17)=x(17)*a(:,:,17);
a(:,:,18)=x(18)*a(:,:,18);
a(:,:,19)=x(19)*a(:,:,19);
a(:,:,20)=x(20)*a(:,:,20);
a(:,:,21)=x(21)*a(:,:,21);
a(:,:,22)=x(22)*a(:,:,22);
a(:,:,23)=x(23)*a(:,:,23);
a(:,:,24)=x(24)*a(:,:,24);
a(:,:,25)=x(25)*a(:,:,25);
a(:,:,26)=x(26)*a(:,:,26);
a(:,:,27)=x(27)*a(:,:,27);
a(:,:,28)=x(28)*a(:,:,28);
a(:,:,29)=x(29)*a(:,:,29);
a(:,:,30)=x(30)*a(:,:,30);
a(:,:,31)=x(31)*a(:,:,31);
a(:,:,32)=x(32)*a(:,:,32);
a(:,:,33)=x(33)*a(:,:,33);

train=dlmread('C:\Users\moein\Desktop\my thises\ASL_glob_test_train_updat_road_mapup\train.txt');
train=train(:);
train=double(train);
[p q l]=size(a);
t=p*q;
a=reshape(a,t,l);
kkk=[];
         for h=1:l
          if a(:,h)==zeros(t,1)
            kkk=[kkk h];
          end
         end
a(:,kkk)=[];
[pq l]=size(a);
maxx=[];
minn=[];
for t=1:l
     Max=max(a(:,t));
     Min=min(a(:,t));
     maxx=[maxx Max];
     minn=[minn Min];
end

    for j=1:l
         a(:,j)=(a(:,j)-minn(j))./maxx(j)-minn(j);
    end
a=reshape(a,p,q,l);

I=find(train==1);
J=find(train==2);
K=find(train==3);
L=find(train==4);
M=find(train==5);
% N=find(train==6);
training_vec=[];
for i=1:size(a,3) %%==l
            ai=a(:,:,i);
            sotoon=[ai(I);ai(J);ai(K);ai(L);ai(M)];
            training_vec=[training_vec sotoon];
end
Label_tr=[ones(size(ai(I)));2*ones(size(ai(J)));3*ones(size(ai(K)));4*ones(size(ai(L)));5*ones(size(ai(M)))];
% training_vec=reshape(training_vec,p*q,size(a,3));
model=svmtrain(Label_tr, training_vec,'-s 0 -t 1 -d 6 -r 1 -c 100');
%% TEST
test=dlmread('C:\Users\moein\Desktop\my thises\ASL_glob_test_train_updat_road_mapup\test.txt');
test=double(test);
% II=find(test==1);
% JJ=find(test==2);
% KK=find(test==3);
% LL=find(test==4);
% MM=find(test==5);
% testing_vec=[];
% for i=1:size(a,3)
%             ai=a(:,:,i);
%             sotoon=[ai(II);ai(JJ);ai(KK);ai(LL);ai(MM)];
%             testing_vec=[testing_vec sotoon];
% end
% Label_te=[ones(size(ai(II)));2*ones(size(ai(JJ)));3*ones(size(ai(KK)));4*ones(size(ai(LL)));5*ones(size(ai(MM)))];
% [predicted_label,accuracy,~]=svmpredict(Label_te, testing_vec, model);
Label_te_kol=ones(p*q,1);
testing_vec_kol=[];
for i=1:l
    b=a(:,:,i);
    b=b(:);
    testing_vec_kol=[testing_vec_kol b];
end
[predicted_label_kol,accuracy_kol,~]=svmpredict(Label_te_kol, testing_vec_kol, model);
predicted_label_kol=reshape(predicted_label_kol,p,q);
%% change detection executing
change_maptree=dlmread('C:\Users\moein\Desktop\my thises\ASL_glob_test_train_updat_road_mapup\change map(+(data 1)-(3) no chang(2)).txt');
predicted_label_kol(predicted_label_kol==3)=1;     %% all tree to road
test(test==3)=1;
predicted_label_kol(change_maptree==1)=4;          %% breaked tree to debris 
test(change_maptree==1)=4;
% predicted_label_kol(predicted_label_kol==5)=4;   %% all car to debris


test=test(:);
predicted_label=predicted_label_kol(:);
predicted_label(test==0)=[];
test(test==0)=[];
index=sum(test==predicted_label);
overal_acuracy=(index./(length(test))) %% numel

index1=numel(find(predicted_label(find(test==1)')==1)); 
road_class1_acuracy=index1/(length(test(test==1)))
index2=numel(find(predicted_label(find(test==2)')==2));
shadow_class2_acuracy=index2/(length(test(test==2)))
index3=numel(find(predicted_label(find(test==3)')==3));
tree_class3_acuracy=index3/(length(test(test==3)))
index4=numel(find(predicted_label(find(test==4)')==4));
debris_class4_acuracy=index4/(length(test(test==4)))
index5=numel(find(predicted_label(find(test==5)')==5));
car_class5_acuracy=index5/(length(test(test==5)))

%% kapa
pr=(numel(predicted_label(predicted_label==1))/length(test))*(length(test(test==1))/length(test))+...
    (numel(predicted_label(predicted_label==2))/length(test))*(length(test(test==2))/length(test))+...
    (numel(predicted_label(predicted_label==3))/length(test))*(length(test(test==3))/length(test))+...
    (numel(predicted_label(predicted_label==4))/length(test))*(length(test(test==4))/length(test))+...
    (numel(predicted_label(predicted_label==5))/length(test))*(length(test(test==5))/length(test));
kapa=(overal_acuracy-pr)/(1-pr)

end
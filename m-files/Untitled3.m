close all
clear all
clc

%reading and converting the image
inImage=double(imread('lena_gray.png'));
%get the information of the picture
getinfo=imfinfo('lena_gray.png');
%get the size of the picture
getsize=getinfo.FileSize;
[U,S,V]=svd(inImage);

for i=0:4

k=i*25+5;
for j=1:k
S(j,j)=0;
end;

Newimage=U*S*transpose(V);
H = uint8(Newimage);
%folder =' C:\Users\Ali\Desktop\project\Matlab'; 
imwrite(H,'New.png');
%get the information of the picture
getinfo2=imfinfo('New.png');
%get the size of the picture
getsize2=getinfo2.FileSize;
ratio=getsize2/getsize
figure('Name','Lenna');
imshow('New.png');
%get the info of ratio and k,put it in array to plot
X(i+1)=k;
Y(i+1)=ratio;

end;
figure (7)
plot(X,Y);
hold on 
stem(X,Y);
hold off ;


H = uint8(Newimage);
%folder =' C:\Users\Ali\Desktop\project\Matlab'; 
imwrite(H,'New.png');
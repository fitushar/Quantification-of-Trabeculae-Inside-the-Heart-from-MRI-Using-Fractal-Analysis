%% Quantification of Trabeculae Inside the Heart from MRI Using Fractal Analysis 

%% This code is written by-
                %Md. Kamrul Hasan, M1 MAIA
                %Md. Fakrul Islam Tushar, M1 MAIA
%%
clc
clear all
close all
%%

X= dicomread(dicominfo('Image1'));
figure
imshow(X,[]);
%% Binary Image Formations
X=uint8(X);
level = graythresh(X);
Binary_Image = im2bw(X,level);
%% Box Ploting for FD
figure
[n,r] = boxcount(Binary_Image,'slope');
df = -diff(log(n))./diff(log(r));
disp(['Fractal dimension, Df = ' num2str(mean(df(4:8))) ' +/- ' num2str(std(df(4:8)))]);
%% Probability P=0.8,
Countour = randcantor(0.8);
figure
boxcount(Countour)
%%                           END
%%================================================================================
%This functionto is to demonstrate image encryption using the reference in
%H. Wen et al., "Security analysis of a color image encryption based onbit-level and chaotic map", Multimedia Tools and Applications.
%All copyrights belong to all authors of this paper. 
%This code is managed and released by the author Yiting Lin.
%E-mail: donotwanttogrowup@outlook.com
%https://github.com/DoNotWantToGrowUp/Secure-Optical-Image-Communication-using-Double-Random-Transformation-and-Memristive-Chaos
%All following source code is free to distribute, to use, and to modify
% for research and study purposes, but absolutely NOT for commercial uses.
%If you use any of the following code in your academic publication(s),
% please cite the corresponding paper.
%If you have any questions, please email me and I will try to response you ASAP.
%It worthwhile to note that all following source code is written under MATLAB R2022b
% and that files may call built-in functions from specific toolbox(es).
%%================================================================================

%% Cryptanalysis Step 2
%Construct some special ordinary images
clear;clc;close all;
tic
%% Construct some special ordinary images, and the pixel value increases from 0
W=2;H=2;
% W=4;H=4;
% W=256;H=256;
% W=512;H=320;
% W=256;H=400;

len=W*8*H*3;
cp=zeros(1,len);
for i=1:len
    cp(i)=i-1;
end
%% Image pixel value is decomposed into corresponding binary matrix according to high and low order
cp1=bitand(cp,1);
cp2=bitand(cp,2)/2;
cp3=bitand(cp,2^2)/2^2;
cp4=bitand(cp,2^3)/2^3;
cp5=bitand(cp,2^4)/2^4;
cp6=bitand(cp,2^5)/2^5;
cp7=bitand(cp,2^6)/2^6;
% cp8=bitand(cp,2^7)/2^7;
% cp9=bitand(cp,2^8)/2^8;
% cp10=bitand(cp,2^9)/2^9;
% cp11=bitand(cp,2^10)/2^10;
% cp12=bitand(cp,2^11)/2^11;
% cp13=bitand(cp,2^12)/2^12;
% cp14=bitand(cp,2^13)/2^13;
% cp15=bitand(cp,2^14)/2^14;
% cp16=bitand(cp,2^15)/2^15;
% cp17=bitand(cp,2^16)/2^16;
% cp18=bitand(cp,2^17)/2^17;
% cp19=bitand(cp,2^18)/2^18;
% cp20=bitand(cp,2^19)/2^19;
% cp21=bitand(cp,2^20)/2^20;
% cp22=bitand(cp,2^21)/2^21;
%% Convert the one-dimensional matrix of Bitter level into a two-dimensional picture with the size of H * W * 3
CP1=Function_restore_bit(cp1,H,W);
CP2=Function_restore_bit(cp2,H,W);
CP3=Function_restore_bit(cp3,H,W);
CP4=Function_restore_bit(cp4,H,W);
CP5=Function_restore_bit(cp5,H,W);
CP6=Function_restore_bit(cp6,H,W);
CP7=Function_restore_bit(cp7,H,W);
% CP8=Function_restore_bit(cp8,H,W);
% CP9=Function_restore_bit(cp9,H,W);
% CP10=Function_restore_bit(cp10,H,W);
% CP11=Function_restore_bit(cp11,H,W);
% CP12=Function_restore_bit(cp12,H,W);
% CP13=Function_restore_bit(cp13,H,W);
% CP14=Function_restore_bit(cp14,H,W);
% CP15=Function_restore_bit(cp15,H,W);
% CP16=Function_restore_bit(cp16,H,W);
% CP17=Function_restore_bit(cp17,H,W);
% CP18=Function_restore_bit(cp18,H,W);
% CP19=Function_restore_bit(cp19,H,W);
% CP20=Function_restore_bit(cp20,H,W);
% CP21=Function_restore_bit(cp21,H,W);
% CP22=Function_restore_bit(cp22,H,W);

% cp_H_W=Function_restore_bit(cp,H,W);
% cp_H_W=uint8(cp_H_W);
toc
%% output:save and figure show
imwrite(uint8(CP1),'./images/gray_bit_CP1.bmp');  %注意，写入时要采用uint8类型，否则读取时出错
imwrite(uint8(CP2),'./images/gray_bit_CP2.bmp'); 
imwrite(uint8(CP3),'./images/gray_bit_CP3.bmp'); 
imwrite(uint8(CP4),'./images/gray_bit_CP4.bmp'); 
imwrite(uint8(CP5),'./images/gray_bit_CP5.bmp'); 
imwrite(uint8(CP6),'./images/gray_bit_CP6.bmp'); 
imwrite(uint8(CP7),'./images/gray_bit_CP7.bmp'); 
% imwrite(uint8(CP8),'./images/gray_bit_CP8.bmp'); 
% imwrite(uint8(CP9),'./images/gray_bit_CP9.bmp'); 
% imwrite(uint8(CP10),'./images/gray_bit_CP10.bmp'); 
% imwrite(uint8(CP11),'./images/gray_bit_CP11.bmp'); 
% imwrite(uint8(CP12),'./images/gray_bit_CP12.bmp'); 
% imwrite(uint8(CP13),'./images/gray_bit_CP13.bmp'); 
% imwrite(uint8(CP14),'./images/gray_bit_CP14.bmp'); 
% imwrite(uint8(CP15),'./images/gray_bit_CP15.bmp'); 
% imwrite(uint8(CP16),'./images/gray_bit_CP16.bmp'); 
% imwrite(uint8(CP17),'./images/gray_bit_CP17.bmp'); 
% imwrite(uint8(CP18),'./images/gray_bit_CP18.bmp'); 
% imwrite(uint8(CP19),'./images/gray_bit_CP19.bmp'); 
% imwrite(uint8(CP20),'./images/gray_bit_CP20.bmp'); 
% imwrite(uint8(CP21),'./images/gray_bit_CP21.bmp'); 
% imwrite(uint8(CP22),'./images/gray_bit_CP22.bmp'); 

figure(1);
subplot(5,9,1);imshow(uint8(CP1));title('1st chosen plain image');
subplot(5,9,3);imshow(uint8(CP2));title('2nd chosen plain image');
subplot(5,9,5);imshow(uint8(CP3));title('3rd chosen plain image');
subplot(5,9,7);imshow(uint8(CP4));title('4th chosen plain image');
subplot(5,9,9);imshow(uint8(CP5));title('5th chosen plain image');
subplot(5,9,11);imshow(uint8(CP6));title('6th chosen plain image');
subplot(5,9,13);imshow(uint8(CP7));title('7th chosen plain image');
% subplot(5,9,15);imshow(uint8(CP8));title('8th chosen plain image');
% subplot(5,9,17);imshow(uint8(CP9));title('9th chosen plain image');
% subplot(5,9,19);imshow(uint8(CP10));title('10th chosen plain image');
% subplot(5,9,21);imshow(uint8(CP11));title('11th chosen plain image');
% subplot(5,9,23);imshow(uint8(CP12));title('12th chosen plain image');
% subplot(5,9,25);imshow(uint8(CP13));title('13th chosen plain image');
% subplot(5,9,27);imshow(uint8(CP14));title('14th chosen plain image');
% subplot(5,9,29);imshow(uint8(CP15));title('15th chosen plain image');
% subplot(5,9,31);imshow(uint8(CP16));title('16th chosen plain image');
% subplot(5,9,33);imshow(uint8(CP17));title('17th chosen plain image');
% subplot(5,9,35);imshow(uint8(CP18));title('18th chosen plain image');
% subplot(5,9,37);imshow(uint8(CP19));title('19th chosen plain image');
% subplot(5,9,39);imshow(uint8(CP20));title('20th chosen plain image');
% subplot(5,9,41);imshow(uint8(CP21));title('21th chosen plain image');
% subplot(5,9,44);imshow(uint8(CP21));title('22th chosen plain image');
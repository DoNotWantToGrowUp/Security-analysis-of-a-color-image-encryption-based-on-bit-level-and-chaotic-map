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
%% Cryptanalysis Step 3
%Encrypting those special common images
clear;clc;close all;
tic
%% Importing special general images
CP1=imread('./images/gray_bit_CP1.bmp');
CP2=imread('./images/gray_bit_CP2.bmp');
CP3=imread('./images/gray_bit_CP3.bmp');
CP4=imread('./images/gray_bit_CP4.bmp');
CP5=imread('./images/gray_bit_CP5.bmp');
CP6=imread('./images/gray_bit_CP6.bmp');
CP7=imread('./images/gray_bit_CP7.bmp');
CP8=imread('./images/gray_bit_CP8.bmp');
CP9=imread('./images/gray_bit_CP9.bmp');
CP10=imread('./images/gray_bit_CP10.bmp');
CP11=imread('./images/gray_bit_CP11.bmp');
CP12=imread('./images/gray_bit_CP12.bmp');
CP13=imread('./images/gray_bit_CP13.bmp');
CP14=imread('./images/gray_bit_CP14.bmp');
CP15=imread('./images/gray_bit_CP15.bmp');
CP16=imread('./images/gray_bit_CP16.bmp');
CP17=imread('./images/gray_bit_CP17.bmp');
CP18=imread('./images/gray_bit_CP18.bmp');
CP19=imread('./images/gray_bit_CP19.bmp');
% CP20=imread('./images/gray_bit_CP20.bmp');
% CP21=imread('./images/gray_bit_CP21.bmp');
% CP22=imread('./images/gray_bit_CP22.bmp');
%% Encryption of special plain images
cipher_CP1=function_main_2018MTA_BIEICM_Encrpyt(CP1);
cipher_CP2=function_main_2018MTA_BIEICM_Encrpyt(CP2);
cipher_CP3=function_main_2018MTA_BIEICM_Encrpyt(CP3);
cipher_CP4=function_main_2018MTA_BIEICM_Encrpyt(CP4);
cipher_CP5=function_main_2018MTA_BIEICM_Encrpyt(CP5);
cipher_CP6=function_main_2018MTA_BIEICM_Encrpyt(CP6);
cipher_CP7=function_main_2018MTA_BIEICM_Encrpyt(CP7);
cipher_CP8=function_main_2018MTA_BIEICM_Encrpyt(CP8);
cipher_CP9=function_main_2018MTA_BIEICM_Encrpyt(CP9);
cipher_CP10=function_main_2018MTA_BIEICM_Encrpyt(CP10);
cipher_CP11=function_main_2018MTA_BIEICM_Encrpyt(CP11);
cipher_CP12=function_main_2018MTA_BIEICM_Encrpyt(CP12);
cipher_CP13=function_main_2018MTA_BIEICM_Encrpyt(CP13);
cipher_CP14=function_main_2018MTA_BIEICM_Encrpyt(CP14);
cipher_CP15=function_main_2018MTA_BIEICM_Encrpyt(CP15);
cipher_CP16=function_main_2018MTA_BIEICM_Encrpyt(CP16);
cipher_CP17=function_main_2018MTA_BIEICM_Encrpyt(CP17);
cipher_CP18=function_main_2018MTA_BIEICM_Encrpyt(CP18);
cipher_CP19=function_main_2018MTA_BIEICM_Encrpyt(CP19);
% cipher_CP20=function_main_2018MTA_BIEICM_Encrpyt(CP20);
% cipher_CP21=function_main_2018MTA_BIEICM_Encrpyt(CP21);
% cipher_CP22=function_main_2018MTA_BIEICM_Encrpyt(CP22);
toc
%% output:save and figure show
imwrite(uint8(cipher_CP1),'./images/gray_bit_cipher_CP1.bmp');  %注意，写入时要采用uint8类型，否则读取时出错
imwrite(uint8(cipher_CP2),'./images/gray_bit_cipher_CP2.bmp'); 
imwrite(uint8(cipher_CP3),'./images/gray_bit_cipher_CP3.bmp'); 
imwrite(uint8(cipher_CP4),'./images/gray_bit_cipher_CP4.bmp'); 
imwrite(uint8(cipher_CP5),'./images/gray_bit_cipher_CP5.bmp'); 
imwrite(uint8(cipher_CP6),'./images/gray_bit_cipher_CP6.bmp'); 
imwrite(uint8(cipher_CP7),'./images/gray_bit_cipher_CP7.bmp'); 
imwrite(uint8(cipher_CP8),'./images/gray_bit_cipher_CP8.bmp'); 
imwrite(uint8(cipher_CP9),'./images/gray_bit_cipher_CP9.bmp'); 
imwrite(uint8(cipher_CP10),'./images/gray_bit_cipher_CP10.bmp'); 
imwrite(uint8(cipher_CP11),'./images/gray_bit_cipher_CP11.bmp'); 
imwrite(uint8(cipher_CP12),'./images/gray_bit_cipher_CP12.bmp'); 
imwrite(uint8(cipher_CP13),'./images/gray_bit_cipher_CP13.bmp'); 
imwrite(uint8(cipher_CP14),'./images/gray_bit_cipher_CP14.bmp'); 
imwrite(uint8(cipher_CP15),'./images/gray_bit_cipher_CP15.bmp'); 
imwrite(uint8(cipher_CP16),'./images/gray_bit_cipher_CP16.bmp'); 
imwrite(uint8(cipher_CP17),'./images/gray_bit_cipher_CP17.bmp'); 
imwrite(uint8(cipher_CP18),'./images/gray_bit_cipher_CP18.bmp'); 
imwrite(uint8(cipher_CP19),'./images/gray_bit_cipher_CP19.bmp'); 
% imwrite(uint8(cipher_CP20),'./images/gray_bit_cipher_CP20.bmp'); 
% imwrite(uint8(cipher_CP21),'./images/gray_bit_cipher_CP21.bmp'); 
% imwrite(uint8(cipher_CP22),'./images/gray_bit_cipher_CP22.bmp'); 

figure(1);
subplot(5,9,1);imshow(uint8(cipher_CP1));title('1st CP-cipher image');
subplot(5,9,3);imshow(uint8(cipher_CP2));title('2nd CP-cipher image');
subplot(5,9,5);imshow(uint8(cipher_CP3));title('3rd CP-cipher image');
subplot(5,9,7);imshow(uint8(cipher_CP4));title('4th CP-cipher image');
subplot(5,9,9);imshow(uint8(cipher_CP5));title('5th CP-cipher image');
subplot(5,9,11);imshow(uint8(cipher_CP6));title('6th CP-cipher image');
subplot(5,9,13);imshow(uint8(cipher_CP7));title('7th CP-cipher image');
subplot(5,9,15);imshow(uint8(cipher_CP8));title('8th CP-cipher image');
subplot(5,9,17);imshow(uint8(cipher_CP9));title('9th CP-cipher image');
subplot(5,9,19);imshow(uint8(cipher_CP10));title('10th CP-cipher image');
subplot(5,9,21);imshow(uint8(cipher_CP11));title('11th CP-cipher image');
subplot(5,9,23);imshow(uint8(cipher_CP12));title('12th CP-cipher image');
subplot(5,9,25);imshow(uint8(cipher_CP13));title('13th CP-cipher image');
subplot(5,9,27);imshow(uint8(cipher_CP14));title('14th CP-cipher image');
subplot(5,9,29);imshow(uint8(cipher_CP15));title('15th CP-cipher image');
subplot(5,9,31);imshow(uint8(cipher_CP16));title('16th CP-cipher image');
subplot(5,9,33);imshow(uint8(cipher_CP17));title('17th CP-cipher image');
subplot(5,9,35);imshow(uint8(cipher_CP18));title('18th CP-cipher image');
subplot(5,9,37);imshow(uint8(cipher_CP19));title('19th CP-cipher image');
% subplot(5,9,39);imshow(uint8(cipher_CP20));title('20th CP-cipher image');
% subplot(5,9,41);imshow(uint8(cipher_CP21));title('21th CP-cipher image');
% subplot(5,9,44);imshow(uint8(cipher_CP22));title('22th CP-cipher image');
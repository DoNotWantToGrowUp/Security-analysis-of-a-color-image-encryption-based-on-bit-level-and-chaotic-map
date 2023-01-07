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

%% Cryptanalysis Step 4
% Restore images
%% Import the cipher text corresponding to the special common image, and the diffusion matrix
clc;clear;close all;
tic
load get_C.mat;

cipher_CP1=imread('./images/gray_bit_cipher_CP1.bmp');
cipher_CP2=imread('./images/gray_bit_cipher_CP2.bmp');
cipher_CP3=imread('./images/gray_bit_cipher_CP3.bmp');
cipher_CP4=imread('./images/gray_bit_cipher_CP4.bmp');
cipher_CP5=imread('./images/gray_bit_cipher_CP5.bmp');
cipher_CP6=imread('./images/gray_bit_cipher_CP6.bmp');
cipher_CP7=imread('./images/gray_bit_cipher_CP7.bmp');
% cipher_CP8=imread('./images/gray_bit_cipher_CP8.bmp');
% cipher_CP9=imread('./images/gray_bit_cipher_CP9.bmp');
% cipher_CP10=imread('./images/gray_bit_cipher_CP10.bmp');
% cipher_CP11=imread('./images/gray_bit_cipher_CP11.bmp');
% cipher_CP12=imread('./images/gray_bit_cipher_CP12.bmp');
% cipher_CP13=imread('./images/gray_bit_cipher_CP13.bmp');
% cipher_CP14=imread('./images/gray_bit_cipher_CP14.bmp');
% cipher_CP15=imread('./images/gray_bit_cipher_CP15.bmp');
% cipher_CP16=imread('./images/gray_bit_cipher_CP16.bmp');
% cipher_CP17=imread('./images/gray_bit_cipher_CP17.bmp');
% cipher_CP18=imread('./images/gray_bit_cipher_CP18.bmp');
% cipher_CP19=imread('./images/gray_bit_cipher_CP19.bmp');
% cipher_CP20=imread('./images/gray_bit_cipher_CP20.bmp');
% cipher_CP21=imread('./images/gray_bit_cipher_CP21.bmp');
% cipher_CP22=imread('./images/gray_bit_cipher_CP22.bmp');
%% Bit-plane decomposition of the ciphertext image to generate a one-dimensional matrix
bit_C_q1=Function_bitplane(cipher_CP1);
bit_C_q2=Function_bitplane(cipher_CP2);
bit_C_q3=Function_bitplane(cipher_CP3);
bit_C_q4=Function_bitplane(cipher_CP4);
bit_C_q5=Function_bitplane(cipher_CP5);
bit_C_q6=Function_bitplane(cipher_CP6);
bit_C_q7=Function_bitplane(cipher_CP7);
% bit_C_q8=Function_bitplane(cipher_CP8);
% bit_C_q9=Function_bitplane(cipher_CP9);
% bit_C_q10=Function_bitplane(cipher_CP10);
% bit_C_q11=Function_bitplane(cipher_CP11);
% bit_C_q12=Function_bitplane(cipher_CP12);
% bit_C_q13=Function_bitplane(cipher_CP13);
% bit_C_q14=Function_bitplane(cipher_CP14);
% bit_C_q15=Function_bitplane(cipher_CP15);
% bit_C_q16=Function_bitplane(cipher_CP16);
% bit_C_q17=Function_bitplane(cipher_CP17);
% bit_C_q18=Function_bitplane(cipher_CP18);
% bit_C_q19=Function_bitplane(cipher_CP19);
% bit_C_q20=Function_bitplane(cipher_CP20);
% bit_C_q21=Function_bitplane(cipher_CP21);
% bit_C_q22=Function_bitplane(cipher_CP22);




%Get the permutation matrix of several images
bit_P_q1=bitxor(get_C,bit_C_q1);
bit_P_q2=bitxor(get_C,bit_C_q2);
bit_P_q3=bitxor(get_C,bit_C_q3);
bit_P_q4=bitxor(get_C,bit_C_q4);
bit_P_q5=bitxor(get_C,bit_C_q5);
bit_P_q6=bitxor(get_C,bit_C_q6);
bit_P_q7=bitxor(get_C,bit_C_q7);
% bit_P_q8=bitxor(get_C,bit_C_q8);
% bit_P_q9=bitxor(get_C,bit_C_q9);
% bit_P_q10=bitxor(get_C,bit_C_q10);
% bit_P_q11=bitxor(get_C,bit_C_q11);
% bit_P_q12=bitxor(get_C,bit_C_q12);
% bit_P_q13=bitxor(get_C,bit_C_q13);
% bit_P_q14=bitxor(get_C,bit_C_q14);
% bit_P_q15=bitxor(get_C,bit_C_q15);
% bit_P_q16=bitxor(get_C,bit_C_q16);
% bit_P_q17=bitxor(get_C,bit_C_q17);
% bit_P_q18=bitxor(get_C,bit_C_q18);
% bit_P_q19=bitxor(get_C,bit_C_q19);
% bit_P_q20=bitxor(get_C,bit_C_q20);
% bit_P_q21=bitxor(get_C,bit_C_q21);
% bit_P_q22=bitxor(get_C,bit_C_q22);


bit_P_q1=double(bit_P_q1);
bit_P_q2=double(bit_P_q2);
bit_P_q3=double(bit_P_q3);
bit_P_q4=double(bit_P_q4);
bit_P_q5=double(bit_P_q5);
bit_P_q6=double(bit_P_q6);
bit_P_q7=double(bit_P_q7);
% bit_P_q8=double(bit_P_q8);
% bit_P_q9=double(bit_P_q9);
% bit_P_q10=double(bit_P_q10);
% bit_P_q11=double(bit_P_q11);
% bit_P_q12=double(bit_P_q12);
% bit_P_q13=double(bit_P_q13);
% bit_P_q14=double(bit_P_q14);
% bit_P_q15=double(bit_P_q15);
% bit_P_q16=double(bit_P_q16);
% bit_P_q17=double(bit_P_q17);
% bit_P_q18=double(bit_P_q18);
% bit_P_q19=double(bit_P_q19);
% bit_P_q20=double(bit_P_q20);
% bit_P_q21=double(bit_P_q21);
% bit_P_q22=double(bit_P_q22);
%% 得到置换密钥
%size 2*2*3
bit_q=bit_P_q1+bit_P_q2*2+bit_P_q3*2^2+bit_P_q4*2^3+bit_P_q5*2^4+bit_P_q6*2^5+bit_P_q7*2^6;
%size 4*4*3
% bit_q=bit_P_q1+bit_P_q2*2+bit_P_q3*2^2+bit_P_q4*2^3+bit_P_q5*2^4+bit_P_q6*2^5+bit_P_q7*2^6+bit_P_q8*2^7+bit_P_q9*2^8;
%size 256*256*3
% bit_q=bit_P_q1+bit_P_q2*2+bit_P_q3*2^2+bit_P_q4*2^3+bit_P_q5*2^4+bit_P_q6*2^5+bit_P_q7*2^6+bit_P_q8*2^7+bit_P_q9*2^8+bit_P_q10*2^9+bit_P_q11*2^10 ...
%     +bit_P_q12*2^11+bit_P_q13*2^12+bit_P_q14*2^13+bit_P_q15*2^14+bit_P_q16*2^15+bit_P_q17*2^16+bit_P_q18*2^17+bit_P_q19*2^18+bit_P_q20*2^19+bit_P_q21*2^20;
%size 512*320*3
% bit_q=bit_P_q1+bit_P_q2*2+bit_P_q3*2^2+bit_P_q4*2^3+bit_P_q5*2^4+bit_P_q6*2^5+bit_P_q7*2^6+bit_P_q8*2^7+bit_P_q9*2^8+bit_P_q10*2^9+bit_P_q11*2^10 ...
%     +bit_P_q12*2^11+bit_P_q13*2^12+bit_P_q14*2^13+bit_P_q15*2^14+bit_P_q16*2^15+bit_P_q17*2^16+bit_P_q18*2^17+bit_P_q19*2^18+bit_P_q20*2^19+bit_P_q21*2^20+bit_P_q22*2^21;

len=size(bit_P_q1,2);
for i=1:len
    T(i)=bit_q(i)+1;    
end
toc
%% Importing the image to be replaced
tic
B=imread('./images/size2.bmp'); 
% B=imread('./images/size4.bmp'); 
% B=imread('./images/size256.bmp'); 
% B=imread('./images/size512_320.jpg'); 
% B=imread('./images/size400_256.jpg'); 

B=double(B);
[H,W0]=size(B);W=W0/3;
B_C=function_main_2018MTA_BIEICM_Encrpyt(B);
B_C_bit=Function_bitplane(B_C);
B_P_bit=bitxor(get_C,B_C_bit);
B_P=Function_restore_bit(B_P_bit,H,W);


Q_Lena_P=B_P;
Q_Lena_P=double(Q_Lena_P);
[H,W0]=size(Q_Lena_P);W=W0/3;len=H*W*24;
Q_Lena_P_bit=Function_bitplane(Q_Lena_P);

for i=1:len
    Q_Lena_bit(T(i))=Q_Lena_P_bit(i);    
end

Q_Lena=Function_restore_bit( Q_Lena_bit,H,W);
toc
%% Get the substitution image
replace_CP1=Function_restore_bit( bit_P_q1,H,W );
replace_CP2=Function_restore_bit( bit_P_q2,H,W );
replace_CP3=Function_restore_bit( bit_P_q3,H,W );
replace_CP4=Function_restore_bit( bit_P_q4,H,W );
replace_CP5=Function_restore_bit( bit_P_q5,H,W );
replace_CP6=Function_restore_bit( bit_P_q6,H,W );
replace_CP7=Function_restore_bit( bit_P_q7,H,W );
% replace_CP8=Function_restore_bit( bit_P_q8,H,W );
% replace_CP9=Function_restore_bit( bit_P_q9,H,W );
% replace_CP10=Function_restore_bit( bit_P_q10,H,W );
% replace_CP11=Function_restore_bit( bit_P_q11,H,W );
% replace_CP12=Function_restore_bit( bit_P_q12,H,W );
% replace_CP13=Function_restore_bit( bit_P_q13,H,W );
% replace_CP14=Function_restore_bit( bit_P_q14,H,W );
% replace_CP15=Function_restore_bit( bit_P_q15,H,W );
% replace_CP16=Function_restore_bit( bit_P_q16,H,W );
% replace_CP17=Function_restore_bit( bit_P_q17,H,W );
% replace_CP18=Function_restore_bit( bit_P_q18,H,W );
% replace_CP19=Function_restore_bit( bit_P_q19,H,W );
% replace_CP20=Function_restore_bit( bit_P_q20,H,W );
% replace_CP21=Function_restore_bit( bit_P_q21,H,W );
% replace_CP22=Function_restore_bit( bit_P_q22,H,W );

% imwrite(uint8(replace_CP1),'./images/size2_bit_replace_CP1.png');  %注意，写入时要采用uint8类型，否则读取时出错
% imwrite(uint8(replace_CP2),'./images/size2_bit_replace_CP2.png');
% imwrite(uint8(replace_CP3),'./images/size2_bit_replace_CP3.png');
% imwrite(uint8(replace_CP4),'./images/size2_bit_replace_CP4.png');
% imwrite(uint8(replace_CP5),'./images/size2_bit_replace_CP5.png');
% imwrite(uint8(replace_CP6),'./images/size2_bit_replace_CP6.png');
% imwrite(uint8(replace_CP7),'./images/size2_bit_replace_CP7.png');
% imwrite(uint8(replace_CP8),'./images/size2_bit_replace_CP8.png');
% imwrite(uint8(replace_CP9),'./images/size2_bit_replace_CP9.png');
% imwrite(uint8(replace_CP10),'./images/size2_bit_replace_CP10.png');
% imwrite(uint8(replace_CP11),'./images/size2_bit_replace_CP11.png');
% imwrite(uint8(replace_CP12),'./images/size2_bit_replace_CP12.png');
% imwrite(uint8(replace_CP13),'./images/size2_bit_replace_CP13.png');
% imwrite(uint8(replace_CP14),'./images/size2_bit_replace_CP14.png');
% imwrite(uint8(replace_CP15),'./images/size2_bit_replace_CP15.png');
% imwrite(uint8(replace_CP16),'./images/size2_bit_replace_CP16.png');
% imwrite(uint8(replace_CP17),'./images/size2_bit_replace_CP17.png');
% imwrite(uint8(replace_CP18),'./images/size2_bit_replace_CP18.png');
% imwrite(uint8(replace_CP19),'./images/size2_bit_replace_CP19.png');
% imwrite(uint8(replace_CP20),'./images/size2_bit_replace_CP20.png');
% imwrite(uint8(replace_CP21),'./images/size2_bit_replace_CP21.png');
%% output
% imwrite(uint8(B_C),'./images/size2_C.png');  
% imwrite(uint8(B_P),'./images/size2_P.png'); 
% imwrite(uint8(B_C),'./images/size4_C.bmp');  
% imwrite(uint8(B_P),'./images/size4_P.bmp'); 
% imwrite(uint8(B_C),'./images/size256_C.png');  
% imwrite(uint8(B_P),'./images/size256_P.png'); 
 
figure(1)
subplot(3,1,1);imshow(uint8(Q_Lena));title('Recover image');
subplot(3,1,2);imshow(uint8(B_C));title('Cipher image');
subplot(3,1,3);imshow(uint8(B_P));title('Replace image');

figure(2)
subplot(5,9,1);imshow(uint8(replace_CP1));title('1st Replace image');
subplot(5,9,3);imshow(uint8(replace_CP2));title('2nd Replace image');
subplot(5,9,5);imshow(uint8(replace_CP3));title('3rd Replace image');
subplot(5,9,7);imshow(uint8(replace_CP4));title('4th Replace image');
subplot(5,9,9);imshow(uint8(replace_CP5));title('5th Replace image');
subplot(5,9,11);imshow(uint8(replace_CP6));title('6th Replace image');
subplot(5,9,13);imshow(uint8(replace_CP7));title('7th Replace image');
% subplot(5,9,15);imshow(uint8(replace_CP8));title('8th Replace image');
% subplot(5,9,17);imshow(uint8(replace_CP9));title('9th Replace image');
% subplot(5,9,19);imshow(uint8(replace_CP10));title('10th Replace image');
% subplot(5,9,21);imshow(uint8(replace_CP11));title('11th Replace image');
% subplot(5,9,23);imshow(uint8(replace_CP12));title('12th Replace image');
% subplot(5,9,25);imshow(uint8(replace_CP13));title('13th Replace image');
% subplot(5,9,27);imshow(uint8(replace_CP14));title('14th Replace image');
% subplot(5,9,29);imshow(uint8(replace_CP15));title('15th Replace image');
% subplot(5,9,31);imshow(uint8(replace_CP16));title('16th Replace image');
% subplot(5,9,33);imshow(uint8(replace_CP17));title('17th Replace image');
% subplot(5,9,35);imshow(uint8(replace_CP18));title('18th Replace image');
% subplot(5,9,37);imshow(uint8(replace_CP19));title('19th Replace image');
% subplot(5,9,39);imshow(uint8(replace_CP20));title('20th Replace image');
% subplot(5,9,41);imshow(uint8(replace_CP21));title('21th Replace image');
% subplot(5,9,44);imshow(uint8(replace_CP22));title('22th Replace image');
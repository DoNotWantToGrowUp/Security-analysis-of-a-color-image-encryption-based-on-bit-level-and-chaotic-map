% Programe description£º2018-MTA-Korean-BIE-ICM encryption
% 2018-MTA-Korean-A novel bit-level color image encryption using improved 1D chaotic map
% Encryption: B -> Q -> D -> C
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

clear;clc;close all;
tic
%% step1 read RGB image and conversion
% B=imread('./images/size512_320.jpg'); 
B=imread('./images/size400_256.jpg');

% with size H*W*3£¬where W=W0/3;
B=double(B);[H,W0] = size(B);W=W0/3;
BR = B(:,:,1);BG = B(:,:,2);BB = B(:,:,3);
B_H_3W(:,1:W)=BR;B_H_3W(:,W+1:2*W)=BG;B_H_3W(:,2*W+1:3*W)=BB; %RGB size -> grayscale size H*3W

% bit-plane decomposition
bitPI=zeros(H,3*W,8); 
for i=1:8
    bitPI(:,:,i)=bitget(B_H_3W,i); 
end
B1=bitPI(:,:,1);B2=bitPI(:,:,2);B3=bitPI(:,:,3);B4=bitPI(:,:,4);
B5=bitPI(:,:,5);B6=bitPI(:,:,6);B7=bitPI(:,:,7);B8=bitPI(:,:,8);

B_H_24W(:,1:3*W)=B1;B_H_24W(:,3*W+1:6*W)=B2;B_H_24W(:,6*W+1:9*W)=B3;B_H_24W(:,9*W+1:12*W)=B4;
B_H_24W(:,12*W+1:15*W)=B5;B_H_24W(:,15*W+1:18*W)=B6;B_H_24W(:,18*W+1:21*W)=B7;B_H_24W(:,21*W+1:24*W)=B8;

%% step2 convert to 1D image bit matrix B
bit_B=B_H_24W';
seq_B=reshape(B_H_24W',1,H*24*W);

%% step3-5 bit-level permutation
% PRNS by Logistic
x1=0.44;u1=1.99;N0=1000;len=H*24*W;
real_X=Func_Logistic(x1,u1,N0,len);
[sY,idx_X] = sort(real_X);
seq_Q=seq_B;
for i=1:len
    seq_Q(i)=seq_B(idx_X(i));
end
Q_24W_H=reshape(seq_Q,24*W,H);
Q_H_24W=Q_24W_H';
% bit-plane composition
Q1=Q_H_24W(:,1:3*W);Q2=Q_H_24W(:,3*W+1:6*W);Q3=Q_H_24W(:,6*W+1:9*W);Q4=Q_H_24W(:,9*W+1:12*W);
Q5=Q_H_24W(:,12*W+1:15*W);Q6=Q_H_24W(:,15*W+1:18*W);Q7=Q_H_24W(:,18*W+1:21*W);Q8=Q_H_24W(:,21*W+1:24*W);

Q_H_3W=Q1+Q2*2+Q3*2^2+Q4*2^3+Q5*2^4+Q6*2^5+Q7*2^6+Q8*2^7;
QR=Q_H_3W(:,1:W);QG=Q_H_3W(:,W+1:2*W);QB=Q_H_3W(:,2*W+1:3*W);
Q(:,:,1)=QR;Q(:,:,2)=QG;Q(:,:,3)=QB;

%% step6-7 bitwise XOR diffusion
kd=654321;mask_D=floor(mod(real_X*kd,2));
seq_D=bitxor(mask_D,seq_Q);
D_24W_H=reshape(seq_D,24*W,H);
D_H_24W=D_24W_H';
% bit-plane composition
D1=D_H_24W(:,1:3*W);D2=D_H_24W(:,3*W+1:6*W);D3=D_H_24W(:,6*W+1:9*W);D4=D_H_24W(:,9*W+1:12*W);
D5=D_H_24W(:,12*W+1:15*W);D6=D_H_24W(:,15*W+1:18*W);D7=D_H_24W(:,18*W+1:21*W);D8=D_H_24W(:,21*W+1:24*W);

D_H_3W=D1+D2*2+D3*2^2+D4*2^3+D5*2^4+D6*2^5+D7*2^6+D8*2^7;
DR=D_H_3W(:,1:W);DG=D_H_3W(:,W+1:2*W);DB=D_H_3W(:,2*W+1:3*W);
D(:,:,1)=DR;D(:,:,2)=DG;D(:,:,3)=DB;

%% step8 bit-level circle right shift 
rp=1000;
seq_C=circshift(seq_D,[0,rp]);
% b = circshift(a,[0,1]) 

%% step9 convert C1 to 2D RGB image with size H*W
% seq_C=seq_Q;
C_24W_H=reshape(seq_C,24*W,H);
C_H_24W=C_24W_H';
% bit-plane composition
C1=C_H_24W(:,1:3*W);C2=C_H_24W(:,3*W+1:6*W);C3=C_H_24W(:,6*W+1:9*W);C4=C_H_24W(:,9*W+1:12*W);
C5=C_H_24W(:,12*W+1:15*W);C6=C_H_24W(:,15*W+1:18*W);C7=C_H_24W(:,18*W+1:21*W);C8=C_H_24W(:,21*W+1:24*W);

C_H_3W=C1+C2*2+C3*2^2+C4*2^3+C5*2^4+C6*2^5+C7*2^6+C8*2^7;
CR=C_H_3W(:,1:W);CG=C_H_3W(:,W+1:2*W);CB=C_H_3W(:,2*W+1:3*W);
C(:,:,1)=CR;C(:,:,2)=CG;C(:,:,3)=CB;
toc
%% output: show and save
% imwrite(uint8(C),'./images/size512_320_C.png');
% imwrite(uint8(C),'./images/size256_400_C.png');


figure(1);
B=uint8(B);BR=uint8(BR);BG=uint8(BG);BB=uint8(BB);
Q=uint8(Q);QR=uint8(QR);QG=uint8(QG);QB=uint8(QB);
D=uint8(D);DR=uint8(DR);DG=uint8(DG);DB=uint8(DB);
C=uint8(C);CR=uint8(CR);CG=uint8(CG);CB=uint8(CB);

subplot(4,7,1);imshow(B);title('RGB plain-image');
subplot(4,7,2);imshow(BR);title('R');subplot(4,7,3);imhist(BR);title('R');
subplot(4,7,4);imshow(BG);title('G');subplot(4,7,5);imhist(BG);title('G');
subplot(4,7,6);imshow(BB);title('B');subplot(4,7,7);imhist(BB);title('B');

subplot(4,7,8);imshow(Q);title('RGB permuted-image');
subplot(4,7,9); imshow(Q(:,:,1));title('R');subplot(4,7,10);imhist(Q(:,:,1));title('R');
subplot(4,7,11);imshow(Q(:,:,2));title('G');subplot(4,7,12);imhist(Q(:,:,2));title('G');
subplot(4,7,13);imshow(Q(:,:,3));title('B');subplot(4,7,14);imhist(Q(:,:,3));title('B');

subplot(4,7,15);imshow(D);title('RGB diffused-image');
subplot(4,7,16);imshow(D(:,:,1));title('R');subplot(4,7,17);imhist(D(:,:,1));title('R');
subplot(4,7,18);imshow(D(:,:,2));title('G');subplot(4,7,19);imhist(D(:,:,2));title('G');
subplot(4,7,20);imshow(D(:,:,3));title('B');subplot(4,7,21);imhist(D(:,:,3));title('B');

subplot(4,7,22);imshow(C);title('RGB cipher-image');
subplot(4,7,23);imshow(C(:,:,1));title('R');subplot(4,7,24);imhist(C(:,:,1));title('R');
subplot(4,7,25);imshow(C(:,:,2));title('G');subplot(4,7,26);imhist(C(:,:,2));title('G');
subplot(4,7,27);imshow(C(:,:,3));title('B');subplot(4,7,28);imhist(C(:,:,3));title('B');

figure(2);
B_H_3W=uint8(B_H_3W);Q_H_3W=uint8(Q_H_3W);
D_H_3W=uint8(D_H_3W);C_H_3W=uint8(C_H_3W);
subplot(4,2,1);imshow(B_H_3W);title('plain-image');
subplot(4,2,2);imhist(B_H_3W);title('histgram');
subplot(4,2,3);imshow(Q_H_3W);title('permuted-image');
subplot(4,2,4);imhist(Q_H_3W);title('histgram');
subplot(4,2,5);imshow(D_H_3W);title('diffused-image');
subplot(4,2,6);imhist(D_H_3W);title('histgram');
subplot(4,2,7);imshow(C_H_3W);title('cipher-image');
subplot(4,2,8);imhist(C_H_3W);title('histgram');

figure(3);
subplot(2,4,1);imshow(B1);title('bit-plane 1');
subplot(2,4,2);imshow(B2);title('bit-plane 2');
subplot(2,4,3);imshow(B3);title('bit-plane 3');
subplot(2,4,4);imshow(B4);title('bit-plane 4');
subplot(2,4,5);imshow(B5);title('bit-plane 5');
subplot(2,4,6);imshow(B6);title('bit-plane 6');
subplot(2,4,7);imshow(B7);title('bit-plane 7');
subplot(2,4,8);imshow(B8);title('bit-plane 8');

figure(4);
subplot(2,1,1);imshow(B_H_24W);subplot(2,1,2);imshow(C_H_24W);


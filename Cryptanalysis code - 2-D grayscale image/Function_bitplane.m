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
function [ bit_1_24HW ] = Function_bitplane( B )

B=double(B);[H,W0] = size(B);W=W0;
% BR = B(:,:,1);BG = B(:,:,2);BB = B(:,:,3);
% B_H_3W(:,1:W)=BR;B_H_3W(:,W+1:2*W)=BG;B_H_3W(:,2*W+1:3*W)=BB; %RGB size -> grayscale size H*3W

% bit-plane decomposition
bitPI=zeros(H,W,8); 
for i=1:8
    bitPI(:,:,i)=bitget(B,i); 
end
B1=bitPI(:,:,1);B2=bitPI(:,:,2);B3=bitPI(:,:,3);B4=bitPI(:,:,4);
B5=bitPI(:,:,5);B6=bitPI(:,:,6);B7=bitPI(:,:,7);B8=bitPI(:,:,8);

B_H_24W(:,1:W)=B1;B_H_24W(:,W+1:2*W)=B2;B_H_24W(:,2*W+1:3*W)=B3;B_H_24W(:,3*W+1:4*W)=B4;
B_H_24W(:,4*W+1:5*W)=B5;B_H_24W(:,5*W+1:6*W)=B6;B_H_24W(:,6*W+1:7*W)=B7;B_H_24W(:,7*W+1:8*W)=B8;
% step2 convert to 1D image bit matrix B
bit_B=B_H_24W';
bit_1_24HW=reshape(B_H_24W',1,H*8*W);

end


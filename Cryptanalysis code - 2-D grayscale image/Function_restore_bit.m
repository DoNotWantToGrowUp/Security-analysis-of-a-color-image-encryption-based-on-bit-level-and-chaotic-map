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
function [ C ] = Function_restore_bit( B,H,W )

C_24W_H=reshape(B,8*W,H);
C_H_24W=C_24W_H';

C1=C_H_24W(:,1:W);C2=C_H_24W(:,W+1:2*W);C3=C_H_24W(:,2*W+1:3*W);C4=C_H_24W(:,3*W+1:4*W);
C5=C_H_24W(:,4*W+1:5*W);C6=C_H_24W(:,5*W+1:6*W);C7=C_H_24W(:,6*W+1:7*W);C8=C_H_24W(:,7*W+1:8*W);

C_H_3W=C1+C2*2+C3*2^2+C4*2^3+C5*2^4+C6*2^5+C7*2^6+C8*2^7;
% CR=C_H_3W(:,1:W);CG=C_H_3W(:,W+1:2*W);CB=C_H_3W(:,2*W+1:3*W);
C=C_H_3W;

end


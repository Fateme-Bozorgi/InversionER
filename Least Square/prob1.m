

clc
clear all
close all
%% initial values
a=2;
b=-3;
x=linspace(0,20,10);
%% function
y=(a*x)+b;
disp('y :')
disp(y)
%% make noisy
s=mean(y);
disp('s :')
disp(s)

stndrd=s*0.01;
disp('std :')
disp(stndrd)

ynoisy=y+(stndrd*randn(1,length(y)));
disp('y noisy :')
disp(ynoisy)
%% LS
d=ynoisy';

G=ones(numel(x),2);
G(:,1)=x;
disp('G : ')
disp(G)

m=inv(G'*G)*G'*(d);v 
disp('m : ')
disp(m)


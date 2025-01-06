

clc
clear all
close all
%% initial values
c=2;
d=3;
x=linspace(0.8,1.6,20);
%% function
y=c*x.^d;
disp('y :')
disp(y)
%% make noisy
s=mean(y);
disp('s : ')
disp(s)

stndrd=s*0.01;
disp('std : ')
disp(stndrd)

ynoisy=y+(stndrd*randn(1,length(y)));
disp('y noisy :')
disp(ynoisy)
%% LS
d=ynoisy';
D=log(ynoisy);

U=log(x);
G=[ones(numel(x),1) U'];
disp('G : ')
disp(G)

m=inv(G'*G)*G'*(D');
m(1)=exp(m(1));
disp('m : ')
disp(m)
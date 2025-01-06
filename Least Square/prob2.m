

clc
clear all
close all
%% initial values
G=6.67e-11;
Z=10;
r=4;
rho=-0.5;
x=-200:5:200;
%% function
g=(4/3)*pi*G*rho*r^3*Z./((x.^2+Z^2).^(3/2));
disp('g :')
disp(g)
%% make noisy
s=mean(g);
disp('s : ')
disp(s)

stndrd=s*0.01;
disp('std : ')
disp(stndrd)

gnoisy=g+(stndrd*randn(1,length(g)));
disp('g noisy :')
disp(gnoisy)
%% LS
d=gnoisy;

U=((4/3)*pi*G*r^3*Z./((x.^2+Z^2).^(3/2)))';
disp('G : ')
disp(G)

m=inv(U'*U)*U'*(d');
disp('m : ')
disp(m)


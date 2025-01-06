
%shaw problem

clc
clear all
close all

g=shaw_kernel(20);
M=zeros(20,1);
M(8)=1;

teta=linspace(-pi/2,pi/2,20);
SSS=linspace(-pi/2,pi/2,20);

d=g*M;
mm=mean(g);
stndrd=mm*0.02;
d_noisy=d+(stndrd*randn(size(d))); %make noisy


%% svd
pp=rank(g)  %rank

[u1 s1 v1]=svd(g);

ss=s1(1:pp,1:pp);
uu=u1(:,1:pp);
vv=v1(:,1:pp);

UU=uu';
SS=inv(ss);

gg=vv*SS*UU;
disp('generalized-inverse_g:  ')
disp(gg)
M_est=gg*d;
M1=pinv(g)*d;

%% results
plot(teta,M_est,'color','r','linewidth',1)
hold on
plot(teta,M,'color','b','linewidth',1)
xlabel('teta','fontsize',15)
ylabel('Intensity','fontsize',15)

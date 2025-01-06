

clc
clear all
close all
%% initial values
A=[1 2 3 4 5;2 4 6 8 10;31 4 0 87 1;12 5 3 70 4;21 9 13 0 17]
b=[1;2;3;4;5]

%% calculations
p=rank(A)
[u s v]=svd(A)
ss=s(1:end-1,1:end-1)
uu=u(:,1:end-1)
vv=v(:,1:end-1)
UU=uu'
SS=inv(ss)

%% result
AA=vv*SS*UU;
disp('generalized-inverse_A:  ')
disp(AA)
x=AA*b
xx=pinv(A)*b
if x==xx
    disp('    x & xx are equal  ')
end


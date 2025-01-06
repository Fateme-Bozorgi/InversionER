

%pole-pole array
clc
clear
close all
%% initial values
rho1=10;
rho2=100;
I=2;
z=5;
a=2;
n=10; % Number of electrode displacements
N=2;

%% calculation:
k=(rho2-rho1)/(rho1+rho2);
E=1e-5;
Vp1=zeros(n,1);
Vp2=zeros(n,1);
for i=1:n
    r1=i*a; 
    e1=inf;s1=0;m1=0;

    while(e1>E)
        m1=m1+1;
        e1=k^m1/sqrt(r1^2+(2*m1*z)^2);
        s1=s1+e1;       
    end

    Vp1(i)=I*rho1/(2*pi)*(1/r1 + 2*s1);
        
end

rhoa=2*pi*N*Vp1/I;

%% result
figure;
plot(1:n,rhoa,'linewidth',2)
xlabel('n')
ylabel('\rho_{a}')

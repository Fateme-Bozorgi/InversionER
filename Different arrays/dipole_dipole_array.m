

%dipole-dipole array

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
r2=N*a;
r4=a*(N+1);
E=1e-5;
Vp1=zeros(n,1);
Vp2=zeros(n,1);
for i=1:n
    r1=(i+N)*a;
    r3=a*(N+(i+1)); 
    e1=inf;s1=0;m1=0;
    e2=inf;s2=0;m2=0;
    e3=inf;s3=0;m3=0;
    e4=inf;s4=0;m4=0;
    while(e1>E)
        m1=m1+1;
        e1=k^m1/sqrt(r1^2+(2*m1*z)^2);
        s1=s1+e1;       
    end
    while(e2>E)
        m2=m2+1;
        e2=k^m2/sqrt(r2^2+(2*m2*z)^2);
        s2=s2+e2;       
    end
    while(e3>E)
        m3=m3+1;
        e3=k^m3/sqrt(r3^2+(2*m3*z)^2);
        s3=s3+e3;       
    end
    while(e4>E)
        m4=m4+1;
        e4=k^m4/sqrt(r4^2+(2*m4*z)^2);
        s4=s4+e4;       
    end
    Vp1(i)=I*rho1/(2*pi)*(1/r1 + 2*s1 - 1/r2 - 2*s2);
    Vp2(i)=I*rho1/(2*pi)*(1/r3 + 2*s3 - 1/r4 - 2*s4);       
end
dVp=Vp1-Vp2;
rhoa=pi*a*N*(N+1)*(N+2)*dVp/I;

%% result
figure;
plot(1:n,rhoa,'linewidth',2)
xlabel('n')
ylabel('\rho_{a}')
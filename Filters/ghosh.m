

% Ghosh inverse filter coefficients for the computation of apparent resistivity
clc
clear all
close all
%% initial values
ro=[10 100];
h=5; 
b=[0.0225 -0.0495 0.1064 0.1854 1.9720 -1.5716 0.4018 -0.0814 0.0148];
L=[200 250 300];

lambda=1./L;

%% calculations

n=length(ro);
m=length(L);


for i=1:length(L)

    count=3*log10(lambda(i));
    nm=-5;
    for ij=1:9
      countVec(ij)=count-nm;
      
      nm=nm+1;
        
    end
    
    lambda_new=(10^(1/3)).^countVec;

     for j=1:length(lambda_new)
       k(n-1)=(ro(n-1)-ro(n))/(ro(n-1)+ro(n));
       u(n-1)=exp((-2)*(h(n-1))*(lambda_new(j)));
       T(n-1)=(ro(n-1))*((1-((k(n-1))*(u(n-1))))/(1+((k(n-1))*(u(n-1)))));
       
          for jj=n-2:-1:1
               u(jj)=exp(-2*h(jj)*lambda_new(j));
               w(jj)=ro(jj)*(1-u(jj))/(1+u(jj));
               T(jj)=(w(jj)+T(jj+1))/(1+((w(jj)*T(jj+1))/ro(jj)^2));
               
          end
            TT(j)=T(1);        
     end
      


     rhoa=((b(9)*TT(1))+(b(8)*TT(2))+(b(7)*TT(3))+(b(6)*TT(4))+(b(5)*TT(5))+(b(4)*TT(6))...
          +(b(3)*TT(7))+(b(2)*TT(8))+(b(1)*TT(9)));
   
   
    Rho(i)=rhoa;
    
end
%% result
disp('the value of Rho is as below:   ')
disp(Rho)
   


%Guptasarma inverse filter coefficients for the computation of apparent resistivity
clc
clear all
close all
%% initial values
ro=[10 100];
h=5; 
ar=[-0.17445 0.09672 0.36789 0.63906 0.91023 1.1814 1.43257];
phi=[0.1732 0.2945 2.147 -2.1733 0.6646 -0.1215 0.0155];
L=[200 250 300];



%% calculations


n=length(ro);
m=length(L);


for i=1:length(L)


    
    lambda_r=10.^((ar)-(log(L(i))));

     for j=1:length(lambda_r)
       k(n-1)=(ro(n-1)-ro(n))/(ro(n-1)+ro(n));
       u(n-1)=exp((-2)*(h(n-1))*(lambda_r(j)));
       T(n-1)=(ro(n-1))*((1-((k(n-1))*(u(n-1))))/(1+((k(n-1))*(u(n-1)))));
       
          for jj=n-2:-1:1
               u(jj)=exp(-2*h(jj)*lambda_r(j));
               w(jj)=ro(jj)*(1-u(jj))/(1+u(jj));
               T(jj)=(w(jj)+T(jj+1))/(1+((w(jj)*T(jj+1))/ro(jj)^2));
               
          end
            TTr(j)=T(1);        
     end
      

        
        rhoa=sum(ar(j)*TTr(j));
        
        Rho(i)=rhoa;
    
end
%% result
disp('the value of Rho is as below:   ')
disp(Rho)
   
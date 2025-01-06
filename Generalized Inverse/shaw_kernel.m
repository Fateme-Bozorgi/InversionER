
function [G] = shaw_kernel(n) 

% Check input. 
if (rem(n,2)~=0), error('The order n must be even'), end 
 
% Initialization. 
h = pi/n; A = zeros(n,n); 
 
% Compute the matrix A. 
co = cos(-pi/2 + [.5:n-.5]*h); 
psi = pi*sin(-pi/2 + [.5:n-.5]*h); 
for i=1:n/2 
  for j=i:n-i 
    ss = psi(i) + psi(j); 
    A(i,j) = ((co(i) + co(j))*sin(ss)/ss)^2; 
    A(n-j+1,n-i+1) = A(i,j); 
  end 
  A(i,n-i+1) = (2*co(i))^2; 
end 
A = A + triu(A,1)'; A = A*h; 
G=A;
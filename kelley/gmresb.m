function [ x, error, total_iters ] = gmresb ( x0, b, atv, params )

% GMRES linear equation solver, brute-force approach
%
% C. T. Kelley, January 10, 1994
%
% function [x, error, total_iters] = gmresb(x0, b, atv, params)
%
%  Disclaimer:
%
%    This code comes with no guarantee or warranty of any kind.
%
%  Author:
%
%    Tim Kelley
%
%  Reference:
%
%    Tim Kelley,
%    Iterative Methods for Linear and Nonlinear Equations,
%    SIAM, 2004,
%    ISBN: 0898713528,
%    LC: QA297.8.K45.
%
% Input: x0 = initial iterate.
%
%        b = right hand side
%
%        atv, a matrix-vector product routine
%            atv must return Ax when x is input
%            the format for atv is
%            function ax = atv(x)
%            Note that for GMRES we incorporate any 
%            preconditioning into the atv routine.
%
%        params = two dimensional vector to control iteration
%            params(1) = relative residual reduction factor
%            params(2) = max number of iterations
%
% Output: x=solution
%
%         error = vector of residual norms for the history of
%            the iteration
%
%         total_iters = number of iterations
%

%
% initialization
%
n=length(b);
errtol=params(1);
kmax=params(2);
x=x0;
%
%
h=zeros(kmax);
v=zeros(n,kmax);
%r=b-feval(atv,x);
if norm(x) ~=0
   r = b-feval(atv,x);
else
   r = b;
end
rho=norm(r);
errtol=errtol*norm(b);
error=[];
%
% test for termination on entry
%
error=[error,rho];
total_iters=0;
if(rho < errtol) 
    return
end
%
%
v(:,1)=r/rho;
beta=rho;
k=0;
%
% GMRES iteration
%
while((rho > errtol) & (k < kmax))
    k=k+1;
    v(:,k+1)=feval(atv,v(:,k));
%
% Modified Gram-Schmidt
%
    for j=1:k
        h(j,k)=v(:,k+1)'*v(:,j);
        v(:,k+1)=v(:,k+1)-h(j,k)*v(:,j);
    end
    h(k+1,k)=norm(v(:,k+1));
%
%   Watch out for happy breakdown.
%
    if(h(k+1,k) ~= 0)
        v(:,k+1)=v(:,k+1)/h(k+1,k);
    end
%
% Formulate and solve the least squares problem.
% Update the residual approximation.
%
    y=h(1:k+1,1:k)\(beta*eye(k+1,1));
    rho=norm(beta*eye(k+1,1) - h(1:k+1,1:k)*y);
    error=[error,rho];
end
%
% At this point either k > kmax or rho < errtol.
% It's time to compute x and leave.
%
total_iters=k;
x = x + v(1:n,1:k)*y;

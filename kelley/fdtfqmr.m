function [ x, error, total_iters ] = ...
                     fdtfqmr(f0, f, xc, params, xinit)
% Forward difference TFQMR solver for use in nsola
%
% C. T. Kelley, December 30, 1994
%
% function [x, error, total_iters]
%                    = fdtfqmr(f0, f, xc, params, xinit)
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
% Input:  f0 = function at current point
%         f = nonlinear function
%              the format for f is  function fx = f(x)
%              Note that for Newton-GMRES we incorporate any
%              preconditioning into the function routine.
%         xc = current point
%         params = two dimensional vector to control iteration
%              params(1) = relative residual reduction factor
%              params(2) = max number of iterations
%
%         xinit = initial iterate. xinit=0 is the default. This
%              is a reasonable choice unless restarts are needed.
%
%
% Output: x=solution
%         error = vector of residual norms for the history of
%                 the iteration
%         total_iters = number of iterations
%
% Requires: dirder.m
%

%
% initialization
%
b=-f0;
n=length(b); errtol = params(1)*norm(b); kmax = params(2); error=[]; 
x=zeros(n,1);
r=b;
if nargin == 5
    x=xinit;
    r=-dirder(xc, x, f, f0)-f0;
end
%
u=zeros(n,2); y=zeros(n,2); w = r; y(:,1) = r; 
k=0; d=zeros(n,1); 
v=dirder(xc, y(:,1),f,f0);
u(:,1)=v;
theta=0; eta=0; tau=norm(r); error=[error,tau];
rho=tau*tau;
%
% TFQMR iteration
%
while( k < kmax)
    k=k+1;
    sigma=r'*v;
%
    if sigma==0
        error('TFQMR breakdown, sigma=0')
    end
%
    alpha=rho/sigma;
%
% 
%
    for j=1:2
%
%   Compute y2 and u2 only if you have to
%
        if j==2 
            y(:,2)=y(:,1)-alpha*v;
            u(:,2)=dirder(xc, y(:,2),f,f0);
        end
        m=2*k-2+j;
        w=w-alpha*u(:,j);
        d=y(:,j)+(theta*theta*eta/alpha)*d;
        theta=norm(w)/tau; c=1/sqrt(1+theta*theta);
        tau=tau*theta*c; eta=c*c*alpha;
        x=x+eta*d;
%
%   Try to terminate the iteration at each pass through the loop
%
        if tau*sqrt(m+1) <= errtol
            error=[error, tau];
            total_iters=k;
            return
        end
    end
%
%
%
    if rho==0
        error('TFQMR breakdown, rho=0')
    end
%
    rhon=r'*w; beta=rhon/rho; rho=rhon;
    y(:,1)=w + beta*y(:,2);
    u(:,1)=dirder(xc, y(:,1),f,f0);
    v=u(:,1)+beta*(u(:,2)+beta*v);
    error=[error, tau];
    total_iters=k;
end

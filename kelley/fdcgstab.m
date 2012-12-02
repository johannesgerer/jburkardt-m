function [ x, error, total_iters] = ...
                     fdcgstab(f0, f, xc, params, xinit )
% Forward difference Bi-CGSTAB solver for use in nsola
%
% C. T. Kelley, December 29, 1994
%
% function [x, error, total_iters]
%                    = fdcgstab(f0, f, xc, params, xinit)
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
rho=zeros(kmax+1,1);
%
% Use zero vector as initial iterate for Newton step unless
% the calling routine has a better idea (useful for GMRES(m)).
%
x=zeros(n,1);
r=b;
if nargin == 5
    x=xinit;
    r=-dirder(xc, x, f, f0)-f0;
end
%
hatr0=r;
k=0; rho(1)=1; alpha=1; omega=1;
v=zeros(n,1); p=zeros(n,1); rho(2)=hatr0'*r;
zeta=norm(r); error=[error,zeta];
%
% Bi-CGSTAB iteration
%
while((zeta > errtol) & (k < kmax))
    k=k+1;
    if omega==0
       error('Bi-CGSTAB breakdown, omega=0');
    end
    beta=(rho(k+1)/rho(k))*(alpha/omega);
    p=r+beta*(p - omega*v);
    v=dirder(xc,p,f,f0);
    tau=hatr0'*v;
    if tau==0
        error('Bi-CGSTAB breakdown, tau=0');
    end 
    alpha=rho(k+1)/tau;
    s=r-alpha*v; 
    t=dirder(xc,s,f,f0);
    tau=t'*t;
    if tau==0
       error('Bi-CGSTAB breakdown, t=0');
    end
    omega=t'*s/tau; 
    rho(k+2)=-omega*(hatr0'*t);
    x=x+alpha*p+omega*s;
    r=s-omega*t;
    zeta=norm(r);
    total_iters=k;
    error=[error, zeta];
end


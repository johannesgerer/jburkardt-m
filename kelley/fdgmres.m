function [x, error, total_iters] = fdgmres(f0, f, xc, params, xinit)

% GMRES linear equation solver for use in Newton-GMRES solver
%
% C. T. Kelley, July 24, 1994
%
% function [x, error, total_iters] = fdgmres(f0, f, xc, params, xinit)
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
%            params(3) (Optional) = reorthogonalization method
%                   1 -- Brown/Hindmarsh condition (default)
%                   2 -- Never reorthogonalize (not recommended)
%                   3 -- Always reorthogonalize (not cheap!)
%
%         xinit = initial iterate. xinit=0 is the default. This
%              is a reasonable choice unless restarted GMRES
%              will be used as the linear solver.
%
% Output: x=solution
%         error = vector of residual norms for the history of
%                 the iteration
%         total_iters = number of iterations
%
% Requires givapp.m, dirder.m 

%
% initialization
%
errtol=params(1);
kmax=params(2);
reorth=1;
if length(params) == 3
    reorth=params(3);
end
%
% right side of linear equation for the step is -f0 if the
% default initial iterate is used
%
b=-f0;
n=length(b);
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
%
h=zeros(kmax);
v=zeros(n,kmax);
c=zeros(kmax+1,1);
s=zeros(kmax+1,1);
rho=norm(r);
g=rho*eye(kmax+1,1);
errtol=errtol*norm(b);
error=[];
%
% test for termination on entry
%
error=[error,rho];
total_iters=0;
if(rho < errtol) 
%   disp(' early termination ')
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
%
%      call directional derivative function
%
    v(:,k+1)=dirder(xc, v(:,k), f, f0);
    normav=norm(v(:,k+1));
%
% Modified Gram-Schmidt
%
    for j=1:k
        h(j,k)=v(:,j)'*v(:,k+1);
        v(:,k+1)=v(:,k+1)-h(j,k)*v(:,j);
    end
    h(k+1,k)=norm(v(:,k+1));
    normav2=h(k+1,k);
%
% reorthogonalize?
%
if  (reorth == 1 & normav + .001*normav2 == normav) | reorth ==  3
    for j=1:k
        hr=v(:,j)'*v(:,k+1);
	h(j,k)=h(j,k)+hr;
        v(:,k+1)=v(:,k+1)-hr*v(:,j);
    end
    h(k+1,k)=norm(v(:,k+1));
end
%
%   watch out for happy breakdown
%
    if(h(k+1,k) ~= 0)
    v(:,k+1)=v(:,k+1)/h(k+1,k);
    end
%
%   Form and store the information for the new Givens rotation
%
    if k > 1
        h(1:k,k)=givapp(c(1:k-1),s(1:k-1),h(1:k,k),k-1);
    end
%
%   Don't divide by zero if solution has  been found
%
    nu=norm(h(k:k+1,k));
    if nu~=0
%        c(k)=h(k,k)/nu;
        c(k)=conj(h(k,k)/nu);
        s(k)=-h(k+1,k)/nu;
        h(k,k)=c(k)*h(k,k)-s(k)*h(k+1,k);
        h(k+1,k)=0;
        g(k:k+1)=givapp(c(k),s(k),g(k:k+1),1);
    end
%
% Update the residual norm
%
    rho=abs(g(k+1));
    error=[error,rho];
%
% end while
%
end
%
% At this point either k > kmax or rho < errtol.
% It's time to compute x and leave.
%

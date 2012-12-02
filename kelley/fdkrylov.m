function [step, error, total_iters, f_evals] = ...
    fkrylov(f0, f, x, params, lmeth )
% Krylov linear equation solver for use in nsola
%
% C. T. Kelley, December 30, 1994
%
% function [step, error, total_iters] = fdkrylov(f0, f, x, params, lmeth)
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
%         x = current point
%         params = two dimensional vector to control iteration
%              params(1) = relative residual reduction factor
%              params(2) = max number of iterations
%              params(3) = max number of restarts for GMRES(m)
%              params(4) (Optional) = reorthogonalization method in GMRES
%                   1 -- Brown/Hindmarsh condition (default)
%                   2 -- Never reorthogonalize (not recommended)
%                   3 -- Always reorthogonalize (not cheap!)
%
%         lmeth = method choice
%              1 GMRES without restarts (default)
%              2 GMRES(m), m=params(2) and the maximum number
%                   of restarts is params(3) 
%              3 Bi-CGSTAB
%              4 TFQMR
%
% Output: x=solution
%         error = vector of residual norms for the history of
%                 the iteration
%         total_iters = number of iterations
%
% Requires: dirder.m, fdgmres.m, fdtfqmr.m
%           fdcgstab.m, givapp.m
%

%
% initialization
%
lmaxit=params(2);
restart_limit=20;
if length(params)>=3
    restart_limit=params(3);
end
if lmeth==1
    restart_limit=0;
end
if length(params)==3
%
% default reorthogonalization
%
     gmparms=[params(1), params(2), 1];
elseif length(params)==4
%
% reorthogonalization method is params(4)
%
     gmparms=[params(1), params(2), params(4)];
else
     gmparms=[params(1), params(2)];
end
%
% linear iterative methods
%
if lmeth==1 | lmeth==2  % GMRES or GMRES(m) 
%
% compute the step using a GMRES routine especially designed
% for this purpose
%
    [step, errstep, total_iters]=fdgmres(f0, f, x, gmparms);
    kinn=0;
%
%   restart at most restart_limit times
%
    while total_iters==lmaxit & ...
          errstep(total_iters)>gmparms(1)*norm(f0) & ...
          kinn < restart_limit
        kinn=kinn+1;
        [step, errstep, total_iters]=fdgmres(f0, f, x, gmparms,step);
    end
    total_iters=total_iters+kinn*lmaxit;
    f_evals=total_iters+kinn;
%
% Bi-CGSTAB
%
elseif lmeth==3
    [step, errstep, total_iters]=fdcgstab(f0, f, x, gmparms);
    f_evals=2*total_iters;
%
% TFQMR
%
elseif lmeth==4 
    [step, errstep, total_iters]=fdtfqmr(f0, f, x, gmparms);
    f_evals=2*total_iters;
else
    error(' lmeth error in fdkrylov')
end

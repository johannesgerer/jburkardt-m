function [ sol, it_hist, ierr ] = nsol ( x, f, tol, parms )

% Newton solver, locally convergent 
% solver for f(x) = 0
%
% Hybrid of Newton, Shamanskii, Chord
%
% C. T. Kelley, November 26, 1993
%
% function [sol, it_hist, ierr] = nsol(x,f,tol,parms)
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
% inputs:
%        initial iterate = x
%		 function = f
%        tol = [atol, rtol] relative/absolute
%			error tolerances
%	 parms = [maxit, isham, rsham]
%			maxit = maxmium number of iterations
%				default = 40
%		isham, rsham: The Jacobian matrix is
% 		computed and factored after isham
%               updates of x or whenever the ratio
%		of successive infinity norms of the
%               nonlinear residual exceeds rsham.
%			isham = 1, rsham = 0 is Newton's method,
%			isham = -1, rsham = 1 is the chord method,
% 			isham = m, rsham = 1 is the Shamanskii method
%      	       defaults = [40, 1000, .5]
%
% output:
%	sol = solution
%	it_hist = infinity norms of nonlinear residuals
%			for the iteration
%	ierr = 0 upon successful termination
%	ierr = 1 if either after maxit iterations
%             the termination criterion is not satsified
%             or the ratio of successive nonlinear residuals
%             exceeds 1. In this latter case, the iteration
%				is terminted.
%
%
% internal parameter:
%       debug = turns on/off iteration statistics display as
%               the iteration progresses
%
% Requires: diffjac.m, dirder.m
%
% Here is an example. The example computes pi as a root of sin(x)
% with Newton's method and plots the iteration history.
%
%
%  x=3; tol=[1.d-6, 1.d-6]; params=[40, 1, 0];
%  [result, errs, it_hist] = nsol(x, 'sin', tol, params);
%  result
%  semilogy(errs)
%

%
% set the debug parameter, 1 turns display on, otherwise off
%
debug=1;
%
% initialize it_hist, ierr, and set the iteration parameters
%
ierr = 0;
maxit=40;
isham=1000;
rsham=.5;
if nargin == 4
maxit=parms(1); isham=parms(2); rsham=parms(3);
end
rtol=tol(2); atol=tol(1);
it_hist=[];
n = length(x);
fnrm=1;
itc=0;
%
% evaluate f at the initial iterate
% compute the stop tolerance
%
f0= feval(f,x);
fnrm=norm(f0,inf);
it_hist=[it_hist,fnrm];
fnrmo=1;
itsham=isham;
stop_tol=atol+rtol*fnrm;
%
% main iteration loop
%
while(fnrm > stop_tol & itc < maxit)
%
% keep track of the ratio (rat = fnrm/frnmo)
% of successive residual norms and 
% the iteration counter (itc)
%
    rat=fnrm/fnrmo;
    outstat(itc+1, :) = [itc fnrm rat];
    fnrmo=fnrm; 
    itc=itc+1;
%
% evaluate and factor the Jacobian
% on the first iteration, every isham iterates, or
% if the ratio of successive residual norm is too large
%
    if(itc == 1 | rat > rsham | itsham == 0)
        itsham=isham;
        [l, u] = diffjac(x,f,f0);
    end
    itsham=itsham-1;
%
% compute the step
%
    tmp = -l\f0;
    step = u\tmp;
    xold=x;
    x = x + step;
    f0= feval(f,x);
    fnrm=norm(f0,inf);
    it_hist=[it_hist,fnrm];
    rat=fnrm/fnrmo;
    if debug==1
        disp([itc fnrm rat])
    end
    outstat(itc+1, :)=[itc fnrm rat];
%
% if residual norms increase, terminate, set error flag
%
    if rat >= 1
        ierr=1;
        sol=xold;
        disp('increase in residual')
        disp(outstat)
        return;
    end
% end while
end
sol=x;
if debug==1
    disp(outstat)
end
%
% on failure, set the error flag
%
if fnrm > stop_tol
    ierr = 1;
end

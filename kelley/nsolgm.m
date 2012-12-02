function [ sol, it_hist, ierr ] = nsolgm ( x, f, tol, parms )

% Newton-GMRES locally convergent solver for f(x) = 0
%
% Uses Eisenstat-Walker forcing term
%
% C. T. Kelley, July 1, 1994
%
% function [sol, it_hist, ierr] = nsolgm(x,f,tol,parms)
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
%        function = f
%        tol = [atol, rtol] relative/absolute
%            error tolerances for the nonlinear iteration
%        parms = [maxit, maxitl, etamax]
%            maxit = maxmium number of nonlinear iterations
%                default = 40
%            maxitl = maximum number of inner iterations
%                default = 40
%            |etamax| = Maximum error tolerance for residual in inner
%                iteration. The inner iteration terminates
%                when the relative linear residual is
%                smaller than eta*| F(x_c) |. eta is determined
%                by the modified Eisenstat-Walker formula if etamax > 0.
%                If etamax < 0, then eta = |etamax| for the entire
%                iteration.
%                default: etamax=.9
%
% output:
%        sol = solution
%        it_hist(maxit,3) = scaled l2 norms of nonlinear residuals
%            for the iteration, number function evaluations,
%            and number of steplength reductions
%        ierr = 0 upon successful termination
%        ierr = 1 if either after maxit iterations
%             the termination criterion is not satsified
%             or the ratio of successive nonlinear residuals
%             exceeds 1. In this latter case, the iteration
%             is terminted.
%
% internal parameters:
%       debug = turns on/off iteration statistics display as
%               the iteration progresses
%
% Requires fdgmres.m and givapp.m
%

%
% set the debug parameter, 1 turns display on, otherwise off
%
debug=1;
%
% initialize it_hist, ierr, and set the iteration parameters
%
gamma=.9;
ierr = 0; maxit=40; lmaxit=40; etamax=.9; it_histx=zeros(maxit,2);
%
if nargin == 4
    maxit=parms(1); lmaxit=parms(2); etamax=parms(3);
end
gmparms=[abs(etamax), lmaxit];
rtol=tol(2); atol=tol(1); n = length(x); fnrm=1; itc=0;
%
% evaluate f at the initial iterate
% compute the stop tolerance
%
f0=feval(f,x);
fnrm=norm(f0)/sqrt(n);
it_histx(itc+1,1)=fnrm; it_histx(itc+1,2)=0; 
fnrmo=1;
stop_tol=atol + rtol*fnrm;
outstat(itc+1, :) = [itc fnrm 0 0];
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
    fnrmo=fnrm; 
    itc=itc+1;
%
% compute the step using a GMRES routine especially designed
% for this purpose
%
    [step, errstep, inner_it_count]=fdgmres(f0, f, x, gmparms); 
    xold=x;
    x = x + step;
    f0=feval(f,x);
    fnrm=norm(f0)/sqrt(n);
    it_histx(itc+1,1)=fnrm;
    rat=fnrm/fnrmo;
    outstat(itc+1, :) = [itc fnrm inner_it_count rat];
%
    if debug==1
        disp(outstat(itc+1,:))
    end
%
%   How many function evaluations did this iteration require?
%
    it_histx(itc+1,2)=it_histx(itc,2)+inner_it_count+1;
    if(itc == 1) it_histx(itc+1,2) = it_histx(itc+1,2)+1; end;
%
%   adjust eta 
%
    if etamax > 0
        etaold=gmparms(1);
        etanew=gamma*rat*rat;
        if gamma*etaold*etaold > .1
            etanew=max(etanew,gamma*etaold*etaold);
        end
        gmparms(1)=min([etanew,etamax]);
        gmparms(1)=max(gmparms(1),.5*stop_tol/fnrm);
    end
% end while
end
sol=x;
it_hist=it_histx(1:itc+1,:);
if debug==1
    disp(outstat)
    it_hist=it_histx(1:itc+1,:);
end
%
% on failure, set the error flag
%
if fnrm > stop_tol; ierr = 1; end

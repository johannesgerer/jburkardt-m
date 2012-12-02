function [ sol, it_hist, ierr ] = nsola ( x, f, tol, parms )

% Newton-Krylov solver, globally convergent 
% solver for f(x) = 0
%
% Inexact-Newton-Armijo iteration
%
% Eisenstat-Walker forcing term
%
% Parabolic line search via three point interpolation.
%
% C. T. Kelley, June 29, 1994
%       parms made truly optional, Feb 12, 1996
%
% function [sol, it_hist, ierr] = nsola(x,f,tol,parms)
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
%        parms = [maxit, maxitl, etamax, lmeth, restart_limit]
%            maxit = maxmium number of nonlinear iterations
%                default = 40
%            maxitl = maximum number of inner iterations before restart
%                in GMRES(m), m=maxitl 
%                default = 40
%                
%                For iterative methods other than GMRES(m) maxitl
%                is the upper bound on linear iterations.
%
%            |etamax| = Maximum error tolerance for residual in inner
%                iteration. The inner iteration terminates
%                when the relative linear residual is
%                smaller than eta*| F(x_c) |. eta is determined
%                by the modified Eisenstat-Walker formula if etamax > 0.
%                If etamax < 0, then eta = |etamax| for the entire
%                iteration.
%                default: etamax=.9
%
%            lmeth = choice of linear iterative method
%                    1 (GMRES), 2 GMRES(m), 
%                    3 (BICGSTAB), 4 (TFQMR)
%                 default = 1 (GMRES, no restarts)
%
%            restart_limit = max number of restarts for GMRES if
%                    lmeth = 2
%                  default=20
%
% output:
%        sol = solution
%        it_hist(maxit,3) = scaled l2 norms of nonlinear residuals
%            for the iteration, of number function evaluations,
%            and number of steplength reductions
%        ierr = 0 upon successful termination
%        ierr = 1 if either after maxit iterations
%             the termination criterion is not satsified
%             or the ratio of successive nonlinear residuals
%             exceeds 1. In this latter case, the iteration
%             is terminted.
%        ierr = 2 failure in the line search. The iteration
%             is terminated if too many steplength reductions
%             are taken.
%
%
% internal parameters:
%       debug = turns on/off iteration statistics display as
%               the iteration progresses
%
%       alpha = 1.d-4, parameter to measure sufficient decrease
%
%       sigma0 = .1, sigma1=.5, safeguarding bounds for the linesearch
%
%       maxarm = 50, maximum number of steplength reductions before
%                    failure is reported
%
%
% Requires dirder.m, fdkrylov.m, parab3p.m, fdgmres.m, 
%          fdcgstab.m, fdtfqmr.m, givapp.m
% 
%
%

%
% set the debug parameter, 1 turns display on, otherwise off
%
debug=1;
%
% set alpha, sigma0, sigma1, maxarm, and restart_limit
%
alpha = 1.d-4; sigma0=.1; sigma1=.5; maxarm = 50; 
%
% initialize it_hist, ierr, and set the iteration parameters
%
gamma=.9;
ierr = 0; maxit=40; lmaxit=40; etamax=.9; it_histx=zeros(maxit,3);
lmeth=1; restart_limit=20;
%
% initialize parameters for the iterative methods
%
gmparms=[abs(etamax), lmaxit];
if nargin == 4
    maxit=parms(1); lmaxit=parms(2); etamax=parms(3);
    gmparms=[abs(etamax), lmaxit];
    if length(parms)>=4
       lmeth=parms(4);
    end
    if length(parms)==5
       gmparms=[abs(etamax), lmaxit, parms(5), 1];
    end
end
%
rtol=tol(2); atol=tol(1); n = length(x); fnrm=1; itc=0;
%
% evaluate f at the initial iterate
% compute the stop tolerance
%
f0=feval(f,x);
fnrm=norm(f0)/sqrt(n);
it_histx(itc+1,1)=fnrm; it_histx(itc+1,2)=0; it_histx(itc+1,3)=0;
fnrmo=1;
stop_tol=atol + rtol*fnrm;
outstat(itc+1, :) = [itc fnrm 0 0 0];
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
    [step, errstep, inner_it_count,inner_f_evals]=...
         fdkrylov(f0, f, x, gmparms, lmeth);
%
%   The line search starts here.
%
    xold=x;
    lambda=1; lamm=1; lamc=lambda; iarm=0;
    xt = x + lambda*step;
    ft=feval(f,xt);
    nft=norm(ft); nf0=norm(f0); ff0=nf0*nf0; ffc=nft*nft; ffm=nft*nft;
    while nft >= (1 - alpha*lambda) * nf0;
%
%   apply the three point parabolic model
%
        if iarm == 0
            lambda=sigma1*lambda; 
        else
            lambda=parab3p(lamc, lamm, ff0, ffc, ffm); 
        end
%
% update x; keep the books on lambda
%
        xt=x+lambda*step;
        lamm=lamc;
        lamc=lambda;
%
% keep the books on the function norms
%
        ft=feval(f,xt);
        nft=norm(ft);
        ffm=ffc;
        ffc=nft*nft;
        iarm=iarm+1;
        if iarm > maxarm
            disp(' Armijo failure, too many reductions ');
            ierr=2;
            disp(outstat)
            it_hist=it_histx(1:itc+1,:);
            sol=xold;
            return;
        end
    end
    x=xt;
    f0=ft;
%
%   end of line search
%
    fnrm=norm(f0)/sqrt(n);
    it_histx(itc+1,1)=fnrm; 
%
%   How many function evaluations did this iteration require?
%
    it_histx(itc+1,2)=it_histx(itc,2)+inner_f_evals+iarm+1;
    if(itc == 1) it_histx(itc+1,2) = it_histx(itc+1,2)+1; end;
    it_histx(itc+1,3)=iarm;
%
    rat=fnrm/fnrmo;
%
%   adjust eta as per Eisenstat-Walker
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
%
    outstat(itc+1, :) = [itc fnrm inner_it_count rat iarm];
%
    if debug==1
        disp(outstat(itc+1,:))
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
if fnrm > stop_tol
    ierr = 1;
end


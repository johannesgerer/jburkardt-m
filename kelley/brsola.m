function [sol, it_hist, ierr] = brsola ( x, f, tol, parms )
% Broyden's Method solver, globally convergent
% solver for f(x) = 0, Armijo rule, one vector storage
%
% C. T. Kelley, June 29, 1994
%
% function [sol, it_hist, ierr] = brsola(x,f,tol,parms)
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
%        parms = [maxit, maxdim]
%            maxit = maxmium number of nonlinear iterations
%                default = 40
%            maxdim = maximum number of Broyden iterations
%                before restart, so maxdim-1 vectors are 
%                stored
%                default = 40
%
% output:
%        sol = solution
%        it_hist(maxit,3) = scaled l2 norms of nonlinear residuals
%            for the iteration, number function evaluations,
%            and number of steplength reductions
%        ierr = 0 upon successful termination
%        ierr = 1 if after maxit iterations
%             the termination criterion is not satsified.
%        ierr = 2 failure in the line search. The iteration
%             is terminated if too many steplength reductions
%             are taken.
%
%
% internal parameter:
%       debug = turns on/off iteration statistics display as
%               the iteration progresses
%
%       alpha = 1.d-4, parameter to measure sufficient decrease
%
%       maxarm = 10, maximum number of steplength reductions before
%                    failure is reported

%
% set the debug parameter, 1 turns display on, otherwise off
%
debug=1;
%
% initialize it_hist, ierr, and set the iteration parameters
%
ierr = 0; maxit=40; maxdim=39;  
it_histx=zeros(maxit,3);
maxarm=10;
%
if nargin == 4
    maxit=parms(1); maxdim=parms(2)-1; 
end
rtol=tol(2); atol=tol(1); n = length(x); fnrm=1; itc=0; nbroy=0;
%
% evaluate f at the initial iterate
% compute the stop tolerance
%
f0=feval(f,x);
fc=f0;
fnrm=norm(f0)/sqrt(n);
it_hist(itc+1)=fnrm;
it_histx(itc+1,1)=fnrm; it_histx(itc+1,2)=0; it_histx(itc+1,3)=0;
fnrmo=1;
stop_tol=atol + rtol*fnrm;
outstat(itc+1, :) = [itc fnrm 0 0];
%
% terminate on entry?
%
if fnrm < stop_tol
    sol=x;
    return
end
%
% initialize the iteration history storage matrices
%
stp=zeros(n,maxdim);
stp_nrm=zeros(maxdim,1);
lam_rec=ones(maxdim,1);
%
% Set the initial step to -F, compute the step norm
%
lambda=1;
stp(:,1) = -fc;
stp_nrm(1)=stp(:,1)'*stp(:,1);
%
% main iteration loop
%
while(itc < maxit)
%
    nbroy=nbroy+1;
%
%   keep track of successive residual norms and 
%   the iteration counter (itc)
%
    fnrmo=fnrm; itc=itc+1;
%
%   compute the new point, test for termination before
%   adding to iteration history
%
    xold=x; lambda=1; iarm=0; lrat=.5; alpha=1.d-4;
    x = x + stp(:,nbroy);
    fc=feval(f,x);
    fnrm=norm(fc)/sqrt(n);
    ff0=fnrmo*fnrmo; ffc=fnrm*fnrm; lamc=lambda;
%
%
%   Line search, we assume that the Broyden direction is an
%   ineact Newton direction. If the line search fails to
%   find sufficient decrease after maxarm steplength reductions
%   brsola returns with failure. 
%
%   Three-point parabolic line search
%
    while fnrm >= (1 - lambda*alpha)*fnrmo & iarm < maxarm
%       lambda=lambda*lrat;
        if iarm==0
            lambda=lambda*lrat;
        else
            lambda=parab3p(lamc, lamm, ff0, ffc, ffm);
        end
        lamm=lamc; ffm=ffc; lamc=lambda;
        x = xold + lambda*stp(:,nbroy);
        fc=feval(f,x);
        fnrm=norm(fc)/sqrt(n);
        ffc=fnrm*fnrm;
        iarm=iarm+1;
    end
%
%   set error flag and return on failure of the line search
%
    if iarm == maxarm
        disp('Line search failure in brsola ')
        ierr=2;
        it_hist=it_histx(1:itc+1,:);
        sol=xold;
        return;
    end
%
%   How many function evaluations did this iteration require?
%
    it_histx(itc+1,1)=fnrm;
    it_histx(itc+1,2)=it_histx(itc,2)+iarm+1;
    if(itc == 1) it_histx(itc+1,2) = it_histx(itc+1,2)+1; end;
    it_histx(itc+1,3)=iarm;
%
%   terminate?
%
    if fnrm < stop_tol
        sol=x;
        rat=fnrm/fnrmo;
        outstat(itc+1, :) = [itc fnrm iarm rat];
        it_hist=it_histx(1:itc+1,:);
%        it_hist(itc+1)=fnrm;
        if debug==1
            disp(outstat(itc+1,:))
        end
        return
    end
%
%
%   modify the step and step norm if needed to reflect the line 
%   search
%
    lam_rec(nbroy)=lambda;
    if lambda ~= 1
         stp(:,nbroy)=lambda*stp(:,nbroy);
         stp_nrm(nbroy)=lambda*lambda*stp_nrm(nbroy);
    end
%
%
%    it_hist(itc+1)=fnrm; 
    rat=fnrm/fnrmo;
    outstat(itc+1, :) = [itc fnrm iarm rat];
        if debug==1
            disp(outstat(itc+1,:))
        end
%
%
%   if there's room, compute the next search direction and step norm and
%   add to the iteration history 
%
    if nbroy < maxdim+1
        z=-fc;
        if nbroy > 1
            for kbr = 1:nbroy-1
                 ztmp=stp(:,kbr+1)/lam_rec(kbr+1);
                 ztmp=ztmp+(1 - 1/lam_rec(kbr))*stp(:,kbr);
                 ztmp=ztmp*lam_rec(kbr);
                 z=z+ztmp*((stp(:,kbr)'*z)/stp_nrm(kbr));
            end
        end
%
%       store the new search direction and its norm
%
        a2=-lam_rec(nbroy)/stp_nrm(nbroy);
        a1=1 - lam_rec(nbroy);
        zz=stp(:,nbroy)'*z;
        a3=a1*zz/stp_nrm(nbroy);
        a4=1+a2*zz;
        stp(:,nbroy+1)=(z-a3*stp(:,nbroy))/a4;
        stp_nrm(nbroy+1)=stp(:,nbroy+1)'*stp(:,nbroy+1);
%
%
%
    else
%
%   out of room, time to restart
%
        stp(:,1)=-fc;
        stp_nrm(1)=stp(:,1)'*stp(:,1);
        nbroy=0;
%
%
%
    end
%
% end while
end
%
% We're not supposed to be here, we've taken the maximum
% number of iterations and not terminated.
%
sol=x;
it_hist=it_histx(1:itc+1,:);
ierr=1;
if debug==1
    disp(outstat)
end

function [ sol, it_hist, ierr ] = brsol ( x, f, tol, parms )

% Broyden's Method solver, locally convergent 
% solver for f(x) = 0
%
% C. T. Kelley, June 29, 1994
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
%        parms = [maxit, maxdim, linprob]
%            maxit = maxmium number of nonlinear iterations
%                default = 40
%            maxdim = maximum number of Broyden iterations
%                before restart, so maxdim+3 vectors are 
%                stored (see text). By making the code a bit more
%                subtle (putting z and F in the same place) one can
%                reduce this overhead to maxdim+2 vectors. 
%                default = 40
%            linprob = 0 for nonlinear problem
%                    = 1 for linear problem
%            if linprob = 1 an increase in the residual does
%                 not result in termination 
%                 default = 0
%
% output:
%        sol = solution
%        it_hist(maxit) = scaled l2 norms of nonlinear residuals
%        ierr = 0 upon successful termination
%        ierr = 1 if either after maxit iterations
%             the termination criterion is not satsified
%             or the ratio of successive nonlinear residuals
%             exceeds 1. In this latter case, the iteration
%             is terminated.
%
%
%  Local parameters:
%
%    debug = turns on/off iteration statistics display as
%    the iteration progresses

%
% set the debug parameter, 1 turns display on, otherwise off
%
  debug=1;
%
% initialize it_hist, ierr, and set the iteration parameters
%
  ierr = 0; 
  maxit=40; 
  maxdim=39; 
  linprob = 0; 
  it_histx=zeros(maxit);

  if nargin == 4
    maxit=parms(1); maxdim=parms(2)-1; linprob=parms(3);
  end

  rtol=tol(2); 
  atol=tol(1); 
  n = length(x); 
  fnrm=1; 
  itc=0; 
  nbroy=0;
%
%  evaluate f at the initial iterate
%  compute the stop tolerance
%
  f0=feval(f,x);
  fc=f0;
  fnrm=norm(f0)/sqrt(n);
  it_hist(itc+1)=fnrm;
  fnrmo=1;
  stop_tol=atol + rtol*fnrm;
  outstat(itc+1, :) = [itc fnrm 0];
%
% initialize the iteration history storage matrices
%
  stp=zeros(n,maxdim);
  stp_nrm=zeros(maxdim,1);
%
% Set the initial step to -F, compute the step norm
%
  stp(:,1) = -fc;
  stp_nrm(1)=stp(:,1)'*stp(:,1);
%
% main iteration loop
%
  while(itc < maxit)

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
    x = x + stp(:,nbroy);
    fc=feval(f,x);
    fnrm=norm(fc)/sqrt(n);
    it_hist(itc+1)=fnrm; 
    rat=fnrm/fnrmo;
    outstat(itc+1, :) = [itc fnrm rat];
    if debug==1
        disp(outstat(itc+1,:))
    end
%
%   test for termination before computing the next w
%
    if fnrm <= stop_tol 
        sol=x;
        return;
    end
%
% if residual norms increase, terminate, set error flag
%
    if rat >= 1 & linprob == 0
        ierr=1;
        disp('increase in residual')
        disp(outstat)
        return;
    end
%
%   if there's room, compute the step and step norm and
%   add to the iteration history 
%
    if nbroy < maxdim+1
        z=-fc;
        if nbroy > 1
            for kbr = 1:nbroy-1
                 z=z+stp(:,kbr+1)*((stp(:,kbr)'*z)/stp_nrm(kbr));
            end
        end
%
%       store the new step and step norm
%
        zz=stp(:,nbroy)'*z;
        zz=zz/stp_nrm(nbroy);
        stp(:,nbroy+1)=z/(1-zz);
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

function [ x, error, total_iters, it_hist ] = ...
                     pcgsol ( x0, b, atv, params, pcv )

% Preconditioned Conjugate-Gradient solver
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
% Input:        x0=initial iterate
%               b=right hand side
%               atv, a matrix-vector product routine
%			atv must return Ax when x is input
%			the format for atv is
%                       function ax = atv(x)
%               params = two dimensional vector to control iteration
%                        params(1) = relative residual reduction factor
%                        params(2) = max number of iterations
%               pcv, a routine to apply the preconditioner
%                       if omitted, the identity is used.
%                       The format for pcv is
%                       function px = pcv(x).
%
% Output:       x=solution
%               error = vector of iteration residual norms
%               total_iters = number of iterations
%               it_hist (optional) = matrix of all iterations
%			useful for movies
%
% 
%

%
% initialization
%
  if ( nargout == 4 )
    it_hist = [];
   end

  n = length(b);
  errtol = params(1);
  maxiters = params(2);
  error = [];
  x = x0;

  if ( nargout == 4 )
    it_hist = [it_hist, x];
  end

  r = b - feval ( atv, x );

  if ( nargin == 4 )
    z = r;
  else
    z = feval ( pcv, r );
  end

  rho = z'*r;
  tst = norm(r);
  terminate = errtol*norm(b);
  error = [error,tst];
  it = 1;

  while ((tst > terminate) & (it <= maxiters))

    if ( it == 1 ) 
	p = z;
    else
	beta = rho/rhoold;
	p = z + beta*p;
    end

    w = feval(atv, p);
    alpha = p'*w;
%
% Test here to make sure the linear transformation is positive definite.
% A non-positive value of alpha is a very bad sign.
%
    if ( alpha <= 0.0 )
      [alpha, rho, it]
      error(' negative curvature ') 
    end

    alpha = rho/alpha;
    x = x+alpha*p;

    if ( nargout == 4 )
      it_hist = [it_hist, x]; 
    end

    r = r - alpha*w;
    tst = norm(r);
    rhoold = rho;

    if ( nargin == 4 )
      z = r;
    else
      z = feval(pcv, r);
    end

    rho = z'*r;
    it = it+1;
    error = [error,tst];
    total_iters = it - 1;

  end

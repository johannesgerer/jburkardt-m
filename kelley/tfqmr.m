function [ x, error, total_iters ] = tfqmr ( x0, b, atv, params )

% TFQMR solver for linear systems
%
% C. T. Kelley, December 28, 1994
%
% function [x, error, total_iters]
%                    = tfqmr(x0, b, atv, params)
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
%
%               b=right hand side
%
%               atv, a matrix-vector product routine
%			atv must return Ax when x is input
%			the format for atv is
%                       function ax = atv(x)
%
%               params = two dimensional vector to control iteration
%                        params(1) = relative residual reduction factor
%                        params(2) = max number of iterations
%
% Output:       x=solution
%               error = vector of iteration residual norms
%               total_iters = number of iterations
%
% 
%

%
% initialization
%
  n = length ( b );
  errtol = params(1) * norm ( b );
  kmax  = params(2);
  error = [];
  x = x0;

  if ( norm ( x ) ~= 0.0 )
    r = b - feval ( atv, x );
  else
    r = b;
  end

  error = [];

  u = zeros(n,2);
  y = zeros(n,2);
  w = r;
  y(:,1) = r; 
  k = 0;
  d = zeros(n,1);
  v = feval ( atv, y(:,1) );
  u(:,1) = v;
  theta = 0.0;
  eta = 0.0;
  tau = norm ( r );
  error = [ error, tau ];
  rho = tau * tau;
%
%  TFQMR iteration
%
  while ( k < kmax )

    k = k + 1;
    sigma = r' * v; 

    if ( sigma == 0.0 )
      error ( 'TFQMR breakdown, sigma=0' )
    end

    alpha = rho / sigma;

    for j = 1 : 2
%
%   Compute y2 and u2 only if you have to
%
      if ( j == 2 )
        y(:,2) = y(:,1) - alpha * v;
        u(:,2) = feval ( atv, y(:,2) );
      end

      m = 2 * k - 2 + j;
      w = w - alpha * u(:,j);
      d = y(:,j) + ( theta * theta * eta / alpha ) * d;
      theta = norm ( w ) / tau;
      c = 1.0 / sqrt ( 1.0 + theta * theta );
      tau = tau * theta * c;
      eta = c * c * alpha;
      x = x + eta * d;
%
%  Try to terminate the iteration at each pass through the loop
%
      if ( tau * sqrt ( m + 1 ) <= errtol )
        error = [ error, tau ];
        total_iters = k;
        return
      end

    end

    if ( rho == 0.0 )
      error ( 'TFQMR breakdown, rho=0' )
    end

    rhon = r' * w; 
    beta = rhon / rho;
    rho = rhon;
    y(:,1) = w + beta * y(:,2);
    u(:,1) = feval ( atv, y(:,1) );
    v = u(:,1) + beta * ( u(:,2) + beta * v );
    error = [ error, tau ];
    total_iters = k;
  end

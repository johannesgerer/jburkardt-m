function [ x, error, total_iters ] = bicgstab ( x0, b, atv, params )

% Bi-CGSTAB solver for linear systems
%
% C. T. Kelley, December 16, 1994
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
%
% Output:       x=solution
%               error = vector of iteration residual norms
%               total_iters = number of iterations
%

%
% initialization
%
  n = length(b);
  errtol = params(1)*norm(b);
  kmax = params(2);
  error = [];
  x = x0;
  rho = zeros(kmax+1,1);

  if ( norm ( x ) ~= 0.0 )
    r = b - feval ( atv, x );
  else
    r = b;
  end

  error = [];

  hatr0 = r;
  k = 0;
  rho(1) = 1;
  alpha = 1;
  omega = 1;
  v = zeros ( n, 1 );
  p = zeros ( n, 1 );
  rho(2) = hatr0' * r;
  zeta = norm ( r );
  error = [ error, zeta ];
%
%  Bi-CGSTAB iteration
%
  while ( (zeta > errtol) & (k < kmax) )

    k = k + 1;

    if ( omega == 0.0 )
      error('Bi-CGSTAB breakdown, omega=0');
    end

    beta = ( rho(k+1) / rho(k) ) * ( alpha / omega );
    p = r + beta * ( p - omega * v );
    v = feval ( atv, p );
    tau = hatr0' * v;

    if ( tau == 0.0 )
      error('Bi-CGSTAB breakdown, tau=0');
    end 

    alpha = rho(k+1) / tau;
    s = r - alpha * v; 
    t = feval ( atv, s );
    tau = t' * t;

    if ( tau == 0.0 )
      error('Bi-CGSTAB breakdown, t=0');
    end

    omega = t' * s / tau; 
    rho(k+2) = -omega * ( hatr0' * t);
    x = x + alpha * p + omega * s;
    r = s - omega * t;
    zeta = norm ( r );
    total_iters = k;
    error = [ error, zeta ];

  end

function milstrong ( seed )

%*****************************************************************************80
%
%% MILSTRONG tests the strong convergence of the Milstein method.
%
%  Discussion:
%
%    This function solves the stochastic differential equation
%
%      dX = sigma * X * ( k - X ) dt + beta * X dW,  
%      X(0) = Xzero,
%
%    where 
%
%       sigma = 2, 
%       k = 1, 
%       beta = 1,
%       Xzero = 0.5.
%
%    The discretized Brownian path over [0,1] has dt = 2^(-11).
%
%    The Milstein method uses timesteps 128*dt, 64*dt, 32*dt, 16*dt 
%    (also dt for reference).
%
%    We examine strong convergence at T=1:  
%
%      E | X_L - X(T) |.
%
%    The code is vectorized: all paths computed simultaneously.
%
%  Modified:
%
%    18 September 2012
%
%  Author:
%
%    Desmond Higham
%
%  Reference:
%
%    Desmond Higham,
%    An Algorithmic Introduction to Numerical Simulation of
%    Stochastic Differential Equations,
%    SIAM Review,
%    Volume 43, Number 3, September 2001, pages 525-546.
%
%  Parameters:
%
%    Input, integer SEED, a seed for the random number generator.
%
  if ( nargin < 1 )
    seed = 123456789;
    fprintf ( 1, '  Using default value of SEED = %d\n', seed );
  end
%
%  Initialize the random number generator.
%
  rng ( seed )
%
%  Set problem parameters;
%
  sigma = 2.0;
  k = 1.0;
  beta = 0.25;
  xzero = 0.5;
%
%  Set stepping parameters;
%
  tmax = 1.0;
  n = 2^(11);
  dt = tmax / n;
%
%  Number of paths sampled.
%
  m = 500;
%
%  R is used to derive the Milstein step size R*dt.
%
  r = [ 1; 16; 32; 64; 128 ];
%
%  Set the Brownian increments.
%
  dw = sqrt ( dt ) * randn ( m, n ) ;
%
%  For each stepsize, compute the Milstein estimate at T = 1.
%
  xmil = zeros(m,5);

  for p = 1 : 5                               

    dtp = r(p) * dt;
    l = n / r(p);
    xtemp = xzero * ones ( m, 1 );

    for j = 1 : l
      winc = sum ( dw(:,r(p)*(j-1)+1:r(p)*j), 2 );
      xtemp = xtemp + dtp * sigma * xtemp .* ( k - xtemp ) ...
        + beta * xtemp .* winc ...
        + 0.5 * beta^2 * xtemp .* ( winc.^2 - dtp );
    end

    xmil(:,p) = xtemp;

  end
%
%  XREF is the reference solution with the full time step.
%
  xref = xmil(:,1);
%
%  XERR is the difference between the reference solution and each path
%  with larger step.
%
  xerr = abs ( xmil(:,2:5) - repmat ( xref, 1, 4 ) );
%
%  Least squares fit of error = C * dt^q
%
  dtvals = dt * r(2:5);
  A = [ ones(4,1), ( log ( dtvals ) ) ];
  rhs = log ( mean ( xerr )' );
  sol = A \ rhs;
  q = sol ( 2 );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MILSTRONG:\n' );
  fprintf ( 1, '  Least squares solution to Error = c * dt ^ q\n' );
  fprintf ( 1, '  Expecting a value near 0.5\n' );
  fprintf ( 1, '  q = %g\n', q );
  resid = norm ( A * sol - rhs );
  fprintf ( 1, '  Residual is %g\n', resid );
%
%  Plotting.
%  Include a reference slope of 1.
%
  loglog ( dtvals, mean ( xerr ), 'b*-' )
  hold on
  loglog ( dtvals, dtvals, 'r--' )
  hold off
  axis ( [1e-3 1e-1 1e-4 1] )
  xlabel ( '\Delta t' )
  ylabel ( 'Sample average of | X(T) - X_L |' )
  title ( 'Strong convergence of Milstein', 'FontSize', 10 )
  grid on

  filename = 'milstrong.png';
  print ( '-dpng', filename )
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Plot saved as "%s".\n', filename );

  return
end

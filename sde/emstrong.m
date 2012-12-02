function emstrong ( seed )

%*****************************************************************************80
%
%% EMSTRONG tests the strong convergence of the EM method.
%
%  Discussion:
%
%    The SDE is 
%
%      dX = lambda * X dt + mu * X dW,   
%      X(0) = Xzero,
%
%    where 
%
%      lambda = 2,
%      mu = 1,
%      Xzero = 1.
%
%    The discretized Brownian path over [0,1] has dt = 2^(-9).
%
%    The Euler-Maruyama method uses 5 different timesteps: 
%      16*dt, 8*dt, 4*dt, 2*dt, dt.
%
%    We are interested in examining strong convergence at T=1,
%    that is
%
%      E | X_L - X(T) |.
%
%  Modified:
%
%    16 September 2012
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
%  Set problem parameters.
%
  lambda = 2.0; 
  mu = 1.0; 
  xzero = 1.0;
%
%  Set stepping parameters.
%
  tmax = 1.0;
  n = 2 ^ 9; 
  dt = tmax / n;
%
%  Set the number of paths sampled.
%
  m = 1000;
%
%  Preallocate arrays.
%
  xerr = zeros(m,5);
%
%  Sample over discrete Brownian paths.
%
  for s = 1 : m
%
%  Compute the Brownian increments.
%
    dw = sqrt ( dt ) * randn(1,n);
%
%  Sum the increments to get the Brownian path.
%
    w = cumsum ( dw );
%
%  Determine the true solution.
%
    xtrue = xzero * exp ( ( lambda - 0.5 * mu^2 ) + mu * w(end) );
%
%  Use the Euler-Maruyama method with 5 different time steps dt2 = r * dt;
%
    for p = 1 : 5                            
      r = 2 ^ ( p - 1 );
      dt2 = r * dt;
      l = n / r;
      xtemp = xzero;
      for j = 1 : l
        winc = sum ( dw(r*(j-1)+1:r*j) );
        xtemp = xtemp + dt2 * lambda * xtemp + mu * xtemp * winc;
      end
      xerr(s,p) = abs ( xtemp - xtrue );
    end

  end

  dtvals = dt * ( 2 .^ ( [0:4] ) );
%
%  Least squares fit of error = c * dt^q.
%
  A = [ ones(5,1), ( log ( dtvals ) )' ];
  rhs = log ( mean ( xerr )' );
  sol = A \ rhs; 
  q = sol(2);
  fprintf ( 1, '\n' );
  fprintf ( 1, 'EMSTRONG:\n' );
  fprintf ( 1, '  Least squares solution to Error = c * dt ^ q\n' );
  fprintf ( 1, '  Expecting a value near 0.5\n' );
  fprintf ( 1, '  q = %g\n', q );
  resid = norm ( A * sol - rhs );
  fprintf ( 1, '  Residual is %g\n', resid );
%
%  Plot.
%  Include a reference slope of 1/2.
%
  loglog ( dtvals, mean ( xerr ), 'b*-', 'Linewidth', 2 ) 
  hold on
  loglog ( dtvals, (dtvals.^(.5)), 'r--', 'Linewidth', 2 )
  hold off
  axis ( [ 1e-3 1e-1 1e-4 1 ] )
  xlabel ( '\Delta t' )
  ylabel ( 'Sample average of | X(T) - X_L |' )
  title ( 'Euler-Maruyama error with various stepsizes','FontSize', 10 )
  grid on

  filename = 'emstrong.png';
  print ( '-dpng', filename )
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Plot saved as "%s"\n', filename );

  return
end

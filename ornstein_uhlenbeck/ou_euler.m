function ou_euler ( theta, mu, sigma, x0, tmax, n, seed )

%*****************************************************************************80
%
%% OU_EULER applies the Euler method to the Ornstein-Uhlenbeck SDE.
%
%  Discussion:
%
%    The stochastic differential equation (SDE) is:
%
%      dx(t) = theta * ( mu - x(t) ) dt + sigma dW,   
%      x(0) = x0.
%
%    The discretized Brownian path uses a constant stepsize.
%
%    For an SDE of the form:
%
%      dx = f(x(t)) dt + g(x(t)) dW(t),
%
%    the Euler method has the form:
%
%      x(j) = x(j-1) + f(x(j-1)) * dt + g(x(j-1)) * dW(j-1)
%
%    Note that if SIGMA is zero, the problem becomes deterministic,
%    with solution:
%
%      x(t) = mu + ( x0 - mu ) * exp ( - theta * t )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 January 2013
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Desmond Higham,
%    An Algorithmic Introduction to Numerical Simulation of
%    Stochastic Differential Equations,
%    SIAM Review,
%    Volume 43, Number 3, September 2001, pages 525-546
%
%  Parameters:
%
%    Input, real THETA, MU, SIGMA, the value of problem parameters.
%
%    Input, real X0, the initial condition.  When studying many
%    realizations of this problem, it is usual for X0 to be chosen
%    from a normal distribution.
%
%    Input, real TMAX, the final time.
%
%    Input, integer N, the number of time steps.
%
%    Input, integer SEED, a seed for the random number generator.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'OU_EULER:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Use an Euler method to approximate the solution of\n' );
  fprintf ( 1, '  the Ornstein-Uhlenbeck stochastic differential equation:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    d x(t) = theta * ( mu - x(t) ) dt + sigma dW\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  with initial condition x(0) = x0.\n' );

  if ( nargin < 1 )
    theta = 2.0;
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Using default decay rate THETA = %g\n', theta );
  end

  if ( nargin < 2 )
    mu = 1.0;
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Using default mean MU = %g\n', mu );
  end

  if ( nargin < 3 )
    sigma = 0.15;
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Using default variance SIGMA = %g\n', sigma );
  end

  if ( nargin < 4 )
    x0 = 2.0;
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Using default initial value X0 = %g\n', x0 );
  end

  if ( nargin < 5 )
    tmax = 3.0;
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Using default final time TMAX = %g\n', tmax );
  end 

  if ( nargin < 6 )
    n = 10000;
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Using default number of timesteps N = %d\n', n );
  end

  if ( nargin < 7 )
    seed = 123456789;
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Using default value of random SEED = %d\n', seed );
  end
%
%  Initialize the random number generator.
%  The following way to initialize the random number generator 
%  may not be available in older versions of MATLAB.
%
  rng ( seed )
%
%  Set the discrete time stepsize.
%
  dt = tmax / n;
%
%  Compute the Brownian increments.
%
  dw = sqrt ( dt ) * randn ( 1, n );
%
%  Carry out the Euler approximate integration process.
%
  t = linspace ( 0, tmax, n + 1 );
  x = zeros ( 1, n + 1 );

  x(1) = x0;
  for j = 1 : n
    x(j+1) = x(j) + dt * theta * ( mu - x(j) ) + sigma * dw(j);
  end
%
%  Plot the approximate solution.
%
  plot ( t, x, 'r-', 'LineWidth', 3 )
  xlabel ( 't', 'FontSize', 16 )
  ylabel ( 'X(t)', 'FontSize', 16, 'Rotation', 0, 'HorizontalAlignment', 'right' )
  title ( 'Euler solution of Ornstein-Uhlenbeck SDE', 'FontSize', 16 )
  grid on

  filename = 'ou_euler.png';
  print ( '-dpng', filename )
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Plot saved as "%s"\n', filename );

  return
end

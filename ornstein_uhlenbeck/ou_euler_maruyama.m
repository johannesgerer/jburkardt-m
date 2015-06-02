function ou_euler_maruyama ( theta, mu, sigma, x0, tmax, n, r, seed )

%*****************************************************************************80
%
%% OU_EULER_MARUYAMA applies Euler-Maruyama to the Ornstein-Uhlenbeck SDE.
%
%  Discussion:
%
%    The stochastic differential equation (SDE) is:
%
%      dx = theta * ( mu - x(t) ) dt + sigma dW,   
%      x(0) = x0,
%
%    The discretized Brownian path uses a constant stepsize.
%
%    A "large" time step DT_LARGE is used for the smooth portion of the
%    equation, while a smaller time step DT_SMALL is used for the
%    discretized Brownian path.  We take R small steps to equal one 
%    large step, so that:
%
%      dt_large = r * dt_small = tmax / n
%
%    For an SDE of the form:
%
%      dx = f(x(t)) dt + g(x(t)) dW(t)
%
%    the Euler-Maruyama method has the form:
%
%      x(j) = x(j-1) + f(X(j-1)) * dt_large + g(X(j-1)) * dW(j-1)
%
%    where dW(j-1) is approximated by the sum of R normal random values
%    multiplied by the square root of DT_SMALL.
%
%    Note that if SIGMA is zero, the problem becomes deterministic,
%    with solution
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
%    Input, integer N, the number of large scale time steps.
%
%    Input, integer R, the number of small scale time steps per single
%    large scale time step.
%
%    Input, integer SEED, a seed for the random number generator.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'OU_EULER_MARUYAMA:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Use an Euler-Maruyama method to approximate the solution of\n' );
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
    fprintf ( 1, '  Using default number of large timesteps N = %d\n', n );
  end

  if ( nargin < 7 )
    r = 8;
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Using default ratio of small to large timesteps R = %d\n', r );
  end

  if ( nargin < 8 )
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
%  Set time steps.
%
  dt_large = tmax / n;
  dt_small = tmax / n / r;
%
%  Carry out the Euler-Maruyama approximate integration process.
%
  t = linspace ( 0, tmax, n + 1 );
  x = zeros ( 1, n + 1 );

  x(1) = x0;
  for j = 1 : n
    dw = sqrt ( dt_small ) * randn ( 1, r );
    x(j+1) = x(j) + dt_large * theta * ( mu - x(j) ) + sigma * sum ( dw(1:r) );
  end
%
%  Plot the approximate solution.
%
  plot ( t, x, 'r-', 'LineWidth', 3 )
  xlabel ( 't', 'FontSize', 16 )
  ylabel ( 'X(t)', 'FontSize', 16, 'Rotation', 0, 'HorizontalAlignment', 'right' )
  title ( 'Euler-Maruyama solution of Ornstein-Uhlenbeck SDE', 'FontSize', 16 )
  grid on

  filename = 'ou_euler_maruyama.png';
  print ( '-dpng', filename )
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Plot saved as "%s"\n', filename );

  return
end

function bpath_vectorized ( seed )

%*****************************************************************************80
%
%% BPATH_VECTORIZED performs a vectorized Brownian path simulation.
%
%  Discussion:
%
%    This routine computes one simulation of discretized Brownian 
%    motion over the time interval [0,1] using 500 time steps.
%    The user specifies a random number seed.  Different values of
%    the seed will result in different realizations of the path.
%
%    For the same input value of SEED, this routine should produce
%    the same values as BPATH1.  However, because of the use of
%    "vectorized" commands, it should be significantly faster.
%
%  Modified:
%
%    27 September 2006
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
%    Volume 43, Number 3, September 2001, pages 525-546
%
%  Parameters:
%
%    Input, integer SEED, a seed for the random number generator.
%    The default value is 123456789.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BPATH_VECTORIZED\n' );
  fprintf ( 1, '  Brownian path simulation\n' );
  if ( nargin < 1 )
    seed = 123456789;
    fprintf ( 1, '  Using default value of SEED = %d\n', seed );
  end
%
%  Initialize the random number generator.
%
  rng ( seed )

  tmax = 1.0; 
  n = 500; 
  dt = tmax / n;
%
%  Begin timing.
%
  tic
%
%  dW contains the increments.
%
  dw = sqrt ( dt ) * randn ( 1, n );
%
%  W(I) contains the cumulative sum of the increments 1 through I.
%
  w0 = 0.0;
  w = cumsum ( dw );
%
%  End timing.
%
  toc
%
%  Plot t, W(t).
%
  clf
  hold on
  plot ( [0:dt:tmax], [w0,w], 'LineWidth', 3, 'Color', 'b' )
  plot ( [0, tmax], [0.0, 0.0], 'LineWidth', 2, 'Color', 'k' )
  grid on
  title ( 'Brownian path realization computed by BPATH_VECTORIZED' );
  xlabel ( 't', 'FontSize', 16 )
  ylabel ( 'W(t)', 'FontSize', 16, 'Rotation', 0 );
  hold off

  filename = 'bpath_vectorized.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Plot saved as "%s"\n', filename );

  return
end

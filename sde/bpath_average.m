function bpath_average ( seed )

%*****************************************************************************80
%
%% BPATH_AVERAGE: displays the average of 1000 Brownian paths.
%
%  Discussion:
%
%    This routine computes 1000 simulations of discretized Brownian 
%    motion W(t) over the time interval [0,1] using 500 time steps.
%    The user specifies a random number seed.  Different values of
%    the seed will result in a different set of realizations of the path.
%
%    Actually, we are interested in a function u(W(t)):
%
%      u(W(t)) = exp ( t + W(t)/2 )
%
%    The routine plots 5 of the simulations, as well as the average
%    of all the simulations.  
%
%    The plot of the average should be quite smooth.  Its expected
%    value is exp ( 9 * t / 8 ), and we compute the 'error', that is,
%    the difference between the averaged value and this expected
%    value.  This 'error' should decrease as the number of simulation
%    is increased.
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
%    Volume 43, Number 3, September 2001, pages 525-546.
%
%  Parameters:
%
%    Input, integer SEED, a seed for the random number generator.
%

%
%  We will be computing M paths simultaneously.
%
  m = 1000;
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BPATH_AVERAGE\n' );
  fprintf ( 1, '  Average %d Brownian path simulations.\n', m );

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
  t = [ dt: dt: 1 ];
%
%  Begin timing.
%
  tic
%
%  Set the increments.
%
  dw = sqrt ( dt ) * randn ( m, n );
%
%  Sum the increments.
%
  w0 = 0.0;
  w = cumsum ( dw, 2 );

  u = exp ( repmat ( t, [m 1] ) + 0.5 * w );

  umean = mean ( u );
%
%  End timing.
%
  toc
%
%  Plot the mean of the M paths.
%
  plot ( [0,t], [1,umean], 'b-', 'Linewidth', 2 );
  hold on
%
%  Overlay the plots of the first 5 paths.
%
  plot ( [0,t], [ones(5,1), u(1:5,:)], 'r--' );
  grid on
  hold off

  xlabel ( 't', 'FontSize', 16 )
  ylabel ( 'U(t)', 'FontSize', 16, 'Rotation', 0, 'HorizontalAlignment', 'right' )
  legend ( 'mean of 1000 paths', '5 individual paths', 2 )
  title ( '1000 paths computed by BPATH_AVERAGE' )

  filename = 'bpath_average.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Plot saved as "%s"\n', filename );
%
%  Sample error:
%
  averr = norm ( ( umean - exp ( 9 * t / 8 ) ), 'inf' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Maximum error in averaged data is %f\n', averr );

  return
end

function base_run ( delta )

%*****************************************************************************80
%
%% BASE_RUN solves and plots the flame problem for delta = 0.01.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 February 2013
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Shirley Abelman, Kailash Patidar,
%    Comparison of some recent numerical methods for initial-value problems
%    for stiff ordinary differential equations,
%    Computers and Mathematics with Applications,
%    Volume 55, Number 4, 2008, pages 733-744.
%    
%    Cleve Moler,
%    Cleve's Corner: Stiff Differential Equations,
%    MATLAB News and Notes,
%    May 2003, pages 12-13.
%
%  Parameters:
%
%    Optional input, real DELTA, the initial size of the ball of flame.
%    The default value is 0.01.
%
  if ( nargin < 1 )
    delta = 0.01;
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'BASE_RUN\n' );
  fprintf ( 1, '  Solve and plot the flame ODE for delta = %g.\n', delta );
  fprintf ( 1, '\n' );
%
%  Get the starting point.
%
  t_start = 0.0;
  y_start(1,1) = delta;
%
%  Get the stopping point.
%
  t_stop = 250.0;
%
%  Call ODE45 to estimate the solution.
%
  t_span = [ t_start, t_stop ];

  [ t, y ] = ode45 ( @flame_fun, t_span, y_start );
%
%  Plot the solution curve.
%
  plot ( t, y(:,1), 'r-', 'Linewidth', 3 );

  title ( sprintf ( 'Shampine Flame, DELTA = %g', delta ), 'Fontsize', 24 );
  grid on
  xlabel ( '<--- T --->', 'Fontsize', 24 );
  ylabel ( '<--- X(T) --->', 'Fontsize', 24 );
%
%  Save a copy in a file.
%
  filename = 'base_run.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  A copy of the plot was saved as "%s"\n', filename );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BASE_RUN:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end

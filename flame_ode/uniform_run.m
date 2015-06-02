function uniform_run ( )

%*****************************************************************************80
%
%% UNIFORM_RUN varies the parameter DELTA in a log uniform way.
%
%  Discussion:
%
%    Our base value for DELTA_BASE is 0.01.
%
%    Our quantity of interest Q is the time at which the solution achieves
%    the value 0.99.
%
%    Our parameter U is uniformly distributed in [-1,+1], and determines
%    our actual value of DELTA by
%
%      DELTA = 2^U * DELTA_BASE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 February 2013
%
%  Author:
%
%    John Burkardt
%
  delta_base = 0.01;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'UNIFORM_RUN\n' );
  fprintf ( 1, '  Vary the value of delta using a log-uniformly\n' );
  fprintf ( 1, '  distributed factor between 1/2 and 2.\n' );
  fprintf ( 1, '  Our quantity of interest Q is the time at which the\n' );
  fprintf ( 1, '  solution reaches 0.99.\n' );
  fprintf ( 1, '  Plot the solution curves, and plot Delta versus Q\n' );
  fprintf ( 1, '\n' );
%
%  Set up an option to have ODE45 return when the solution reached 0.99.
%
  options = odeset ( 'EVENTS', @event_function );

  figure ( 1 )
  clf
  hold on

  for trial = 1 : 10
%
%  Uniformly select 
%    U, the logarithm base 2, between -1 and +1, of
%    F, a factor between 1/2 and 2, which multiplies 
%    DELTA_BASE, the base value, which gives us
%    DELTA, the initial size of the flame.
%
    u = 2 * rand ( 1, 1 ) - 1.0;
    f = 2^u;
    delta = f * delta_base;
    d_plot(trial) = delta;
    fprintf ( 1, '  U = %g, factor = %g, DELTA = %g\n', u, f, delta );
%
%  Set the starting point.
%
    t_start = 0.0;
    y_start(1,1) = delta;
%
%  Get the stopping point.
%
    t_stop = 250.0;
%
%  Call ODE45 to solve the problem, stopping immediately if the event 
%  (y=0.99) is observed.
%
    t_span = [ t_start, t_stop ];

    [ t, y ] = ode45 ( @flame_fun, t_span, y_start, options );
    fprintf ( '  Y(T) = 0.99 at T = %g\n', t(end) );
    q_plot(trial) = t(end);

    c = [ trial, 0, 11 - trial ] / 10;

    plot ( t, y(:,1), 'b-', 'Linewidth', 3, 'Color', c );

  end

  title ( 'Shampine Flame, Multiple values of DELTA', 'Fontsize', 24 );
  grid on
  xlabel ( '<--- T --->', 'Fontsize', 24 );
  ylabel ( '<--- X(T) --->', 'Fontsize', 24 );

  hold off

  filename = 'uniform_run.png';
  print ( '-dpng', filename );
  fprintf ( 1, '  Multiple solutions plotted in file "%s".\n', filename );
%
%  Since our deltas were computed randomly, they aren't in order.
%  We need to sort them, and their corresponding function values,
%  before plotting.
%
  [ d_plot, i ] = sort ( d_plot );
  q_plot = q_plot(i);
%
%  Plot the observed values of delta versus F, the time at
%  which the solution reached 0.99.
%
  figure ( 2 )
  plot ( d_plot, q_plot, 'r.-', 'Linewidth', 3, 'Markersize', 25 );
  grid on
  xlabel ( '<-- Parameter Delta -->', 'Fontsize', 24 )
  ylabel ( '<-- Ignition time Q(Delta) -->', 'Fontsize', 24 )
  title ( 'Ignition time as a function of parameter Delta', 'Fontsize', 24 )

  filename = 'uniform_qoi.png';
  print ( '-dpng', filename );
  fprintf ( 1, '  Quantity of Interest plotted in file "%s".\n', filename );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'UNIFORM_RUN\n' );
  fprintf ( 1, '  Normal end of execution\n' );

  return
end

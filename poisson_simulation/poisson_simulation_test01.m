function poisson_simulation_test01 ( )

%*****************************************************************************80
%
%% POISSON_SIMULATION_TEST01 simulates waiting for a given number of events.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 February 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'POISSON_SIMULATION_TEST01:\n' );
  fprintf ( 1, '  POISSON_FIXED_EVENTS simulates a Poisson process\n' );
  fprintf ( 1, '  until a given number of events have occurred.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Simulate a Poisson process, for which, on average,\n' );
  fprintf ( 1, '  LAMBDA events occur per unit time.\n' );
  fprintf ( 1, '  Run until you have observed EVENT_NUM events.\n' );
 
  lambda = 0.5;
  event_num = 1000;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  LAMBDA = %g\n', lambda );
  fprintf ( 1, '  EVENT_NUM = %d\n', event_num );

  [ t, w ] = poisson_fixed_events ( lambda, event_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Minimum wait = %g\n', min ( w(2:event_num+1) ) );
  fprintf ( 1, '  Average wait = %g\n', sum ( w(2:event_num+1) ) / event_num );
  fprintf ( 1, '  Maximum wait = %g\n', max ( w(2:event_num+1) ) );

  fprintf ( 1, '\n' );
  fprintf ( 1, ' Count            Time            Wait\n' );
  fprintf ( 1, '\n' );
  for i = 1 : 6
    fprintf ( 1, '  %4d  %14g  %14g\n', i - 1, t(i), w(i) )
  end
  fprintf ( 1, '  ....  ..............  ..............\n' );
  for i = event_num - 4 : event_num + 1
    fprintf ( 1, '  %4d  %14g  %14g\n', i - 1, t(i), w(i) )
  end

  figure ( 1 )
  plot ( t, 1 : event_num + 1, 'Linewidth', 2 );
  xlabel ( '<--Time-->' )
  ylabel ( '<--Events observed-->' )
  grid on
  title ( sprintf ( 'Observation of %d successive Poisson events', event_num ) );

  filename = 'poisson_timeline.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Plot file saved as "%s"\n', filename );

  bins = 40;
  figure ( 2 )
  hist ( w, bins );
  xlabel ( '<--Waiting time-->' )
  ylabel ( '<--Frequency-->' )
  grid on
  title ( 'Frequency histogram of Poisson waiting times' );

  filename = 'poisson_times.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Plot file saved as "%s"\n', filename );

  return
end

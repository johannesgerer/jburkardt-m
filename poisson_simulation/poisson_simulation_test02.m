function poisson_simulation_test02 ( )

%*****************************************************************************80
%
%% POISSON_SIMULATION_TEST02 simulates waiting for a given length of time.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 September 2012
%
%  Author:
%
%    John Burkardt
%
  lambda = 0.5;
  t = 1000.0;
  test_num = 20000;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'POISSON_SIMULATION_TEST02:\n' );
  fprintf ( 1, '  POISSON_FIXED_EVENTS simulates a Poisson process\n' );
  fprintf ( 1, '  counting the number of events that occur during\n' );
  fprintf ( 1, '  a given time.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Simulate a Poisson process, for which, on average,\n' );
  fprintf ( 1, '  LAMBDA events occur per unit time.\n' );
  fprintf ( 1, '  Run for a total of %g time units.\n', t );
  fprintf ( 1, '  LAMBDA = %g\n', lambda );

  n = zeros ( test_num, 1 );
  for test = 1 : test_num
    n(test) = poisson_fixed_time ( lambda, t );
  end

  n_mean = mean ( n );
  n_var = var ( n );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Mean number of events = %g\n', n_mean );
  fprintf ( 1, '  Variance = %g,  STD = %g\n', n_var, sqrt ( n_var ) );

  bins = 30;
  hist ( n, bins );
  xlabel ( '<--Number of events-->' )
  ylabel ( '<--Frequency-->' )
  grid on
  title ( ' Number of Poisson events observed over 1000 time units' );

  filename = 'poisson_events.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Plot file saved as "%s"\n', filename );

  return
end

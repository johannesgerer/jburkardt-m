function test_tri_int_test02 ( )

%*****************************************************************************80
%
%% TEST02 tests P00_MONTE_CARLO.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 April 2007
%
%  Author:
%
%    John Burkardt
%
  exact = 1.0;
  n_log_max = 15;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST02\n' );
  fprintf ( 1, '  P00_MONTE_CARLO applies a Monte Carlo rule.\n' );

  prob_num = get_prob_num ( 'DUMMY' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Problem            Exact         Seed\n' );
  fprintf ( 1, '           Pts       Approx        Error\n' );
  fprintf ( 1, '\n' );
%
%  Pick a problem.
%
  for problem = 1 : prob_num

    title = p00_title ( problem );

    seed = 123456789;
%
%  In case we are using MATLAB's random number generator, initialize it.
%
    seed = random_initialize ( seed );

    fprintf ( 1, '\n' );
    fprintf ( 1, '%s\n', title );
    fprintf ( 1, '%8d        %12f  %12d\n', problem, exact, seed );
    fprintf ( 1, '\n' );
%
%  Pick a number of points.
%
    for n_log = 0 : n_log_max

      n = 2^n_log;

      [ result, seed ] = p00_monte_carlo ( problem, n, seed );

      abs_error = abs ( exact - result );

      fprintf ( 1, '      %8d  %12f  %12f\n', n, result, abs_error );

    end

  end

  return
end

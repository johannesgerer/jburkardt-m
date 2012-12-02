function test_tri_int_test04 ( )

%*****************************************************************************80
%
%% TEST04 tests P00_WANDZURA05_SUB.
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
  test_max = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST04\n' );
  fprintf ( 1, '  P00_WANDZURA05_SUB applies a Wandzura rule with subdivision.\n' );

  prob_num = get_prob_num ( 'DUMMY' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Problem            Exact\n' );
  fprintf ( 1, '           Pts       Approx        Error\n' );
  fprintf ( 1, '\n' );
%
%  Pick a problem.
%
  for problem = 1 : prob_num

    title = p00_title ( problem );

    fprintf ( 1, '\n' );
    fprintf ( 1, '%s\n', title );
    fprintf ( 1, '%8d        %12f\n', problem, exact );
    fprintf ( 1, '\n' );
%
%  Pick a number of points.
%
    for test = 0 : test_max

      level = 2^test;

      [ result, n ] = p00_wandzura05_sub ( problem, level );

      abs_error = abs ( exact - result );

      fprintf ( 1, '      %8d  %12f  %12f\n', n, result, abs_error );

      if ( abs_error < 1.0E-06 )
        fprintf ( 1, '                            Accuracy acceptable\n' );
        break
      end

    end

  end

  return
end

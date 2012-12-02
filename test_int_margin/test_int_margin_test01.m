function test_int_margin_test01 ( )

%*****************************************************************************80
%
%% TEST_INT_MARGIN_TEST01 plots the functions.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 January 2012
%
%  Author:
%
%    John Burkardt
%
  problem_num = p00_problem_num ( );
  margin = 1.0;
  num = 101;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_INT_MARGIN_TEST01:\n' );
  fprintf ( 1, '  Plot the functions.\n' );
  fprintf ( 1, '  MARGIN value = %f\n', margin );
  fprintf ( 1, '\n' );

  filename = 'p00_plot.png';

  for problem = 1 : problem_num

    a = 0.0;
    b = 1.0;

    x = linspace ( a, b, num );
    f = p00_f ( problem, num, x );

    clf
    hold on
    plot ( [ a, b ], [ margin, margin ], 'b-', 'LineWidth', 2 );
    plot ( x, f, 'r-', 'LineWidth', 2 );
    xlabel ( '<---X--->' );
    ylabel ( '<---Y--->' );
    grid on
    title ( sprintf ( 'F(X) for problem %d\n', problem ) );
    hold off

    filename = file_name_inc ( filename );
    print ( '-dpng', filename );
    fprintf ( 1, '  Created plotfile "%s".\n', filename );

  end

  close

  return
end

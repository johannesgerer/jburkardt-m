function test_ode_test03 ( )

%*****************************************************************************80
%
%% TEST03 solves most of the problems using a Runge-Kutta method.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 March 2006
%
%  Author:
%
%    John Burkardt
%
  step_num = 500;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST03\n' );
  fprintf ( 1, '  Solve problems using a Runge-Kutta method.\n' );
  fprintf ( 1, '  The number of steps taken is %d\n', step_num );

  test_num = p00_test_num ( );

  fprintf ( 1, '  The number of tests available %d\n', test_num );
%
%  Solve each problem.
%
  order = 3;

  for test = 1 : test_num

    rk_test ( test, step_num, order );

  end

  return
end

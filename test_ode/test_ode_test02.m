function test_ode_test02 ( )

%*****************************************************************************80
%
%% TEST02 solves most of the problems using an Euler method.
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
  fprintf ( 1, 'TEST02\n' );
  fprintf ( 1, '  Solve problems using an Euler method.\n' );
  fprintf ( 1, '  The number of steps taken is %d\n', step_num );
  
  test_num = p00_test_num ( );

  fprintf ( 1, '  The number of tests available %d\n', test_num );
%
%  Solve each problem.
%
  for test = 1 : test_num

    if ( test == 28 | test == 36 | test == 37 )

    else
      euler_test ( test, step_num );
    end

  end

  return
end

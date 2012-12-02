function test_ode_test ( )

%*****************************************************************************80
%
%% TEST_ODE_TEST tests TEST_ODE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 March 2006
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_ODE_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the TEST_ODE library.\n' );

  test_ode_test01 ( );
  test_ode_test02 ( );
  test_ode_test03 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_ODE_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

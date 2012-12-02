function test_approx_test ( )

%*****************************************************************************80
%
%% TEST_APPROX_TEST tests TEST_APPROX.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 February 2012
%
%  Author:
%
%    John Burkardt
%
  addpath ( '../spline' )

  timestamp (  );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_APPROX_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the TEST_APPROX library.\n' );

  test_approx_test01 ( );
  test_approx_test02 ( );
  test_approx_test03 ( );
  test_approx_test04 ( );
  test_approx_test05 ( );
  test_approx_test06 ( );
  test_approx_test07 ( );
  test_approx_test08 ( );
  test_approx_test09 ( );

  test_approx_test10 ( );
  test_approx_test11 ( );
  test_approx_test12 ( );
  test_approx_test13 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_APPROX_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  rmpath ( '../spline' )

  return
end

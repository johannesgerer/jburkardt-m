function test_optimization_test ( )

%*****************************************************************************80
%
%% TEST_OPTIMIZATION_TEST tests the TEST_OPTIMIZATION library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    19 December 2011
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_OPTIMIZATION_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the TEST_OPTIMIZATION library.\n' );

  test_optimization_test01 ( );
  test_optimization_test02 ( );
  test_optimization_test03 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_OPTIMIZATION_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

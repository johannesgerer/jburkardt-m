function test_matrix_exponential_test ( )

%*****************************************************************************80
%
%% TEST_MATRIX_EXPONENTIAL_TEST tests the TEST_MATRIX_EXPONENTIAL library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 March 2013
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_MATRIX_EXPONENTIAL_TEST:\n'  );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the TEST_MATRIX_EXPONENTIAL library.\n' );

  test_matrix_exponential_test01 ( );
  test_matrix_exponential_test02 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_MATRIX_EXPONENTIAL_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

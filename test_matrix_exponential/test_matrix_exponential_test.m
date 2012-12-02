function test_matrix_exponential_test ( )

%*****************************************************************************80
%
%% TEST_MATRIX_EXPONENTIAL_TEST tests some matrix exponential algorithms.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 October 2012
%
%  Author:
%
%    John Burkardt
%
  addpath ( '../r8lib' )

  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_MATRIX_EXPONENTIAL_TEST:\n'  );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the TEST_MATRIX_EXPONENTIAL library.\n' );
  fprintf ( 1, '  The R8LIB library is needed.\n' );

  test_matrix_exponential_test01 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_MATRIX_EXPONENTIAL_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  rmpath ( '../r8lib' )

  return
end

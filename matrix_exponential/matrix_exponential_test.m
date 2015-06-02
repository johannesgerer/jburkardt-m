function matrix_exponential_test ( )

%*****************************************************************************80
%
%% MATRIX_EXPONENTIAL_TEST tests the MATRIX_EXPONENTIAL library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 March 2013
%
%  Author:
%
%    John Burkardt
%
  addpath ( '../c8lib' )
  addpath ( '../r8lib' )
  addpath ( '../test_matrix_exponential' )

  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MATRIX_EXPONENTIAL_TEST:\n'  );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the MATRIX_EXPONENTIAL library.\n' );
  fprintf ( 1, '  The R8LIB library is needed.\n' );
  fprintf ( 1, '  The test needs the TEST_MATRIX_EXPONENTIAL library.\n' );

  matrix_exponential_test01 ( );
  matrix_exponential_test02 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MATRIX_EXPONENTIAL_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  rmpath ( '../c8lib' )
  rmpath ( '../r8lib' )
  rmpath ( '../test_matrix_exponential' )

  return
end

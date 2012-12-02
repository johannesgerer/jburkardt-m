function test_interp_2d_test ( )

%*****************************************************************************80
%
%% TEST_INTERP_2D_TEST tests the TEST_INTERP_2D library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 October 2012
%
%  Author:
%
%    John Burkardt
%
  addpath ( '../r8lib' );

  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_INTERP_2D_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the TEST_INTERP_2D library.\n' );
  fprintf ( 1, '  The test requires access to the R8LIB library.\n' );

  test_interp_2d_test01 ( );
  test_interp_2d_test02 ( );
  test_interp_2d_test03 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_INTERP_2D_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  rmpath ( '../r8lib' )

  return;
end

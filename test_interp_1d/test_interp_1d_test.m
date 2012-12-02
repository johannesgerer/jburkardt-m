function test_interp_1d_test ( )

%*****************************************************************************80
%
%% TEST_INTERP_1D_TEST tests the TEST_INTERP_1D library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 October 2012
%
%  Author:
%
%    John Burkardt
%
  addpath ( '../r8lib' );

  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_INTERP_1D_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the TEST_INTERP_1D library.\n' );
  fprintf ( 1, '  The R8LIB library is needed.\n' );

  test_interp_1d_test01 ( );

  nd = 11;
  test_interp_1d_test02 ( nd );

  test_interp_1d_test03 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_INTERP_1D_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  rmpath ( '../r8lib' )

  return;
end

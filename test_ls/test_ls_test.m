function test_ls_test ( )

%*****************************************************************************80
%
%% TEST_LS_TEST tests the TEST_LS library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 October 2012
%
%  Author:
%
%    John Burkardt
%
  addpath ( '../r8lib' );

  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_LS_TEST\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the TEST_LS library.\n' );
  fprintf ( 1, '  This test also requires the R8LIB library.\n' );

  test_ls_test00 ( );
  test_ls_test01 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_LS_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  rmpath ( '../r8lib' );

  return
end




function test_nint_test ( )

%*****************************************************************************80
%
%% TEST_NINT_TEST tests the TEST_NINT library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 March 2007
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_NINT_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the TEST_NINT library.\n' );

  test_nint_test01 ( );
  test_nint_test02 ( );
  test_nint_test03 ( );
  test_nint_test04 ( );
  test_nint_test05 ( );
  test_nint_test06 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_NINT_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

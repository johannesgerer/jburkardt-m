function test_int_laguerre_test ( )

%*****************************************************************************80
%
%% MAIN is the main program for TEST_INT_LAGUERRE_PRB.
%
%  Discussion:
%
%    TEST_INT_LAGUERRE_PRB demonstrates the use of the TEST_INT_LAGUERRE
%    integration test functions.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 September 2008
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_INT_LAGUERRE_PRB\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the TEST_INT_LAGUERRE library.\n' );

  test_int_laguerre_test01 ( );
  test_int_laguerre_test02 ( );
  test_int_laguerre_test03 ( );
  test_int_laguerre_test04 ( );
  test_int_laguerre_test05 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_INT_LAGUERRE_PRB\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

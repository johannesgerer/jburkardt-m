function test_int_2d_test ( )

%*****************************************************************************80
%
%% MAIN is the main program for TEST_INT_2D_TEST.
%
%  Discussion:
%
%    TEST_INT_2D_TEST demonstrates the TEST_INT_2D integration test functions.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 September 2011
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_INT_2D_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the TEST_INT_2D library.\n' );

  test_int_2d_test01 ( );
  test_int_2d_test02 ( );
  test_int_2d_test03 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_INT_2D_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

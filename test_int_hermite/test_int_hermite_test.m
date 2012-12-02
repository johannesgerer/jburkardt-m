function test_int_hermite_test ( )

%*****************************************************************************80
%
%% MAIN is the main program for TEST_INT_HERMITE_PRB.
%
%  Discussion:
%
%    TEST_INT_HERMITE_PRB demonstrates the use of the TEST_INT_HERMITE
%    integration test functions.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 May 2010
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_INT_HERMITE_PRB\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the TEST_INT_HERMITE library.\n' );

  test_int_hermite_test01 ( );
  test_int_hermite_test02 ( );
  test_int_hermite_test03 ( );
  test_int_hermite_test04 ( );
  test_int_hermite_test05 ( );
  test_int_hermite_test06 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_INT_HERMITE_PRB\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

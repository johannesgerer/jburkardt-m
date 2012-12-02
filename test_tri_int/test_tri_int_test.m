function test_tri_int_test ( )

%*****************************************************************************80
%
%% MAIN is the main program for TEST_TRI_INT_PRB.
%
%  Discussion:
%
%    TEST_TRI_INT_PRB demonstrates the use of the TEST_TRI_INT
%    integration test functions.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 April 2007
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_TRI_INT_PRB\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the TEST_TRI_INT library.\n' );

  test_tri_int_test01 ( );
  test_tri_int_test02 ( );
  test_tri_int_test03 ( );
  test_tri_int_test04 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_TRI_INT_PRB\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

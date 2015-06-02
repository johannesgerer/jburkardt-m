function test_int_test ( )

%*****************************************************************************80
%
%% TEST_INT_TEST tests the TEST_INT library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    12 November 2009
%
%  Author:
%
%    John Burkardt
%
  timestamp ( )
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_INT_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the TEST_INT library.\n' );

  test_int_test01 ( )
  test_int_test02 ( )
  test_int_test03 ( )
  test_int_test04 ( )
  test_int_test05 ( )
  test_int_test06 ( )
  test_int_test07 ( )
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_INT_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( )

  return
end

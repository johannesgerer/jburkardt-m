function test_min_test ( )

%*****************************************************************************80
%
%% TEST_MIN_TEST tests the TEST_MIN library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    09 February 2009
%
%  Author:
%
%    John Burkardt
%
  timestamp (  );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_MIN_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the TEST_MIN library.\n' );

  test_min_test01 ( );
  test_min_test02 ( );
  test_min_test03 ( );
  test_min_test04 ( );
  test_min_test05 ( );
  test_min_test06 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_MIN_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

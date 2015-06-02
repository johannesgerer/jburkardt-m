function test_opt_test ( )

%*****************************************************************************80
%
%% TEST_OPT_TEST tests the TEST_OPT library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    16 October 2011
%
%  Author:
%
%    John Burkardt
%
  timestamp (  )
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_OPT_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the TEST_OPT library.\n' );

  test_opt_test01 ( );
  test_opt_test02 ( );
  test_opt_test03 ( );
  test_opt_test04 ( );
  test_opt_test05 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_OPT_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp (  )

  return
end

function test_int_margin_test ( )

%*****************************************************************************80
%
%% TEST_INT_MARGIN_TEST tests TEST_INT_MARGIN.
%
%  Discussion:
%
%    TEST_INT_MARGIN_TEST calls the TEST_INT_MARGIN tests.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    15 January 2012
%
%  Author:
%
%    John Burkardt
%
  timestamp (  );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_INT_MARGIN_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the TEST_INT_MARGIN library.\n' );

  test_int_margin_test01 ( );
  test_int_margin_test02 ( );
  test_int_margin_test03 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_INT_MARGIN_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp (  );

  return
end

function test_triangulation_test ( )

%*****************************************************************************80
%
%% TEST_TRIANGULATION_TEST tests the TEST_TRIANGULATION library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 April 2009
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_TRIANGULATION_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the TEST_TRIANGULATION library.\n' );

  test_triangulation_test01 ( );
  test_triangulation_test02 ( );
  test_triangulation_test03 ( );
% test_triangulation_test04 ( );
  test_triangulation_test05 ( );
  test_triangulation_test06 ( );
  test_triangulation_test07 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_TRIANGULATION_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

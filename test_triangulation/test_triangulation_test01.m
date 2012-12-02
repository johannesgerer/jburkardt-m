function test_triangulation_test01 ( )

%*****************************************************************************80
%
%% TEST01 tests P00_TEST_NUM, P00_TITLE and P00_HEADER.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 April 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST01\n' );
  fprintf ( 1, '  P00_TEST_NUM reports the number of problems.\n' );
  fprintf ( 1, '  P00_TITLE returns a title for each problem.\n' );
  fprintf ( 1, '  P00_HEADER prints some information about each problem.\n' );

  test_num = p00_test_num ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The number of tests available = %d\n', test_num );

  for test = 1 : test_num

    title = p00_title ( test );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Test number: %d\n', test );
    fprintf ( 1, '  Title:      "%s"\n', title );

    p00_header ( test );

  end

  return
end

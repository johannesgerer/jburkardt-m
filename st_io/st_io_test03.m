function st_io_test03 ( )

%*****************************************************************************80
%
%% ST_IO_TEST03 tests ST_SORT_A.
%
%  Discussion:
%
%    The matrix is:
%
%      11  12   0   0  15
%      21  22   0   0   0
%       0   0  33   0  35
%       0   0   0  44   0
%      51   0  53   0  55
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 July 2014
%
%  Author:
%
%    John Burkardt
%
  m = 5;
  n = 5;
  nst = 11;
  ast = [ 51.0, 12.0, 11.0, 33.0, 15.0, 53.0, 55.0, 22.0, 35.0, 44.0, 21.0 ]';
  ist = [ 5, 1, 1, 3, 1, 5, 5, 2, 3, 4, 2 ];
  jst = [ 1, 2, 1, 3, 5, 3, 5, 2, 5, 4, 1 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'ST_IO_TEST03\n' );
  fprintf ( 1, '  ST_SORT_A sorts an ST matrix by columns.\n' );

  i_min = min ( ist );
  i_max = max ( ist );
  j_min = min ( jst );
  j_max = max ( jst );

  st_header_print ( i_min, i_max, j_min, j_max, m, n, nst );

  st_print ( m, n, nst, ist, jst, ast, '  Matrix data before sorting:' );

  [ ist, jst, ast ] = st_sort_a ( m, n, nst, ist, jst, ast );

  st_print ( m, n, nst, ist, jst, ast, '  Matrix data after sorting:' );

  return
end

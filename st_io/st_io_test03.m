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
%    The index vectors are 1 based, and so have to be converted to
%    0-base before being written.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 November 2008
%
%  Author:
%
%    John Burkardt
%
  nrow = 5;
  ncol = 5;
  nnzero = 11;
  a = [ 51.0, 12.0, 11.0, 33.0, 15.0, 53.0, 55.0, 22.0, 35.0, 44.0, 21.0 ]';
  col = [ 1, 2, 1, 3, 5, 3, 5, 2, 5, 4, 1 ];
  row = [ 5, 1, 1, 3, 1, 5, 5, 2, 3, 4, 2 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'ST_IO_TEST03\n' );
  fprintf ( 1, '  ST_SORT_A sorts an ST matrix by columns.\n' );

  base1 = 1;
  base0 = 0;
  row = st_rebase ( base1, base0, nnzero, row );
  col = st_rebase ( base1, base0, nnzero, col );

  st_header_print ( nrow, ncol, nnzero )

  st_data_print ( nrow, ncol, nnzero, row, col, a, ...
    '  Matrix data before sorting:' );

  [ row, col, a ] = st_sort_a ( nrow, ncol, nnzero, row, col, a );

  st_data_print ( nrow, ncol, nnzero, row, col, a, ...
    '  Matrix data after sorting:' );

  return
end

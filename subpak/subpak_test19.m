function test19 ( )

%*****************************************************************************80
%
%% TEST19 tests INDEX1_COL, INDEX1_ROW, and related functions.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 April 2010
%
%  Author:
%
%    John Burkardt
%
  n_max = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST19\n' );
  fprintf ( 1, '  INDEX1_COL column indexes a 1D array,\n' );
  fprintf ( 1, '  INDEX1_ROW row indexes a 1D array,\n' );
  fprintf ( 1, '  and there are several more versions of these functions.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  By COLS:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Imin     I  Imax  Xmin Index\n' );
  fprintf ( 1, '\n' );

  i_min = 1;
  i = 3;
  i_max = 5;
  index_min = 0;

  value = index1_col ( i_min, i, i_max, index_min );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  %4d  %4d  %4d\n', i_min, i, i_max );
  fprintf ( 1, '        INDEX1_COL  %4d  %4d\n', index_min, value );

  n = 1;
  in_min(1) = 1;
  in(1) = 3;
  in_max(1) = 5;
  index_min = 0;
  value = indexn_col ( n, in_min, in, in_max, index_min );
  fprintf ( 1, '        INDEXN_COL  %4d  %4d\n', index_min, value );

  i_min = 1;
  i = 3;
  i_max = 5;
  j_min = 1;
  j = 2;
  j_max = 4;
  index_min = 0;
  value = index2_col ( i_min, i, i_max, j_min, j, j_max, index_min );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  %4d  %4d  %4d\n', i_min, i, i_max );
  fprintf ( 1, '  %4d  %4d  %4d\n', j_min, j, j_max );
  fprintf ( 1, '        INDEX2_COL  %4d  %4d\n', index_min, value );

  n = 2;
  in_min(1) = 1;
  in(1) = 3;
  in_max(1) = 5;
  in_min(2) = 1;
  in(2) = 2;
  in_max(2) = 4;
  index_min = 0;
  value = indexn_col ( n, in_min, in, in_max, index_min );
  fprintf ( 1, '        INDEXN_COL  %4d  %4d\n', index_min, value );

  i_min = 1;
  i = 3;
  i_max = 5;
  j_min = 1;
  j = 2;
  j_max = 4;
  k_min = 1;
  k = 1;
  k_max = 3;
  index_min = 0;
  value = index3_col ( i_min, i, i_max, j_min, j, j_max, k_min, k, k_max, ...
   index_min );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  %4d  %4d  %4d\n', i_min, i, i_max );
  fprintf ( 1, '  %4d  %4d  %4d\n', j_min, j, j_max );
  fprintf ( 1, '  %4d  %4d  %4d\n', k_min, k, k_max );
  fprintf ( 1, '        INDEX3_COL  %4d  %4d\n', index_min, value );

  n = 3;
  in_min(1) = 1;
  in(1) = 3;
  in_max(1) = 5;
  in_min(2) = 1;
  in(2) = 2;
  in_max(2) = 4;
  in_min(3) = 1;
  in(3) = 1;
  in_max(3) = 3;
  index_min = 0;
  value = indexn_col ( n, in_min, in, in_max, index_min );
  fprintf ( 1, '        INDEXN_COL  %4d  %4d\n', index_min, value );

  i_min = 1;
  i = 3;
  i_max = 5;
  j_min = 1;
  j = 2;
  j_max = 4;
  k_min = 1;
  k = 1;
  k_max = 3;
  l_min = 1;
  l = 2;
  l_max = 2;
  index_min = 0;
  value = index4_col ( i_min, i, i_max, j_min, j, j_max, k_min, k, k_max, ...
    l_min, l, l_max, index_min );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  %4d  %4d  %4d\n', i_min, i, i_max );
  fprintf ( 1, '  %4d  %4d  %4d\n', j_min, j, j_max );
  fprintf ( 1, '  %4d  %4d  %4d\n', k_min, k, k_max );
  fprintf ( 1, '  %4d  %4d  %4d\n', l_min, l, l_max );
  fprintf ( 1, '        INDEX4_COL  %4d  %4d\n', index_min, value );

  n = 4;
  in_min(1) = 1;
  in(1) = 3;
  in_max(1) = 5;
  in_min(2) = 1;
  in(2) = 2;
  in_max(2) = 4;
  in_min(3) = 1;
  in(3) = 1;
  in_max(3) = 3;
  in_min(4) = 1;
  in(4) = 2;
  in_max(4) = 2;
  index_min = 0;
  value = indexn_col ( n, in_min, in, in_max, index_min );
  fprintf ( 1, '        INDEXN_COL  %4d  %4d\n', index_min, value );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  By ROWS:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Imin     I  Imax  Xmin Index\n' );
  fprintf ( 1, '\n' );

  i_min = 1;
  i = 3;
  i_max = 5;
  index_min = 0;
  value = index1_row ( i_min, i, i_max, index_min );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  %4d  %4d  %4d\n', i_min, i, i_max );
  fprintf ( 1, '        INDEX1_ROW  %4d  %4d\n', index_min, value );

  n = 1;
  in_min(1) = 1;
  in(1) = 3;
  in_max(1) = 5;
  index_min = 0;
  value = indexn_row ( n, in_min, in, in_max, index_min );
    fprintf ( 1, '        INDEXN_ROW  %4d  %4d\n', index_min, value );

  i_min = 1;
  i = 3;
  i_max = 5;
  j_min = 1;
  j = 2;
  j_max = 4;
  index_min = 0;
  value = index2_row ( i_min, i, i_max, j_min, j, j_max, index_min );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  %4d  %4d  %4d\n', i_min, i, i_max );
  fprintf ( 1, '  %4d  %4d  %4d\n', j_min, j, j_max );
  fprintf ( 1, '        INDEX2_ROW  %4d  %4d\n', index_min, value );

  n = 2;
  in_min(1) = 1;
  in(1) = 3;
  in_max(1) = 5;
  in_min(2) = 1;
  in(2) = 2;
  in_max(2) = 4;
  index_min = 0;
  value = indexn_row ( n, in_min, in, in_max, index_min );
  fprintf ( 1, '        INDEXN_ROW  %4d  %4d\n', index_min, value );

  i_min = 1;
  i = 3;
  i_max = 5;
  j_min = 1;
  j = 2;
  j_max = 4;
  k_min = 1;
  k = 1;
  k_max = 3;
  index_min = 0;
  value = index3_row ( i_min, i, i_max, j_min, j, j_max, k_min, k, k_max, ...
    index_min );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  %4d  %4d  %4d\n', i_min, i, i_max );
  fprintf ( 1, '  %4d  %4d  %4d\n', j_min, j, j_max );
  fprintf ( 1, '  %4d  %4d  %4d\n', k_min, k, k_max );
  fprintf ( 1, '        INDEX3_ROW  %4d  %4d\n', index_min, value );

  n = 3;
  in_min(1) = 1;
  in(1) = 3;
  in_max(1) = 5;
  in_min(2) = 1;
  in(2) = 2;
  in_max(2) = 4;
  in_min(3) = 1;
  in(3) = 1;
  in_max(3) = 3;
  index_min = 0;
  value = indexn_row ( n, in_min, in, in_max, index_min );
  fprintf ( 1, '        INDEXN_ROW  %4d  %4d\n', index_min, value );

  i_min = 1;
  i = 3;
  i_max = 5;
  j_min = 1;
  j = 2;
  j_max = 4;
  k_min = 1;
  k = 1;
  k_max = 3;
  l_min = 1;
  l = 2;
  l_max = 2;
  index_min = 0;
  value = index4_row ( i_min, i, i_max, j_min, j, j_max, k_min, k, k_max, ...
    l_min, l, l_max, index_min );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  %4d  %4d  %4d\n', i_min, i, i_max );
  fprintf ( 1, '  %4d  %4d  %4d\n', j_min, j, j_max );
  fprintf ( 1, '  %4d  %4d  %4d\n', k_min, k, k_max );
  fprintf ( 1, '  %4d  %4d  %4d\n', l_min, l, l_max );
  fprintf ( 1, '        INDEX4_ROW  %4d  %4d\n', index_min, value );

  n = 4;
  in_min(1) = 1;
  in(1) = 3;
  in_max(1) = 5;
  in_min(2) = 1;
  in(2) = 2;
  in_max(2) = 4;
  in_min(3) = 1;
  in(3) = 1;
  in_max(3) = 3;
  in_min(4) = 1;
  in(4) = 2;
  in_max(4) = 2;
  index_min = 0;
  value = indexn_row ( n, in_min, in, in_max, index_min );
  fprintf ( 1, '        INDEXN_ROW  %4d  %4d\n', index_min, value );

  return
end

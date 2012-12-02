function linplus_test0192 ( )

%*****************************************************************************80
%
%% TEST0192 tests R8CC_WRITE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 March 2009
%
%  Author:
%
%    John Burkardt
%
  m = 5;
  n = 5;
  nz_num = 12;

  a_file = 'r8cc_a.txt';
  col = [ 1, 4, 6, 8, 10, 13 ];
  col_file = 'r8cc_col.txt';
  row = [ 1, 2, 4, 1, 2, 3, 5, 4, 5, 1, 2, 5 ];
  row_file = 'r8cc_row.txt';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0192\n' );
  fprintf ( 1, '  For a matrix in the R8CC format,\n' );
  fprintf ( 1, '  (double precision compressed column sparse)\n' );
  fprintf ( 1, '  R8CC_WRITE writes the matrix to 3 files.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix rows M     = %d\n', m );
  fprintf ( 1, '  Matrix columns N  = %d\n', n );
  fprintf ( 1, '  Nonzeros NZ_NUM   = %d\n', nz_num );

  i4vec_print ( n+1, col, '  The COL vector:' );

  i4vec_print ( nz_num, row, '  The ROW vector:' );

  a = r8cc_indicator ( m, n, nz_num, col, row );

  r8cc_print ( m, n, nz_num, col, row, a, '  The R8CC matrix:' );

  r8cc_write ( col_file, row_file, a_file, m, n, nz_num, col, row, a );

  return
end

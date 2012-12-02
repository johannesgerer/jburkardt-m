function linplus_test0193 ( )

%*****************************************************************************80
%
%% TEST0193 tests R8CC_READ_SIZE and R8CC_READ.
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
  a_file = 'r8cc_a.txt';
  col_file = 'r8cc_col.txt';
  row_file = 'r8cc_row.txt';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0193\n' );
  fprintf ( 1, '  For a matrix in the R8CC format,\n' );
  fprintf ( 1, '  (double precision compressed column sparse)\n' );
  fprintf ( 1, '  R8CC_READ_SIZE reads the sizes of the data;\n' );
  fprintf ( 1, '  R8CC_READ reads the data.\n' );

  [ m, n, nz_num, base ] = r8cc_read_size ( col_file, row_file );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix rows M     = %d\n', m );
  fprintf ( 1, '  Matrix columns N  = %d\n', n );
  fprintf ( 1, '  Nonzeros NZ_NUM   = %d\n', nz_num );
  fprintf ( 1, '  Index base (0/1)  = %d\n', base );

  [ col, row, a ] = r8cc_read ( col_file, row_file, a_file, m, n, ...
    nz_num );

  i4vec_print ( n+1, col, '  The COL vector:' );

  i4vec_print ( nz_num, row, '  The ROW vector:' );

  r8cc_print ( m, n, nz_num, col, row, a, '  The R8CC matrix:' );
%
%  Delete the files.
%  If you want to look at the files, comment out these lines
%  and rerun the problem!
%
  file_delete ( a_file );
  file_delete ( col_file );
  file_delete ( row_file );

  return
end

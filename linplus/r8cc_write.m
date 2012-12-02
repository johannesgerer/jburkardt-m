function r8cc_write ( col_file, row_file, a_file, m, n, nz_num, col, row, a )

%*****************************************************************************80
%
%% R8CC_WRITE writes a R8CC matrix to three files.
%
%  Discussion:
%
%    The R8CC format is the double precision sparse compressed column
%    format.  Associated with this format, we have an M by N matrix
%    with NZ_NUM nonzero entries.  We construct the column pointer
%    vector COL of length N+1, such that entries of column J will be
%    stored in positions COL(J) through COL(J+1)-1.  This indexing
%    refers to both the ROW and A vectors, which store the row indices
%    and the values of the nonzero entries.  The entries of the
%    ROW vector corresponding to each column are assumed to be
%    ascending sorted.
%
%    The R8CC format is equivalent to the MATLAB "sparse" format,
%    and the Harwell Boeing "real unsymmetric assembled" (RUA) format.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 September 2006
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Iain Duff, Roger Grimes, John Lewis,
%    User's Guide for the Harwell-Boeing Sparse Matrix Collection,
%    October 1992
%
%  Parameters:
%
%    Input, string COL_FILE, ROW_FILE, A_FILE, the names of the
%    files containing the column pointers, row entries, and matrix entries.
%
%    Input, integer M, N, the number of rows and columns in the matrix.
%
%    Input, integer NZ_NUM, the number of nonzero elements in the matrix.
%
%    Input, integer COL(N+1), the column pointers.
%
%    Input, integer ROW(NZ_NUM), the row indices.
%
%    Input, real A(NZ_NUM), the nonzero elements
%    of the matrix.
%

%
%  Write the column information.
%
  output_unit = fopen ( col_file, 'wt' );

  if ( output_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8CC_WRITE - Fatal error!\n' );
    fprintf ( 1, '  Could not open the output file "%s".\n', col_file );
    error ( 'R8CC_WRITE - Fatal error!' );
  end

  for k = 1 : n + 1

    fprintf ( output_unit, '%8d\n', col(k) );

  end

  fclose ( output_unit );
%
%  Write the row information.
%
  output_unit = fopen ( row_file, 'wt' );

  if ( output_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8CC_WRITE - Fatal error!\n' );
    fprintf ( 1, '  Could not open the output file "%s".\n', row_file );
    error ( 'R8CC_WRITE - Fatal error!' );
  end

  for k = 1 : nz_num

    fprintf ( output_unit, '%8d\n', row(k) );

  end

  fclose ( output_unit );
%
%  Write the value information.
%
  output_unit = fopen ( a_file, 'wt' );

  if ( output_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8CC_WRITE - Fatal error!\n' );
    fprintf ( 1, '  Could not open the output file "%s".\n', a_file );
    error ( 'R8CC_WRITE - Fatal error!' );
  end

  for k = 1 : nz_num

    fprintf ( output_unit, '%14f\n', a(k) );

  end

  fclose ( output_unit );

  return
end

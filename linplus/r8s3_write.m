function r8s3_write ( n, nz_num, isym, row, col, a, output_file )

%*****************************************************************************80
%
%% R8S3_WRITE writes a square R8S3 matrix to a file.
%
%  Discussion:
%
%    The R8S3 storage format corresponds to the SLAP Triad format.
%
%    The R8S3 storage format stores the row, column and value of each nonzero
%    entry of a sparse matrix.  The entries may be given in any order.  No
%    check is made for the erroneous case in which a given matrix entry is
%    specified more than once.
%
%    There is a symmetry option for square matrices.  If the symmetric storage
%    option is used, the format specifies that only nonzeroes on the diagonal
%    and lower triangle are stored.  However, this routine makes no attempt
%    to enforce this.  The only thing it does is to "reflect" any nonzero
%    offdiagonal value.  Moreover, no check is made for the erroneous case
%    in which both A(I,J) and A(J,I) are specified, but with different values.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 August 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, integer NZ_NUM, the number of nonzero elements in the matrix.
%
%    Input, integer ISYM, is 0 if the matrix is not symmetric, and 1
%    if the matrix is symmetric.  If the matrix is symmetric, then
%    only the nonzeroes on the diagonal and in the lower triangle are stored.
%
%    Input, integer ROW(NZ_NUM), COL(NZ_NUM), the row and column indices
%    of the nonzero elements.
%
%    Input, real A(NZ_NUM), the nonzero elements of the matrix.
%
%    Input, string OUTPUT_FILE, the name of the file to which
%    the information is to be written.
%
  output_unit = fopen ( output_file, 'wt' );

  if ( output_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8S3_WRITE - Fatal error!\n' );
    fprintf ( 1, '  Could not open the output file "%s".\n', output_file );
    error ( 'R8S3_WRITE - Fatal error!' );
  end

  for k = 1 : nz_num
    fprintf ( output_unit, '  %8d  %8d  %16f\n', row(k), col(k), a(k) );
  end

  fclose ( output_unit );

  return
end

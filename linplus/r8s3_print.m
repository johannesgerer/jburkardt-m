function r8s3_print ( m, n, nz_num, isym, row, col, a, title )

%*****************************************************************************80
%
%% R8S3_PRINT prints a R8S3 matrix.
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
%    Input, integer M, N, the number of rows and columns of the matrix.
%
%    Input, integer NZ_NUM, the number of nonzero elements in the matrix.
%
%    Input, integer ISYM, is 0 if the matrix is not symmetric, and 1
%    if the matrix is symmetric.  The symmetric case only makes sense
%    if the matrix is also square, that is, M = N.  In this case, only
%    the nonzeroes on the diagonal and in the lower triangle are stored.
%
%    Input, integer ROW(NZ_NUM), COL(NZ_NUM), the row and column indices
%    of the nonzero elements.
%
%    Input, real A(NZ_NUM), the nonzero elements of the matrix.
%
%    Input, string TITLE, a title.
%
  r8s3_print_some ( m, n, nz_num, isym, row, col, a, 1, 1, m, n, title );

  return
end

function a = r8s3_indicator ( n, nz_num, isym, row, col )

%*****************************************************************************80
%
%% R8S3_INDICATOR sets up a R8S3 indicator matrix.
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
%    N must be positive.
%
%    Input, integer NZ_NUM, the number of nonzero entries.
%
%    Input, integer ISYM, is 0 if the matrix is not symmetric, and 1
%    if the matrix is symmetric.  If the matrix is symmetric, then
%    only the nonzeroes on the diagonal and in the lower triangle are stored.
%
%    Input, integer ROW(NZ_NUM), COL(NZ_NUM), the row and column indices
%    of the nonzero elements.
%
%    Output, real A(NZ_NUM), the indicator matrix.
%
  fac = 10 ^ ( i4_log_10 ( n ) + 1 );

  for k = 1 : nz_num
    i = row(k);
    j = col(k);
    a(k) = fac * i + j;
  end

  return
end

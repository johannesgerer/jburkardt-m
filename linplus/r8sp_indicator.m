function a = r8sp_indicator ( m, n, nz_num, row, col )

%*****************************************************************************80
%
%% R8SP_INDICATOR sets up a R8SP indicator matrix.
%
%  Discussion:
%
%    The R8SP storage format stores the row, column and value of each nonzero
%    entry of a sparse matrix.
%
%    It is possible that a pair of indices (I,J) may occur more than
%    once.  Presumably, in this case, the intent is that the actual value
%    of A(I,J) is the sum of all such entries.  This is not a good thing
%    to do, but I seem to have come across this in MATLAB.
%
%    The R8SP format is used by CSPARSE ("sparse triplet"), DLAP/SLAP 
%    ("nonsymmetric SLAP triad"), by MATLAB, and by SPARSEKIT ("COO" format).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 February 2004
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
%    Input, integer ROW(NZ_NUM), COL(NZ_NUM), the row and column indices
%    of the nonzero elements.
%
%    Output, real A(NZ_NUM), the nonzero elements of the matrix.
%
  fac = 10^( i4_log_10 ( n ) + 1 );

  for k = 1 : nz_num

    i = row(k);
    j = col(k);
    a(k) = fac * i + j;

  end

  return
end

function b = r8sp_vxm ( m, n, nz_num, row, col, a, x )

%*****************************************************************************80
%
%% R8SP_VXM multiplies a vector times a R8SP matrix.
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
%    Input, real A(NZ_NUM), the nonzero elements of the matrix.
%
%    Input, real X(M), the vector to be multiplied by A.
%
%    Output, real B(N), the product vector A'*X.
%
  b(1:n) = 0.0;

  for k = 1 : nz_num

    i = row(k);
    j = col(k);
    b(j) = b(j) + a(k) * x(i);

  end

  return
end

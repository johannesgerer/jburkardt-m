function r8sp_print ( m, n, nz_num, row, col, a, title )

%*****************************************************************************80
%
%% R8SP_PRINT prints a R8SP matrix.
%
%  Discussion:
%
%    This version of R8SP_PRINT has been specifically modified to allow,
%    and correctly handle, the case in which a single matrix location
%    A(I,J) is referenced more than once by the sparse matrix structure.
%    In such cases, the routine prints out the sum of all the values.
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
%    07 April 2006
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
%    Input, string TITLE, a title.
%
  r8sp_print_some ( m, n, nz_num, row, col, a, 1, 1, m, n, title );

  return
end

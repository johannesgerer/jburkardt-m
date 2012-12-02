function [ a, seed ] = r8sp_random ( m, n, nz_num, row, col, seed )

%*****************************************************************************80
%
%% R8SP_RANDOM sets a random R8SP matrix.
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
%    16 February 2005
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
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real A(NZ_NUM), the nonzero elements of the matrix.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  [ a, seed ] = r8vec_uniform_01 ( nz_num, seed );

  return
end

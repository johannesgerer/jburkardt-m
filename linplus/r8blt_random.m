function [ a, seed ] = r8blt_random ( n, ml, seed )

%*****************************************************************************80
%
%% R8BLT_RANDOM randomizes a R8BLT matrix.
%
%  Discussion:
%
%    The R8BLT storage format is appropriate for a banded lower triangular matrix.
%    The matrix is assumed to be zero below the ML-th subdiagonal.
%    The matrix is stored in an ML+1 by N array, in which the diagonal
%    appears in the first row, followed by successive subdiagonals.
%    Columns are preserved.
%
%  Example:
%
%    N = 5, ML = 2
%
%    A11   0   0   0   0
%    A21 A22   0   0   0
%    A31 A32 A33   0   0
%      0 A42 A43 A44   0
%      0   0 A53 A54 A55
%                --- ---
%                    ---
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 February 2005.
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of columns of the matrix.
%
%    Input, integer ML, the lower bandwidth.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real A(ML+1,N), the R8BLT matrix.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  for i = 1 : n
    for j = max ( 1, i - ml ) : i
      [ a(i-j+1,j), seed ] = r8_uniform_01 ( seed );
    end
  end
%
%  The junk entries can be thought of as corresponding to
%  elements of a phantom portion of the matrix.
%
  for i = n+1 : n+ml
    for j = i-ml : n
      a(i-j+1,j) = 0.0;
    end
  end

  return
end

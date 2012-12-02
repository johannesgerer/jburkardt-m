function b = r8blt_mxv ( n, ml, a, x )

%*****************************************************************************80
%
%% R8BLT_MXV multiplies a R8BLT matrix times a vector.
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
%    03 February 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, integer ML, the lower bandwidth.
%
%    Input, real A(ML+1,N), the R8BLT matrix.
%
%    Input, real X(N), the vector to be multiplied by A.
%
%    Output, real B(N), the product A * x.
%
  for i = 1 : n
    b(i) = 0.0;
    jlo = max ( 1, i - ml );
    jhi = i;
    for j = jlo : jhi
      b(i) = b(i) + a(i-j+1,j) * x(j);
    end
  end

  return
end

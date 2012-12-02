function a = r8blt_indicator ( n, ml )

%*****************************************************************************80
%
%% R8BLT_INDICATOR sets up a R8BLT indicator matrix.
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
%    The indicator matrix is stored as:
%
%      11  22  33  44  55
%      21  32  43  54   0
%      31  42  53   0   0
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
%    Input, integer N, the number of columns of the matrix.
%
%    Input, integer ML, the lower bandwidth.
%
%    Output, real A(ML+1,N), the R8BLT matrix.
%

  fac = 10 ^ ( i4_log_10 ( n ) + 1 );

  for i = 1 : n
    for j = max ( 1, i - ml ) : i
      a(i-j+1,j) = fac * i + j;
    end
  end

  for i = n+1 : n+ml
    for j = i-ml : n
      a(i-j+1,j) = 0.0;
    end
  end

  return
end

function b = r8blt_to_r8ge ( n, ml, a )

%*****************************************************************************80
%
%% R8BLT_TO_R8GE copies a R8BLT matrix to a R8GE matrix.
%
%  Discussion:
%
%    The R8BLT storage format is used for a banded lower triangular matrix.
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
%    28 March 2004
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
%    Output, real B(N,N), the R8GE matrix.
%
  for i = 1 : n
    for j = 1 : n
       if ( j <= i & i <= j + ml )
          b(i,j) = a(i-j+1,j);
       else
          b(i,j) = 0.0;
       end
    end
  end
  
  return
end

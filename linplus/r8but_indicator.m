function a = r8but_indicator ( n, mu )

%*****************************************************************************80
%
%% R8BUT_INDICATOR sets up a R8BUT indicator matrix.
%
%  Discussion:
%
%    The R8BUT storage format is used for a banded upper triangular matrix.
%    The matrix is assumed to be zero above the MU-th superdiagonal.
%    The matrix is stored in an MU+1 by N array.
%    Columns are preserved.
%
%    The diagonal is stored in row MU+1 of the array.
%    The first superdiagonal in row MU, columns 2 through N.
%    The second superdiagonal in row MU-1, columns 3 through N.
%    The MU-th superdiagonal in row 1, columns MU+1 through N.
%
%  Example:
%
%    N = 5, MU = 2
%
%    A11 A12 A13   0   0
%      0 A22 A23 A24   0
%      0   0 A33 A34 A35
%      0   0   0 A44 A45
%      0   0   0   0 A55
%                --- ---
%                    ---
%
%    The indicator matrix is stored as:
%
%       0   0  13  24  35
%       0  12  23  34  45
%      11  22  33  44  55
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
%    Input, integer N, the number of columns of the matrix.
%
%    Input, integer MU, the upper bandwidth.
%
%    Output, real A(MU+1,N), the R8BUT matrix.
%
  fac = 10^( i4_log_10 ( n ) + 1 );

  for i = 1 : n
    for j = i : min ( n, i + mu )
      a(i-j+mu+1,j) = fac * i + j;
    end
  end

  for i = 1 : mu
    for j = 1 : mu+1-i
      a(i,j) = 0.0;
    end
  end

  return
end

function det = r8but_det ( n, mu, a )

%*****************************************************************************80
%
%% R8BUT_DET computes the determinant of a R8BUT matrix.
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
%    Input, integer MU, the upper bandwidth.
%
%    Input, real A(MU+1,N), the R8BUT matrix.
%
%    Output, real DET, the determinant of A.
%
  det = 1.0;
  for j = 1 : n
    det = det * a(mu+1,j);
  end

  return
end

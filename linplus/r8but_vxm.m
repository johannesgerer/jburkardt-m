function b = r8but_vxm ( n, mu, a, x )

%*****************************************************************************80
%
%% R8BUT_VXM multiplies a vector by a R8BUT matrix.
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
%    Input, real X(N), the vector to be multiplied by A.
%
%    Output, real B(N), the product X*A.
%
  for i = 1 : n
    ilo = max ( 1, i - mu );
    b(i) = sum ( x(ilo:i) * a(ilo-i+mu+1:mu+1,i) );
  end

  return
end

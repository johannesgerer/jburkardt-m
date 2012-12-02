function a = ris ( n )

%*****************************************************************************80
%
%% RIS returns the Ris or "dingdong" matrix, invented by F N Ris.
%
%  Formula:
%
%    A(I,J) = 1 / ( 3 + 2 * N - 2 * I - 2 * J )
%
%  Example:
%
%    N = 5
%
%    1/9  1/7  1/5  1/3   1
%    1/7  1/5  1/3   1   -1
%    1/5  1/3   1   -1  -1/3
%    1/3   1   -1  -1/3 -1/5
%     1   -1  -1/3 -1/5 -1/7
%
%  Properties:
%
%    A is a Cauchy matrix.
%
%    A is a Hankel matrix: constant along anti-diagonals.
%
%    A is symmetric: A' = A.
%
%    Because A is symmetric, it is normal.
%
%    Because A is normal, it is diagonalizable.
%
%    The eigenvalues of A cluster around PI/2 and -PI/2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    John Nash,
%    Compact Numerical Methods for Computers: Linear Algebra and
%    Function Minimisation,
%    John Wiley, 1979, page 210.
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Output, real A(N,N), the matrix.
%
  for i = 1 : n
    for j = 1 : n
      a(i,j) = 1.0 / ( 3 + 2 * n - 2 * i - 2 * j );
    end
  end

  return
end

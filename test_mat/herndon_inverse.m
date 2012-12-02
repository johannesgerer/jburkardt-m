function a = herndon_inverse ( n )

%*****************************************************************************80
%
%% HERNDON_INVERSE returns the inverse of the Herndon matrix.
%
%  Formula:
%
%    if ( I == N )
%      A(I,J) = J
%    else if ( J == N )
%      A(I,J) = I
%    else if ( I == J )
%      A(I,J) = 1
%    else
%      A(I,J) = 0
%
%  Example:
%
%    N = 5
%
%    1  0  0  0  1
%    0  1  0  0  2
%    0  0  1  0  3
%    0  0  0  1  4
%    1  2  3  4  5
%
%  Properties:
%
%    A is symmetric.
%
%    A is border-banded.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    John Herndon,
%    Algorithm 52, A Set of Test Matrices,
%    Communications of the ACM,
%    April, 1961.
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Output, real A(N,N), the matrix.
%
  a(1:n,1:n) = 0.0;

  for i = 1 : n - 1
    a(i,i) = 1.0;
  end

  for i = 1 : n - 1
    a(i,n) = i;
  end

  for j = 1 : n-1
    a(n,j) = j;
  end

  a(n,n) = n;

  return
end

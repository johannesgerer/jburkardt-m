function a = sylvester_kac ( n )

%*****************************************************************************80
%
%% SYLVESTER_KAC returns the SYLVESTER_KAC matrix.
%
%  Formula:
%
%    If J = I - 1
%      A(I,J) = N + 1 - I
%    If J = I + 1
%      A(I,J) = I
%
%  Example:
%
%    N = 5,
%
%    0 1 0 0 0
%    4 0 2 0 0
%    0 3 0 3 0
%    0 0 2 0 4
%    0 0 0 1 0
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    A is tridiagonal.
%
%    If N is odd, the eigenvalues are:
%      -(N-1), -(N-3), ..., -2, 0, 2, ... (N-3), (N-1).
%
%    If N is even, the eigenvalues are:
%      -(N-1), -(N-3), ..., -1, +1, ..., (N-3), (N-1).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 April 2015
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Paul Clement,
%    A class of triple-diagonal matrices for test purposes,
%    SIAM Review,
%    Volume 1, 1959, pages 50-52.
%
%    Olga Taussky, John Todd,
%    Another Look at a Matrix of Mark Kac,
%    Linear Algebra and its Applications,
%    Volume 150, 1991, pages 341-360.
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Output, real A(N,N), the matrix.
%
  a = zeros ( n, n );

  for i = 1 : n - 1
    a(i,i+1) = i;
    a(i+1,i) = n - i;
  end

  return
end

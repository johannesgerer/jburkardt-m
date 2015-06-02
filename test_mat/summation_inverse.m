function a = summation_inverse ( n )

%*****************************************************************************80
%
%% SUMMATION_INVERSE returns the inverse of the SUMMATION matrix.
%
%  Example:
%
%    N = 5
%
%    1  0  0  0  0
%   -1  1  0  0  0
%    0 -1  1  0  0
%    0  0 -1  1  0
%    0  0  0 -1  1
%
%  Properties:
%
%    A is lower triangular.
%
%    A is lower bidiagonal.
%
%    Because A is bidiagonal, it has property A (bipartite).
%
%    A is Toeplitz: constant along diagonals.
%
%    A is nonsingular.
%
%    det ( A ) = 1.
%
%    A is unimodular.
%
%    LAMBDA(1:N) = 1.
%
%    A is persymmetric: A(I,J) = A(N+1-J,N+1-I).
%
%    A is the inverse of the summation matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Output, real A(N,N), the matrix.
%
  a = zeros ( n, n );

  for i = 1 : n
    for j = 1 : n
      if ( i == j )
        a(i,j) = 1.0;
      elseif ( i == j + 1 )
        a(i,j) = -1.0;
      else
        a(i,j) = 0.0;
      end
    end
  end

  return
end

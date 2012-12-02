function a = upshift ( n )

%*****************************************************************************80
%
%% UPSHIFT returns the upshift matrix.
%
%  Formula:
%
%    if ( J-I == 1 mod ( n ) )
%      A(I,J) = 1
%    else
%      A(I,J) = 0
%
%  Example:
%
%    N = 4
%
%    0 1 0 0
%    0 0 1 0
%    0 0 0 1
%    1 0 0 0
%
%  Rectangular properties:
%
%    A is integral: int ( A ) = A.
%
%    A is a zero/one matrix.
%
%  Square Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    A is nonsingular.
%
%    A is a permutation matrix.
%
%    If N is even, det ( A ) = -1.
%    If N is odd,  det ( A ) = +1.
%
%    A is unimodular.
%
%    A is persymmetric: A(I,J) = A(N+1-J,N+1-I).
%
%    A is a Hankel matrix: constant along anti-diagonals.
%
%    A is an N-th root of the identity matrix.
%
%    The inverse of A is the downshift matrix.
%
%    A circulant matrix C, whose first row is (c1, c2, ..., cn), can be
%    written as a polynomial in A:
%
%      C = c1 * I + c2 * A + c3 * A**2 + ... + cn * A**n-1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of rows and columns 
%    of the matrix.
%
%    Output, real A(N,N), the matrix.
%
  for i = 1 : n
    for j = 1 : n
      if ( i4_modp ( j - i, n ) == 1 )
        a(i,j) = 1.0;
      else
        a(i,j) = 0.0;
      end
    end
  end

  return
end

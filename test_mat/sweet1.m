function a = sweet1 ( )

%*****************************************************************************80
%
%% SWEET1 returns the Sweet1 Toeplitz matrix.
%
%  Example:
%
%    20.0  15.0   2.5   6.0   1.0  -2.0
%    15.0  20.0  15.0   2.5   6.0   1.0
%     2.5  15.0  20.0  15.0   2.5   6.0
%     6.0   2.5  15.0  20.0  15.0   2.5
%     1.0   6.0   2.5  15.0  20.0  15.0
%    -2.0   1.0   6.0   2.5  15.0  20.0
%
%  Properties:
%
%    A is symmetric: A' = A.
%
%    Because A is symmetric, it is normal.
%
%    Because A is normal, it is diagonalizable.
%
%    A is Toeplitz: constant along diagonals.
%
%    A is persymmetric: A(I,J) = A(N+1-J,N+1-I).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Per Hansen, Tony Chan,
%    FORTRAN Subroutines for General Toeplitz Systems,
%    ACM Transactions on Mathematical Software,
%    Volume 18, Number 3, September 1992, pages 256-273.
%
%    Douglas Sweet,
%    The use of pivoting to improve the numerical performance of
%    Toeplitz solvers,
%    In "Advanced Algorithms and Architectures for Signal Processing",
%    Edited by J M Speiser,
%    Proceedings SPIE 696, 1986, pages 8-18.
%
%  Parameters:
%
%    Output, real A(6,6), the matrix.
%
  n = 6;

  value = [ 20.0, 15.0, 2.5, 6.0, 1.0, -2.0 ];

  a = zeros ( n, n );

  for i = 1 : n
    for j = 1 : n

      a(i,j) = value ( abs ( j - i ) + 1 );

    end
  end

  return
end

function a = sweet2 ( )

%*****************************************************************************80
%
%% SWEET2 returns the SWEET2 matrix.
%
%  Example:
%
%     4.0  8.0  1.0  6.0  2.0  3.0
%     6.0  4.0  8.0  1.0  6.0  2.0
%    71/15 6.0  4.0  8.0  1.0  6.0
%     5.0 71/15 6.0  4.0  8.0  1.0
%     3.0  5.0 71/15 6.0  4.0  8.0
%     1.0  3.0  5.0 71/15 6.0  4.0
%
%  Properties:
%
%    A is Toeplitz: constant along diagonals.
%
%    A is generally not symmetric: A' /= A.
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

  v = [ 1.0, 3.0, 5.0, 71.0 / 15.0, 6.0, 4.0, ...
    8.0, 1.0, 6.0, 2.0, 3.0 ];

  a = zeros ( n, n );

  for i = 1 : n
    for j = 1 : n

      a(i,j) = v ( j - i + 6 );

    end
  end

  return
end

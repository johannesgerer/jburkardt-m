function a = sweet2 ( perturb )

%*****************************************************************************80
%
%% SWEET2 returns the Sweet2 Toeplitz matrix.
%
%  Example:
%
%     4.0  8.0  1.0  6.0  2.0  3.0
%     6.0  4.0  8.0  1.0  6.0  2.0
%      A   6.0  4.0  8.0  1.0  6.0
%     5.0   A   6.0  4.0  8.0  1.0
%     3.0  5.0   A   6.0  4.0  8.0
%     1.0  3.0  5.0   A   6.0  4.0
%
%    The entries labled "A" have the value 71/15, but are also to
%    be uniformly perturbed by a value PERTURB, which should be a
%    small multiple of the machine precision.
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
%    Input, real PERTURB, the perturbation value to be added to the
%    second subdiagonal entries.
%
%    Output, real A(6,6), the matrix.
%
  n = 6;

  value = [ 1.0, 3.0, 5.0, 71.0 / 15.0, 6.0, 4.0, ...
    8.0, 1.0, 6.0, 2.0, 3.0 ];

  for i = 1 : n
    for j = 1 : n

      a(i,j) = value ( j - i + 6 );

      if ( j - i == -2 )
        a(i,j) = a(i,j) + perturb;
      end

    end
  end

  return
end

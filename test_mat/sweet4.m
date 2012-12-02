function a = sweet4 ( perturb )

%*****************************************************************************80
%
%% SWEET4 returns the Sweet4 Toeplitz matrix.
%
%  Example:
%
%    5.0  -1.0   6.0   2.0   5.6   5.8   3.0  -5.0  -2.0  -7.0   1.0  10.0 -15.0
%    1.0   5.0  -1.0   6.0   2.0   5.6   5.8   3.0  -5.0  -2.0  -7.0   1.0  10.0
%   -3.0   1.0   5.0  -1.0   6.0   2.0   5.6   5.8   3.0  -5.0  -2.0  -7.0   1.0
%   12.7  -3.0   1.0   5.0  -1.0   6.0   2.0   5.6   5.8   3.0  -5.0  -2.0  -7.0
%  -19.6  12.7  -3.0   1.0   5.0  -1.0   6.0   2.0   5.6   5.8   3.0  -5.0  -2.0
%   28.3 -19.6  12.7  -3.0   1.0   5.0  -1.0   6.0   2.0   5.6   5.8   3.0  -5.0
%   -7.0  28.3 -19.6  12.7  -3.0   1.0   5.0  -1.0   6.0   2.0   5.6   5.8   3.0
%   -1.0  -7.0  28.3 -19.6  12.7  -3.0   1.0   5.0  -1.0   6.0   2.0   5.6   5.8
%    2.0  -1.0  -7.0  28.3 -19.6  12.7  -3.0   1.0   5.0  -1.0   6.0   2.0   5.6
%    1.0   2.0  -1.0  -7.0  28.3 -19.6  12.7  -3.0   1.0   5.0  -1.0   6.0   2.0
%   -6.0   1.0   2.0  -1.0  -7.0  28.3 -19.6  12.7  -3.0   1.0   5.0  -1.0   6.0
%    1.0  -6.0   1.0   2.0  -1.0  -7.0  28.3 -19.6  12.7  -3.0   1.0   5.0  -1.0
%   -0.5   1.0  -6.0   1.0   2.0  -1.0  -7.0  28.3 -19.6  12.7  -3.0   1.0   5.0
%
%  Properties:
%
%    A is Toeplitz: constant along diagonals.
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
%    Output, real A(13,13), the matrix.
%
  n = 13;

  value = [ ...
  -0.5,  1.0,  -6.0,     1.0,    2.0, ...
  -1.0, -7.0,  28.361, -19.656, 12.755, ...
  -3.0,  1.0,   5.0,    -1.0,    6.0, ...
   2.0,  5.697, 5.850,   3.0,   -5.0, ...
  -2.0, -7.0,   1.0,    10.0,  -15.0 ];

  for i = 1 : n
    for j = 1 : n

      a(i,j) = value ( j - i + 13 );

      if ( j - i == -2 )
        a(i,j) = a(i,j) + perturb;
      end

    end
  end

  return
end

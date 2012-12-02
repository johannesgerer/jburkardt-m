function a = rosser1 ( )

%*****************************************************************************80
%
%% ROSSER1 returns the ROSSER1 matrix.
%
%  Formula:
%
%    611  196 -192  407   -8  -52  -49   29
%    196  899  113 -192  -71  -43   -8  -44
%   -192  113  899  196   61   49    8   52
%    407 -192  196  611    8   44   59  -23
%     -8  -71   61    8  411 -599  208  208
%    -52  -43   49   44 -599  411  208  208
%    -49   -8    8   59  208  208   99 -911
%     29  -44   52  -23  208  208 -911   99
%
%  Properties:
%
%    A is singular.
%
%    det ( A ) = 0.
%
%    A is symmetric: A' = A.
%
%    Because A is symmetric, it is normal.
%
%    Because A is normal, it is diagonalizable.
%
%    A is integral, therefore det ( A ) is integral, and 
%    det ( A ) * inverse ( A ) is integral.
%
%    The eigenvalues of A are:
%
%      a = sqrt(10405), b = sqrt(26),
%
%      LAMBDA = (-10*a, 0, 510-100*b, 1000, 1000, 510+100*b, 1020, 10*a)
%
%      ( 10*a = 1020.04901843, 510-100*b = 0.09804864072 )
%
%    The eigenvectors are
%
%      ( 2,  1,   1,  2, 102+a, 102+a, -204-2a, -204-2a )
%      ( 1,  2,  -2, -1,    14,    14,       7,       7 )
%      ( 2, -1,   1, -2,   5-b,  -5+b,  -10+2b,   10-2b )
%      ( 7, 14, -14, -7,    -2,    -2,      -1,      -1 )
%      ( 1, -2,  -2,  1,    -2,     2,      -1,       1 )
%      ( 2, -1,   1, -2,   5+b,  -5-b,  -10-2b,   10+2b )
%      ( 1, -2,  -2,  1,     2,    -2,       1,      -1 )
%      ( 2,  1,   1,  2, 102-a, 102-a, -204+2a, -204+2a )
%
%    trace ( A ) = 4040.
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
%    Robert Gregory, David Karney,
%    Example 4.10,
%    A Collection of Matrices for Testing Computational Algorithms,
%    Wiley, 1969, page 61, 
%    LC: QA263.G68.
%
%    Joan Westlake,
%    A Handbook of Numerical Matrix Inversion and Solution of 
%    Linear Equations,
%    John Wiley, 1968,
%    ISBN13: 978-0471936756,
%    LC: QA263.W47.
%
%  Parameters:
%
%    Output, real A(8,8), the matrix.
%
  a = [  611.0,  196.0, -192.0,  407.0,   -8.0,  -52.0,  -49.0,   29.0; ...
         196.0,  899.0,  113.0, -192.0,  -71.0,  -43.0,   -8.0,  -44.0; ...
        -192.0,  113.0,  899.0,  196.0,   61.0,   49.0,    8.0,   52.0; ...
         407.0, -192.0,  196.0,  611.0,    8.0,   44.0,   59.0,  -23.0; ...
          -8.0,  -71.0,   61.0,    8.0,  411.0, -599.0,  208.0,  208.0; ...
         -52.0,  -43.0,   49.0,   44.0, -599.0,  411.0,  208.0,  208.0; ...
         -49.0,   -8.0,    8.0,   59.0,  208.0,  208.0,   99.0, -911.0; ...
          29.0,  -44.0,   52.0,  -23.0,  208.0,  208.0, -911.0,   99.0 ];

  return
end

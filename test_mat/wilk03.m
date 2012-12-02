function a = wilk03 ( )

%*****************************************************************************80
%
%% WILK03 returns the WILK03 matrix.
%
%  Formula:
%
%    1.0D-10  0.9  -0.4
%    0        0.9  -0.4
%    0        0     1.0D-10
%
%  Discussion:
%
%    The linear equation under study is
%      A * X = B,
%    where A is the 3 by 3 Wilkinson matrix, and
%      B = ( 0, 0, 1 )'
%    and the correct solution is
%      X = ( 0, 4.0D+10 / 9.0, 1.0D+10 )
%
%    Since the matrix is already in upper triangular form, errors can
%    occur only in the backsubstitution.
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    A is upper triangular.
%
%    det ( A ) = 0.9D-20
%
%    LAMBDA = ( 1.0D-10, 0.9, 1.0D-10 )
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
%    James Wilkinson,
%    Error Analysis of Direct Methods of Matrix Inversion,
%    Journal of the Association for Computing Machinery,
%    Volume 8, 1961, pages 281-330.
%
%  Parameters:
%
%    Output, real A(3,3), the matrix.
%
  a(1:3,1:3) = [ 1.0E-10,  0.9, -0.4; ...
                 0.0,      0.9, -0.4; ...
                 0.0,      0.0,  1.0E-10 ];

  return
end

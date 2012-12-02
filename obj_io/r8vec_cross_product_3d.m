function v3 = r8vec_cross_product_3d ( v1, v2 )

%*****************************************************************************80
%
%% R8VEC_CROSS_PRODUCT_3D computes the cross product of two R8VEC's in 3D.
%
%  Discussion:
%
%    The cross product in 3D can be regarded as the determinant of the
%    symbolic matrix:
%
%          |  i  j  k |
%      det | x1 y1 z1 |
%          | x2 y2 z2 |
%
%      = ( y1 * z2 - z1 * y2 ) * i
%      + ( z1 * x2 - x1 * z2 ) * j
%      + ( x1 * y2 - y1 * x2 ) * k
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 October 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real V1(3), V2(3), the two vectors.
%
%    Output, real V3(3), the cross product vector.
%
  v3 = zeros ( 3, 1 );

  v3(1) = v1(2) * v2(3) - v1(3) * v2(2);
  v3(2) = v1(3) * v2(1) - v1(1) * v2(3);
  v3(3) = v1(1) * v2(2) - v1(2) * v2(1);

  return
end

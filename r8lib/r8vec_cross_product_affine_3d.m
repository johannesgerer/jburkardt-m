function v3 = r8vec_cross_product_affine_3d ( v0, v1, v2 )

%*****************************************************************************80
%
%% R8VEC_CROSS_PRODUCT_AFFINE_3D computes the affine cross product in 3D.
%
%  Discussion:
%
%    The cross product in 3D can be regarded as the determinant of the
%    symbolic matrix:
%
%          [  i  j  k ]
%      det [ x1 y1 z1 ]
%          [ x2 y2 z2 ]
%
%      = ( y1 * z2 - z1 * y2 ) * i
%      + ( z1 * x2 - x1 * z2 ) * j
%      + ( x1 * y2 - y1 * x2 ) * k
%
%    Here, we use V0 as the base of an affine system so we compute
%    the cross product of (V1-V0) and (V2-V0).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    27 October 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real V0(3), the base vector.
%
%    Input, real V1(3), V2(3), the two vectors.
%
%    Output, real V3(3), the cross product vector
%    ( V1-V0) x (V2-V0).
%
  v3 = zeros ( 3, 1 );

  v3(1) = ( v1(2) - v0(2) ) * ( v2(3) - v0(3) ) ...
        - ( v2(2) - v0(2) ) * ( v1(3) - v0(3) );

  v3(2) = ( v1(3) - v0(3) ) * ( v2(1) - v0(1) ) ...
        - ( v2(3) - v0(3) ) * ( v1(1) - v0(1) );

  v3(3) = ( v1(1) - v0(1) ) * ( v2(2) - v0(2) ) ...
        - ( v2(1) - v0(1) ) * ( v1(2) - v0(2) );

  return
end

function v3 = r8vec_cross_product_2d ( v1, v2 )

%*****************************************************************************80
%
%% R8VEC_CROSS_PRODUCT_2D finds the cross product of a pair of vectors in 2D.
%
%  Discussion:
%
%    Strictly speaking, the vectors V1 and V2 should be considered
%    to lie in a 3D space, both having Z coordinate zero.  The cross 
%    product value V3 then represents the standard cross product vector 
%    (0,0,V3).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 August 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real V1(2), V2(2), the vectors.
%
%    Output, real V3, the cross product.
%
  v3 = v1(1) * v2(2) - v1(2) * v2(1);

  return
end

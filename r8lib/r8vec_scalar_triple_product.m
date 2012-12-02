function value = r8vec_scalar_triple_product ( v1, v2, v3 )

%*****************************************************************************80
%
%% R8VEC_SCALAR_TRIPLE_PRODUCT finds the scalar triple product in 3D.
%
%  Discussion:
%
%    [A,B,C] = A dot ( B cross C )
%            = B dot ( C cross A )
%            = C dot ( A cross B )
%
%    The volume of a parallelepiped, whose sides are given by
%    vectors A, B, and C, is abs ( A dot ( B cross C ) ).
%
%    Three vectors are coplanar if and only if their scalar triple 
%    product vanishes.
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
%  Reference:
%
%    Eric Weisstein,
%    "Scalar Triple Product",
%    CRC Concise Encyclopedia of Mathematics, 1999
%
%  Parameters:
%
%    Input, real V1(3), V2(3), V3(3), the vectors.
%
%    Output, real VALUE, the scalar triple product.
%
  v4 = r8vec_cross_product_3d ( v2, v3 );

  value = v1' * v4;

  return
end

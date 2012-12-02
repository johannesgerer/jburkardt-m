function v = r8vec_vector_triple_product ( v1, v2, v3 )

%*****************************************************************************80
%
%% R8VEC_VECTOR_TRIPLE_PRODUCT computes the vector triple product.
%
%  Discussion:
%
%    VTRIPLE = V1 x ( V2 x V3 )
%
%    VTRIPLE is a vector perpendicular to V1, lying in the plane
%    spanned by V2 and V3.  The norm of VTRIPLE is the product
%    of the norms of V1, V2 and V3.
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
%    Input, real V1(3), V2(3), V3(3), three vectors.
%
%    Output, real V(3), the vector triple product.
%
  v4 = r8vec_cross_product_3d ( v2, v3 );

  v = r8vec_cross_product_3d ( v1, v4 );

  return
end
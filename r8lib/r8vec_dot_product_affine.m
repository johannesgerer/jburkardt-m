function value = r8vec_dot_product_affine ( n, v0, v1, v2 )

%*****************************************************************************80
%
%% R8VEC_DOT_PRODUCT_AFFINE computes the affine dot product V1-V0 * V2-V0.
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
%    Input, integer N, the spatial dimension.
%
%    Input, real V0(N), the base vector.
%
%    Input, real V1(N), V2(N), the vectors.
%
%    Output, real VALUE, the dot product.
%
  value = ( v1(1:n) - v0(1:n) )' * ( v2(1:n) - v0(1:n) );

  return
end

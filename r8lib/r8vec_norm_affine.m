function value = r8vec_norm_affine ( n, v0, v1 )

%*****************************************************************************80
%
%% R8VEC_NORM_AFFINE returns the affine norm of an R8VEC.
%
%  Discussion:
%
%    An R8VEC is a vector of R8's.
%
%    The affine vector L2 norm is defined as:
%
%      R8VEC_NORM_AFFINE(V0,V1) 
%        = sqrt ( sum ( 1 <= I <= N ) ( V1(I) - V0(I) )^2 )
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
%    Input, integer N, the vector dimnension.
%
%    Input, real V0(N), the base vector.
%
%    Input, real V1(N), the vector.
%
%    Output, real VALUE, the affine L2 norm.
%
  value = sqrt ( sum ( ( v0(1:n) - v1(1:n) ).^2 ) );

  return
end

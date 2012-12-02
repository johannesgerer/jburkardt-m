function value = r8vec_i4vec_dot_product ( n, r8vec, i4vec )

%*****************************************************************************80
%
%% R8VEC_I4VEC_DOT_PRODUCT finds the dot product of an R8VEC and an I4VEC.
%
%  Discussion:
%
%    An R8VEC is a vector of R8's.
%
%    An I4VEC is a vector of I4's.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 June 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the dimension of the vectors.
%
%    Input, real R8VEC(N), the first vector.
%
%    Input, integer I4VEC(N), the second vector.
%
%    Output, real R8VEC_I4VEC_DOT_PRODUCT, the dot product.
%
  value = r8vec * i4vec';

  return
end

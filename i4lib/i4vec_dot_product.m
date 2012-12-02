function value = i4vec_dot_product ( n, x, y )

%*****************************************************************************80
%
%% I4VEC_DOT_PRODUCT computes the dot product of two I4VEC's.
%
%  Discussion:
%
%    An I4VEC is a vector of I4's.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 December 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the size of the array.
%
%    Input, integer X(N), Y(N), the arrays.
%
%    Output, integer I4VEC_DOT_PRODUCT, the dot product of X and Y.
%
  value = x' * y;

  return
end

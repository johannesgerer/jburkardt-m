function c = i4vec_add ( n, a, b )

%*****************************************************************************80
%
%% I4VEC_ADD computes C = A + B for I4VEC's.
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
%    28 April 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries.
%
%    Input, integer A(N), the first vector.
%
%    Input, integer B(N), the second vector.
%
%    Output, integer C(N), the sum of the vectors.
%
  c(1:n) = a(1:n) + b(1:n);

  return
end

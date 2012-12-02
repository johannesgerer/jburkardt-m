function value = i4vec_any_lt ( n, a, b )

%*****************************************************************************80
%
%% I4VEC_ANY_LT: ( any ( A < B ) ) for I4VEC's.
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
%    Output, logical I4VEC_ANY_LT is 1 if any entry
%    of A is less than the corresponding entry of B.
%
  value = any ( a(1:n) < b(1:n) );

  return
end

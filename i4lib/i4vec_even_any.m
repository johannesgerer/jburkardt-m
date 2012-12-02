function value = i4vec_even_any ( n, a )

%*****************************************************************************80
%
%% I4VEC_EVEN_ANY is TRUE if any entry of an I4VEC is even.
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
%    17 April 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the vector.
%
%    Input, integer A(N), the vector.
%
%    Output, logical VALUE, TRUE if any entry is even.
%
  value = any ( mod ( a(1:n), 2 ) == 0 );

  return
end

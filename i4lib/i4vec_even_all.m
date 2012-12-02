function value = i4vec_even_all ( n, a )

%*****************************************************************************80
%
%% I4VEC_EVEN_ALL is TRUE if all entries of an I4VEC are even.
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
%    Output, logical VALUE, TRUE if all entries are even.
%
  value = all ( mod ( a(1:n), 2 ) == 0 );

  return
end

function value = i4vec_odd_all ( n, a )

%*****************************************************************************80
%
%% I4VEC_ODD_ALL is TRUE if all entries of an I4VEC are odd.
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
%    Output, logical VALUE, TRUE if all entries are odd.
%
  value = all ( mod ( a(1:n), 2 ) == 1 );

  return
end

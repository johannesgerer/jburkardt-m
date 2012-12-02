function value = i4vec_any_negative ( n, a )

%*****************************************************************************80
%
%% I4VEC_ANY_NEGATIVE: ( any A < 0 ) for I4VEC's.
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
%    25 December 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries.
%
%    Input, integer A(N), the vector.
%
%    Output, logical VALUE is TRUE if any entry is negative.
%
  value = any ( a(1:n) < 0 );

  return
end

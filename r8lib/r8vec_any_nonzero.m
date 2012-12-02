function value = r8vec_any_nonzero ( n, a )

%*****************************************************************************80
%
%% R8VEC_ANY_NONZERO: ( any A nonzero ) for R8VEC's.
%
%  Discussion:
%
%    An R8VEC is a vector of R8's.
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
%    Input, real A(N), the vector.
%
%    Output, logical R8VEC_ANY_NONZERO is TRUE if any entry is nonzero.
%
  value = any ( a(1:n) ~= 0.0 );

  return
end

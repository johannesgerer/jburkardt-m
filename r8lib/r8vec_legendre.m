function x = r8vec_legendre ( n, x_first, x_last )

%*****************************************************************************80
%
%% R8VEC_LEGENDRE creates a vector of Legendre-spaced values.
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
%    17 June 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the vector.
%
%    Input, real X_FIRST, X_LAST, the first and last entries.
%
%    Output, real X(N), a vector of Legendre-spaced data.
%
  x = legendre_zeros ( n );

  x(1:n) = ( ( 1.0 - x(1:n) ) * x_first  ...
           + ( 1.0 + x(1:n) ) * x_last ) ...
           /   2.0;

  return
end

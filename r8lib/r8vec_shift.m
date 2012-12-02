function x = r8vec_shift ( shift, x )

%*****************************************************************************80
%
%% R8VEC_SHIFT performs a shift on an R8VEC.
%
%  Discussion:
%
%    An R8VEC is a vector of R8 values.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 March 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer SHIFT, the amount by which each entry is to
%    be shifted.  SHIFT should be nonnegative.
%
%    Input/output, real X(N), the vector to be shifted.
%
  y(1:n) = x(1:n);

  x = zeros ( size ( x ) );

  ilo = max ( 1, 1 + shift );
  ihi = min ( n, n + shift );

  x(ilo:ihi) = y(ilo-shift:ihi-shift);

  return
end

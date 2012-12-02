function x = chebyshev_zeros ( n )

%*****************************************************************************80
%
%% CHEBYSHEV_ZEROS returns zeroes of the Chebyshev polynomial T(N)(X).
%
%  Discussion:
%
%    We produce the Chebyshev zeros in ascending order.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 September 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the polynomial.
%
%    Output, real X(N), the zeroes of T(N)(X).
%
  angle = ( ( 2 * n - 1 ) : -2 : 1 ) * pi / ( 2 * n );
  angle = angle';
  x = cos ( angle );

  return
end

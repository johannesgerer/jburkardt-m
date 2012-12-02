function fx = nannulus ( n, x )

%*****************************************************************************80
%
%% NANNULUS evaluates the negative annulus function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 December 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of points.
%
%    Input, real X(N,2), the point coordinates.
%
%    Output, real FX(N), the function values.
%
  fx = zeros ( n, 1 );

  c1 = 0.25 * ones ( n, 2 );
  r1 = 0.5 * ones ( n, 1 );

  c2 = 0.0 * ones ( n, 2 );
  r2 = 1.0 * ones ( n, 1 );

  a = ( sqrt ( sum ( ( x - c1 ) .* ( x - c1 ), 2 ) ) ) - r1;
  b = r2 - ( sqrt ( sum ( ( x - c2 ) .* ( x - c2 ), 2 ) ) );

  fx = - a .* b;

  return
end

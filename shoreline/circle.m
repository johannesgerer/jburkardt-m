function fx = circle ( n, x )

%*****************************************************************************80
%
%% CIRCLE evaluates the circle function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 January 2011
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
  global c
  global r

  if ( isempty ( c ) )
    c = [ 0.0, 0.5 ];
  end

  if ( isempty ( r ) )
    r = 0.5;
  end

  nc = ones ( n, 1 ) * c;
  nr = ones ( n, 1 ) * r;

  fx = nr - sqrt ( sum ( ( x - nc ).^2, 2 ) );

  return
end

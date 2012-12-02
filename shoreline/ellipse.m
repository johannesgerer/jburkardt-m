function fx = ellipse ( n, x )

%*****************************************************************************80
%
%% ELLIPSE evaluates the ellipse function.
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
  global angle
  global c
  global r1
  global r2

  if ( isempty ( angle ) )
    angle = pi / 6.0;
  end

  if ( isempty ( c ) )
    c = [ 0.0, 0.5 ];
  end

  if ( isempty ( r1 ) )
    r1 = 0.5;
  end

  if ( isempty ( r2 ) )
    r2 = 0.125;
  end

  nc = ones ( n, 1 ) * c;
  nr = ones ( n, 1 ) * r1 * r2;
%
%  Moronic COS problems again!
%
  ca = cos ( angle );
  sa = sin ( angle );

  aa = [  ca, - sa; ...
          sa,   ca ];

  rr = [ r2^2, 0.0; ...
         0.0,  r1^2 ];

  fx = nr - sqrt ( sum ( ( x * aa - nc ).^2 * rr, 2 ) );

  return
end

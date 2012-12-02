function x = ellipse_rs ( r, s, i )

%*****************************************************************************80
%
%% ELLIPSE_RS maps the boundary of the unit square to an ellipse.
%
%  Discussion:
%
%    The ellipse is ( 3 * cos ( THETA ), 2 * sin ( THETA ) ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 October 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real R, S, the coordinates of a point that lies on the
%    boundary of the square.
%
%    Input, integer I, the component of the data which is to be returned.
%
%    Output, real X, the I-th component of the data vector X, evaluated
%    at the point (R,S), which is on a corner, or edge, of the unit square.
%
  if ( r == 0.0 )
    theta = 0.25 * pi * ( 5.0 * ( 1.0 - s ) + 3.0 * s  );
  elseif ( r == 1.0 ) then
    theta = 0.25 * pi * ( - 1.0 * ( 1.0 - s ) + 1.0 * s );
  elseif ( s == 0.0 ) then
    theta = 0.25 * pi * ( 5.0 * ( 1.0 - r ) + 7.0 * r );
  elseif ( s == 1.0 ) then
    theta = 0.25 * pi * ( 3.0 * ( 1.0 - r ) + 1.0 * r );
  end

  if ( i == 1 )

    x = 3.0 * cos ( theta );

  elseif ( i == 2 ) then

    x = 2.0 * sin ( theta );

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'ELLIPSE_RS - Fatal error!\n' );
    fprintf ( 1, '  Illegal component index I = %d\n', i );
    error ( 'ELLIPSE_RS - Fatal error!' );

  end

  return
end

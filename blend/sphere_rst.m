function x = sphere_rst ( r, s, t, i )

%*****************************************************************************80
%
%% SPHERE_RST maps the boundary of the unit cube to a sphere.
%
%  Discussion:
%
%    The sphere is
%      x = cos ( theta ) * cos ( phi )
%      y = sin ( theta ) * cos ( phi )
%      z = sin ( phi )
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

%
%  Compute length of vector from ( 0.5, 0.5, 0.5 ) to ( r, s, t )
%
  norm = sqrt ( ( r - 0.5 )^2 + ( s - 0.5 )^2 + ( t - 0.5 )^2 );
%
%  Compute ( x, y, z ) coordinates of a point on the sphere
%  ( x - 0.5 )**2 + ( y - 0.5 )**2 + ( z - 0.5 )**2 = 0.25 that is
%  the projection of the point ( r, s, t ) on the unit cube.
%
  if ( i == 1 )

    x = 0.5 + 0.5 * ( r - 0.5 ) / norm;

  elseif ( i == 2 )

    x = 0.5 + 0.5 * ( s - 0.5 ) / norm;

  elseif ( i == 3 )

    x = 0.5 + 0.5 * ( t - 0.5 ) / norm;

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'SPHERE_RST - Fatal error!\n' );
    fprintf ( 1, '  Illegal component index I = %d\n', i );
    error ( 'SPHERE_RST - Fatal error!' );

  end

  return
end

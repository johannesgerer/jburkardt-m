function xy = polar_to_xy ( r, t )

%*****************************************************************************80
%
%% POLAR_TO_XY converts polar coordinates to XY coordinates.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 December 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real R, T, the radius and angle (in radians).
%
%    Output, real XY(2,1), the Cartesian coordinates.
%
  xy(1,1) = r * cos ( t );
  xy(2,1) = r * sin ( t );

  return
end

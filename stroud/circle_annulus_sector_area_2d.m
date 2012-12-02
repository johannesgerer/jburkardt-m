function value = circle_annulus_sector_area_2d ( radius1, radius2, theta1, theta2 )

%*****************************************************************************80
%
%% CIRCLE_ANNULUS_SECTOR_AREA_2D returns the area of a circular annulus sector in 2D.
%
%  Discussion:
%
%    A circular annulus sector comprises the area between two concentric
%    circles and two concentric rays.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    20 May 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real RADIUS1, RADIUS2, the radii of the circles.
%
%    Input, real THETA1, THETA2, the angles of the rays.
%    Ordinarily, (THETA2-THETA1) is between 0 and 2*PI.
%
%    Output, real CIRCLE_ANNULUS_SECTOR_AREA_2D, the area of the
%    circular annulus sector.
%
  value = 0.5 * ( radius1 + radius2 ) * ( radius2 - radius1 ) * ( theta2 - theta1 );

  return
end

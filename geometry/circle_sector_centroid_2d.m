function centroid = circle_sector_centroid_2d ( r, center, theta1, theta2 )

%*****************************************************************************80
%
%% CIRCLE_SECTOR_CENTROID_2D returns the centroid of a circular sector in 2D.
%
%  Discussion:
%
%    A circular sector is formed by a circular arc, and the two straight line
%    segments that join its ends to the center of the circle.
%
%    A circular sector is defined by
%
%      ( X - CENTER(1) )^2 + ( Y - CENTER(2) )^2 = R^2
%
%    and
%
%      Theta1 <= Theta <= Theta2
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
%  Reference:
%
%    Adrian Bowyer and John Woodwark,
%    A Programmer's Geometry,
%    Butterworths, 1983.
%
%  Parameters:
%
%    Input, real R, the radius of the circle.
%
%    Input, real CENTER(2,1), the center of the circle.
%
%    Input, real THETA1, THETA2, the angles defining the arc,
%    in radians.  Normally, THETA1 < THETA2.
%
%    Output, real CENTROID(2,1), the coordinates of the centroid
%    of the sector.
%
  theta = theta2 - theta1;

  if ( theta == 0.0 )
    d = 2.0 * r / 3.0;
  else
    d = 4.0 * r * sin ( 0.5 * theta ) / ( 3.0 * theta );
  end

  centroid(1,1) = center(1,1) + d * cos ( theta );
  centroid(2,1) = center(2,1) + d * sin ( theta );

  return
end

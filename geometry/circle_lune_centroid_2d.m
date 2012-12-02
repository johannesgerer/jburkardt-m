function centroid = circle_lune_centroid_2d ( r, center, theta1, theta2 )

%*****************************************************************************80
%
%% CIRCLE_LUNE_CENTROID_2D returns the centroid of a circular lune in 2D.
%
%  Discussion:
%
%    A lune is formed by drawing a circular arc, and joining its endpoints.
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
%    of the lune.
%
  theta = theta2 - theta1;

  if ( theta == 0.0 )
    d = r;
  else
    d = 4.0 * r * ( sin ( 0.5 * theta ) ).^3 / ...
      ( 3.0 * ( theta - sin ( theta ) ) );
  end

  centroid(1,1) = center(1,1) + d * cos ( theta );
  centroid(2,1) = center(2,1) + d * sin ( theta );

  return
end

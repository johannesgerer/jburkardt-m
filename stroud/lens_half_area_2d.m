function value = lens_half_area_2d ( r, theta1, theta2 )

%*****************************************************************************80
%
%% LENS_HALF_AREA_2D returns the area of a circular half lens in 2D.
%
%  Discussion:
%
%    A circular half lens is formed by drawing a circular arc, and joining its endpoints.
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
%    Input, real R, the radius of the circle.
%
%    Input, real THETA1, THETA2, the angles of the rays
%    that begin and end the arc.
%
%    Output, real HALF_LENS_AREA_2D, the area of the half lens.
%
  sector = circle_sector_area_2d ( r, theta1, theta2 );
  triangle = circle_triangle_area_2d ( r, theta1, theta2 );
  value = sector - triangle;

  return
end

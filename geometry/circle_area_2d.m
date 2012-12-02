function value = circle_area_2d ( r )

%*****************************************************************************80
%
%% CIRCLE_AREA_2D returns the area of a circle in 2D.
%
%  Integration region:
%
%    Points (X,Y) such that
%
%      ( X - XC )**2 + ( Y - YC )**2 <= R**2
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
%    Output, real CIRCLE_AREA_2D, the area of the circle.
%
  value = pi * r * r;

  return
end

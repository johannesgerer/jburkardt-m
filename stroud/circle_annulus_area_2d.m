function value = circle_annulus_area_2d ( radius1, radius2 )

%*****************************************************************************80
%
%% CIRCLE_ANNULUS_AREA_2D returns the area of a circular annulus in 2D.
%
%  Integration region:
%
%    Points (X,Y) such that
%
%      RADIUS1**2 <= ( X - XC )**2 + ( Y - YC )**2 <= RADIUS2**2
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
%    Output, real CIRCLE_ANNULUS_AREA_2D, the area of the annulus.
%
  value = pi * ( radius1 + radius2 ) * ( radius2 - radius1 );

  return
end

function value = ellipse_area_2d ( r1, r2 )

%*****************************************************************************80
%
%% ELLIPSE_AREA_2D returns the area of an ellipse in 2D.
%
%  Integration region:
%
%    Points (X,Y) such that
%
%      ( ( X - XC ) / R1 )**2 + ( ( Y - YC ) / R2 )**2 <= 1
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
%    Input, real R1, R2, the major and minor semi-axes.
%
%    Output, real ELLIPSE_AREA_2D, the area of the ellipse.
%
  value = pi * r1 * r2;

  return
end

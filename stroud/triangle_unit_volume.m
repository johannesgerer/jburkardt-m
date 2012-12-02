function value = triangle_unit_volume ( )

%*****************************************************************************80
%
%% TRIANGLE_UNIT_VOLUME returns the "volume" of the unit triangle in 2D.
%
%  Integration region:
%
%    Points (X,Y) such that
%
%      0 <= X,
%      0 <= Y, and
%      X + Y <= 1.
%
%  Discussion:
%
%    The "volume" of a triangle is usually called its area.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    26 May 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real TRIANGLE_UNIT_VOLUME, the volume of the unit
%    triangle.
%
  value = 1.0 / 2.0;

  return
end

function value = triangle_unit_volume ( )

%*****************************************************************************80
%
%% TRIANGLE_UNIT_VOLUME returns the "volume" of the unit triangle.
%
%  Discussion:
%
%    The "volume" of a triangle is usually called its area.
%
%    The integration region is:
%
%      0 <= X,
%      0 <= Y, and
%      X + Y <= 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    12 April 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real VALUE, the volume.
%
  value = 1.0 / 2.0;

  return
end

function value = hexagon_area_2d ( r )

%*****************************************************************************80
%
%% HEXAGON_AREA_2D returns the area of a regular hexagon in 2D.
%
%  Discussion:
%
%    The formula for the area only requires the radius, and does
%    not depend on the location of the center, or the orientation
%    of the hexagon.
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
%    Input, real R, the radius of the hexagon.
%
%    Output, real HEXAGON_AREA_2D, the area of the hexagon.
%
  value = r * r * hexagon_unit_area_2d ( );

  return
end

function value = hexagon_unit_area_2d

%*****************************************************************************80
%
%% HEXAGON_UNIT_AREA_2D returns the area of a unit regular hexagon in 2D.
%
%  Integration region:
%
%    The definition is given in terms of THETA, the angle in degrees of the
%    vector (X,Y).  The following six conditions apply, respectively,
%    between the bracketing values of THETA of 0, 60, 120, 180, 240,
%    300, and 360.
%
%                              0 <= Y <= - SQRT(3) * X + SQRT(3)
%                              0 <= Y <=                 SQRT(3)/2
%                              0 <= Y <=   SQRT(3) * X + SQRT(3)
%      - SQRT(3) * X - SQRT(3)   <= Y <= 0
%                    - SQRT(3)/2 <= Y <= 0
%        SQRT(3) * X - SQRT(3)   <= Y <= 0
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
%    Output, real HEXAGON_UNIT_AREA_2D, the area of the hexagon.
%
  value = 3.0 * sqrt ( 3.0 ) / 2.0;

  return
end

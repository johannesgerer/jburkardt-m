function dist = line_par_point_dist_3d ( f, g, h, x0, y0, z0, p )

%*****************************************************************************80
%
%% LINE_PAR_POINT_DIST_3D: distance ( parametric line, point ) in 3D.
%
%  Discussion:
%
%    The parametric form of a line in 3D is:
%
%      X = X0 + F * T
%      Y = Y0 + G * T
%      Z = Z0 + H * T
%
%    We normalize by choosing F*F+G*G+H*H=1 and 0 <= F.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 February 2005
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
%    Input, real F, G, H, X0, Y0, Z0, the parametric line
%    parameters.
%
%    Input, real P(3,1), the point whose distance from the line is
%    to be measured.
%
%    Output, real DIST, the distance from the point to the line.
%
  dx =   g * ( f * ( p(2,1) - y0 ) - g * ( p(1,1) - x0 ) ) ...
       + h * ( f * ( p(3,1) - z0 ) - h * ( p(1,1) - x0 ) );

  dy =   h * ( g * ( p(3,1) - z0 ) - h * ( p(2,1) - y0 ) ) ...
       - f * ( f * ( p(2,1) - y0 ) - g * ( p(1,1) - x0 ) );

  dz = - f * ( f * ( p(3,1) - z0 ) - h * ( p(1,1) - x0 ) ) ...
       - g * ( g * ( p(3,1) - z0 ) - h * ( p(2,1) - y0 ) );

  dist = sqrt ( dx * dx + dy * dy + dz * dz ) ...
    / ( f * f + g * g + h * h );

  return
end

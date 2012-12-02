function dist = lines_par_dist_3d ( f1, g1, h1, x01, y01, z01, f2, g2, h2, ...
  x02, y02, z02 )

%*****************************************************************************80
%
%% LINES_PAR_DIST_3D finds the distance between two parametric lines in 3D.
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
%    This code does not work for parallel or near parallel lines.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 February 2005
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
%    Input, real F1, G1, H1, X01, Y01, Z01, the parametric
%    parameters of the first line.
%
%    Input, real F2, G2, H2, X02, Y02, Z02, the parametric
%    parameters of the second line.
%
%    Output, real DIST, the distance between the two lines.
%
  dist = abs ( ( x02 - x01 ) * ( g1 * h2 - g2 * h1 ) ...
             + ( y02 - y01 ) * ( h1 * f2 - h2 * f1 ) ...
             + ( z02 - z01 ) * ( f1 * g2 - f2 * g1 ) )  / ...
             ( ( f1 * g2 - f2 * g1 ).^2 ...
             + ( g1 * h2 - g2 * h1 ).^2 ...
             + ( h1 * f2 - h2 * f1 ).^2 );

  return
end

function theta = lines_par_angle_3d ( f1, g1, h1, x01, y01, z01, f2, g2, h2, ...
  x02, y02, z02 )

%*****************************************************************************80
%
%% LINES_PAR_ANGLE_3D finds the angle between two parametric lines in 3D.
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
%    Output, real THETA, the angle between the two lines.
%
  pdotq = f1 * f2 + g1 * g2 + h1 * h2;
  pnorm = sqrt ( f1 * f1 + g1 * g1 + h1 * h1 );
  qnorm = sqrt ( f2 * f2 + g2 * g2 + h2 * h2 );

  theta = r8_acos ( pdotq / ( pnorm * qnorm ) );

  return
end

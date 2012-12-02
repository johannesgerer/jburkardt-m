function theta = lines_par_angle_2d ( f1, g1, x01, y01, f2, g2, x02, y02 )

%*****************************************************************************80
%
%% LINES_PAR_ANGLE_2D finds the angle between two parametric lines in 2D.
%
%  Discussion:
%
%    The parametric form of a line in 2D is:
%
%      X = X0 + F * T
%      Y = Y0 + G * T
%
%    We normalize by choosing F*F+G*G=1 and 0 <= F.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 July 2006
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
%    Input, real F1, G1, X01, Y01, the parametric parameters of the
%    first line.
%
%    Input, real F2, G2, X02, Y02, the parametric parameters of the
%    second line.
%
%    Output, real THETA, the angle between the two lines.
%
  pdotq = f1 * f2 + g1 * g2;
  pnorm = sqrt ( f1 * f1 + g1 * g1 );
  qnorm = sqrt ( f2 * f2 + g2 * g2 );

  theta = r8_acos ( pdotq / ( pnorm * qnorm ) );

  return
end

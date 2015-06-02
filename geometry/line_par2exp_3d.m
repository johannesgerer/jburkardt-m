function [ p1, p2 ] = line_par2exp_3d ( f, g, h, x0, y0, z0 )

%*****************************************************************************80
%
%% LINE_PAR2EXP_3D converts a parametric line to explicit form in 3D.
%
%  Discussion:
%
%    The parametric form of a line in 3D is:
%
%      X = X0 + F * T
%      Y = Y0 + G * T
%      Z = Z0 + H * T
%
%    We may normalize by choosing F*F+G*G+H*H=1 and 0 <= F.
%
%    The explicit form of a line in 3D is:
%
%      the line through the points P1, P2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 April 2013
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
%    Input, real F, G, H, X0, Y0, Z0, the parametric line parameters.
%
%    Output, real P1(3,1), P2(3,1), two points on the line.
%
  p1(1,1) = x0;
  p1(2,1) = y0;
  p1(3,1) = z0;

  p2(1,1) = p1(1,1) + f;
  p2(2,1) = p1(2,1) + g;
  p2(3,1) = p1(3,1) + h;

  return
end

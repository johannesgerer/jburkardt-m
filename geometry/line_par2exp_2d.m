function [ p1, p2 ] = line_par2exp_2d ( f, g, x0, y0 )

%*****************************************************************************80
%
%% LINE_PAR2EXP_2D converts a parametric line to explicit form in 2D.
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
%    The explicit form of a line in 2D is:
%
%      ( P1, P2 ) = ( (X1,Y1), (X2,Y2) )
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
%    Input, real F, G, X0, Y0, the parametric line parameters.
%
%    Output, real P1(2,1), P2(2,1), two points on the line.
%
  p1(1,1) = x0;
  p1(2,1) = y0;

  p2(1,1) = p1(1,1) + f;
  p2(2,1) = p1(2,1) + g;

  return
end

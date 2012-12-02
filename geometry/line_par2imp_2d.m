function [ a, b, c ] = line_par2imp_2d ( f, g, x0, y0 )

%*****************************************************************************80
%
%% LINE_PAR2IMP_2D converts a parametric line to implicit form in 2D.
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
%    The implicit form of a line in 2D is:
%
%      A * X + B * Y + C = 0
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
%    Input, real F, G, X0, Y0, the parametric line parameters.
%
%    Output, real A, B, C, the implicit line parameters.
%
  a = -g;
  b = f;
  c = g * x0 - f * y0;

  return
end

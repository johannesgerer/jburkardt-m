function value = ellipse_area2 ( a, b, c, d )

%*****************************************************************************80
%
%% ELLIPSE_AREA2 returns the area of an ellipse defined by an equation.
%
%  Discussion:
%
%    The ellipse is described by the formula
%      a x^2 + b xy + c y^2 = d
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 August 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, C, coefficients on the left hand side.
%
%    Input, real D, the right hand side.
%
%    Output, real VALUE, the area of the ellipse.
%
  value = d * pi / ( 4.0 * a * c - b * b );

  return
end

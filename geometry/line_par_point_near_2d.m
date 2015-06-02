function pn = line_par_point_near_2d ( f, g, x0, y0, p )

%*****************************************************************************80
%
%% LINE_PAR_POINT_NEAR_2D: nearest point on parametric line to given point, 2D.
%
%  Discussion:
%
%    The parametric form of a line in 2D is:
%
%      X = X0 + F * T
%      Y = Y0 + G * T
%
%    We may normalize by choosing F*F + G*G = 1, and F nonnegative.
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
%    Adrian Bowyer, John Woodwark,
%    A Programmer's Geometry,
%    Butterworths, 1983,
%    ISBN: 0408012420.
%
%  Parameters:
%
%    Input, real F, G, X0, Y0, the parametric line parameters.
%
%    Input, real P(2,1), the point whose distance from the line is
%    to be measured.
%
%    Output, real PN(2,1), the point on the parametric line which
%    is nearest to P.
%
  t = ( f * ( p(1) - x0 ) + g * ( p(2) - y0 ) ) / ( f * f + g * g );

  pn(1,1) = x0 + t * f;
  pn(2,1) = y0 + t * g;

  return
end

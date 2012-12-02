function [ f, g, x, y ] = points_bisect_line_par_2d ( p1, p2 )

%*****************************************************************************80
%
%% POINTS_BISECT_LINE_PAR_2D: parametric bisector line between points in 2D.
%
%  Discussion:
%
%    This routine finds, in parametric form, the equation of the line
%    that is equidistant from two points.
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
%    28 February 2005
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
%    Input, real P1(2), P2(2), two points.
%
%    Output, real F, G, X, Y, the parameters of the parametric line
%    equidistant from both points.
%
  dim_num = 2;

  f = 0.5 * ( p1(1) + p2(1) );
  g = 0.5 * ( p1(2) + p2(2) );

  norm = sqrt ( f * f + g * g );

  if ( 0.0 < norm )
    f = f / norm;
    g = g / norm;
  end

  if ( f < 0.0 )
    f = -f;
    g = -g;
  end

  x = - ( p2(2) - p1(2) );
  y = + ( p2(1) - p1(1) );

  return
end

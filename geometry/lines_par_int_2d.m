function [ t1, t2, pi ] = lines_par_int_2d ( f1, g1, x1, y1, f2, g2, ...
  x2, y2 )

%*****************************************************************************80
%
%% LINES_PAR_INT_2D determines where two parametric lines intersect in 2D.
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
%    Input, real F1, G1, X1, Y1, define the first parametric line.
%
%    Input, real F2, G2, X2, Y2, define the second parametric line.
%
%    Output, real T1, T2, the T parameters on the first and second
%    lines of the intersection point.
%
%    Output, real PI(2,1), the intersection point.
%
  det = f2 * g1 - f1 * g2;

  if ( det == 0.0 )
    t1 = 0.0;
    t2 = 0.0;
    pi = [];
  else
    t1 = ( f2 * ( y2 - y1 ) - g2 * ( x2 - x1 ) ) / det;
    t2 = ( f1 * ( y2 - y1 ) - g1 * ( x2 - x1 ) ) / det;
    pi(1,1) = x1 + f1 * t1;
    pi(2,1) = y1 + g1 * t1;
  end

  return
end

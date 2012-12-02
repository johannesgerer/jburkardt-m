function [ a, b, c ] = points_bisect_line_imp_2d ( p1, p2 )

%*****************************************************************************80
%
%% POINTS_BISECT_LINE_IMP_2D: implicit bisector line between two points in 2D.
%
%  Discussion:
%
%    This routine finds, in implicit form, the equation of the line
%    that is equidistant from two points.
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
%    19 February 2005
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
%    Input, real P1(2), P2(2), the coordinates of two points.
%
%    Output, real A, B, C, the parameters of the implicit line
%    equidistant from both points.
%
  dim_num = 2;

  a = p1(1) - p2(1);
  b = p1(2) - p2(2);
  c = - 0.5 * ( sum ( p1(1:dim_num).^2 ) - sum ( p2(1:dim_num).^2 ) );

  return
end

function [ p1, p2, p3 ] = circle_imp2exp_2d ( r, pc )

%*****************************************************************************80
%
%% CIRCLE_IMP2EXP_2D converts a circle from implicit to explicit form in 2D.
%
%  Discussion:
%
%    Points P on an implicit circle in 2D satisfy the equation:
%
%      ( P(1) - PC(1) )^2 + ( P(2) - PC(2) )^2 = R^2
%
%    The explicit form of a circle in 2D is:
%
%      The circle passing through points P1, P2 and P3.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 December 2010
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Joseph ORourke,
%    Computational Geometry,
%    Second Edition,
%    Cambridge, 1998,
%    ISBN: 0521649765,
%    LC: QA448.D38.
%
%  Parameters:
%
%    Input, real R, PC(2,1), the radius and center of the circle.
%
%    Output, real P1(2,1), P2(2,1), P3(2,1), three points on the circle.
%
  theta = 0.0;
  p1(1,1) = pc(1,1) + r * cos ( theta );
  p1(2,1) = pc(2,1) + r * sin ( theta );

  theta = 2.0 * pi / 3.0;
  p2(1,1) = pc(1,1) + r * cos ( theta );
  p2(2,1) = pc(2,1) + r * sin ( theta );

  theta = 4.0 * pi / 3.0;
  p3(1,1) = pc(1,1) + r * cos ( theta );
  p3(2,1) = pc(2,1) + r * sin ( theta );

  return
end

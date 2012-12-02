function [ p4, flag ] = line_exp_perp_2d ( p1, p2, p3 )

%*****************************************************************************80
%
%% LINE_EXP_PERP_2D computes a line perpendicular to a line and through a point.
%
%  Discussion:
%
%    The explicit form of a line in 2D is:
%
%      ( P1, P2 ) = ( (X1,Y1), (X2,Y2) ).
%
%    The input point P3 should NOT lie on the line (P1,P2).  If it
%    does, then the output value P4 will equal P3.
%
%    P1-----P4-----------P2
%            |
%            |
%           P3
%
%    P4 is also the nearest point on the line (P1,P2) to the point P3.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 July 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real P1(2,1), P2(2,1), two points on the line.
%
%    Input, real P3(2,1), a point (presumably not on the
%    line (P1,P2)), through which the perpendicular must pass.
%
%    Output, real P4(2,1), a point on the line (P1,P2),
%    such that the line (P3,P4) is perpendicular to the line (P1,P2).
%
%    Output, logical FLAG, is TRUE if the value could not be computed.
%
  dim_num = 2;

  bot = sum ( ( p2(1:dim_num,1) - p1(1:dim_num,1) ).^2 );

  if ( bot == 0.0 )
    p4(1:2,1) = Inf;
    flag = 1;
  end
%
%  (P3-P1) dot (P2-P1) = Norm(P3-P1) * Norm(P2-P1) * Cos(Theta).
%
%  (P3-P1) dot (P2-P1) / Norm(P3-P1)**2 = normalized coordinate T
%  of the projection of (P3-P1) onto (P2-P1).
%
  t = sum ( ( p1(1:dim_num,1) - p3(1:dim_num,1) ) ...
    .* ( p1(1:dim_num,1) - p2(1:dim_num,1) ) ) / bot;

  p4(1:dim_num,1) = p1(1:dim_num,1) + t * ( p2(1:dim_num,1) - p1(1:dim_num,1) );
  flag = 0;

  return
end

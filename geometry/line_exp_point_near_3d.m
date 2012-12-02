function [ pn, dist, t ] = line_exp_point_near_3d ( p1, p2, p )

%*****************************************************************************80
%
%% LINE_EXP_POINT_NEAR_3D: nearest point on explicit line to point in 3D.
%
%  Discussion:
%
%    The explicit form of a line in 3D is:
%
%      ( P1, P2 ).
%
%    The nearest point PN has the form:
%
%      PN = ( 1 - T ) * P1 + T * P2.
%
%    If T is less than 0, PN is furthest away from P2.
%    If T is between 0 and 1, PN is between P1 and P2.
%    If T is greater than 1, PN is furthest away from P1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real P1(3,1), P2(3,1), two points on the line.
%
%    Input, real P(3,1), the point whose nearest neighbor on
%    the line is to be determined.
%
%    Output, real PN(3,1), the point which is the nearest
%    point on the line to P.
%
%    Output, real DIST, the distance from the point to the
%    nearest point on the line.
%
%    Output, real T, the relative position of the point
%    PN to P1 and P2.
%
  dim_num = 3;

  bot = sum ( ( p2(1:dim_num,1) - p1(1:dim_num,1) ).^2 );

  if ( bot == 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LINE_EXP_POINT_NEAR_3D - Fatal error!\n' );
    fprintf ( 1, '  The points P1 and P2 are identical.\n' );
    error ( 'LINE_EXP_POINT_NEAR_3D - Fatal error!' );
  end
%
%  (P-P1) dot (P2-P1) = Norm(P-P1) * Norm(P2-P1) * Cos(Theta).
%
%  (P-P1) dot (P2-P1) / Norm(P-P1)**2 = normalized coordinate T
%  of the projection of (P-P1) onto (P2-P1).
%
  t = ( p(1:dim_num,1) - p1(1:dim_num,1) )' ...
    * ( p2(1:dim_num,1) - p1(1:dim_num,1) ) / bot;
%
%  Now compute the location of the projection point.
%
  pn(1:dim_num,1) = p1(1:dim_num,1) + t * ( p2(1:dim_num,1) - p1(1:dim_num,1) );
%
%  Now compute the distance between the projection point and P.
%
  dist = sqrt ( sum ( ( pn(1:dim_num,1) - p(1:dim_num,1) ).^2 ) );

  return
end

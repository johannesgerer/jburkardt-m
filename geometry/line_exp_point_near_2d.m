function [ pn, dist, t ] = line_exp_point_near_2d ( p1, p2, p )

%*****************************************************************************80
%
%% LINE_EXP_POINT_NEAR_2D computes the point on an explicit line nearest a point in 2D.
%
%  Discussion:
%
%    The explicit form of a line in 2D is:
%
%      ( P1, P2 ) = ( (X1,Y1), (X2,Y2) ).
%
%    The nearest point PN = (XN,YN) has the form:
%
%      PN = (1-T) * P1 + T * P2.
%
%    If T is less than 0, PN is furthest from P2.
%    If T is between 0 and 1, PN is between P1 and P2.
%    If T is greater than 1, PN is furthest from P1.
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
%    Input, real P1(2,1), P2(2,1), two points on the line.
%
%    Input, real P(2,1), the point whose nearest neighbor on the
%    line is to be determined.
%
%    Output, real PN(2,1), the nearest point on the line to (X,Y).
%
%    Output, real DIST, the distance from the point to the line.
%
%    Output, real T, the relative position of the point
%    (XN,YN) to the points (X1,Y1) and (X2,Y2).
%
  dim_num = 2;

  bot = sum ( ( p2(1:dim_num,1) - p1(1:dim_num,1) ).^2 );

  if ( bot == 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LINE_POINT_NEAR_2D - Fatal error!\n' );
    fprintf ( 1, '  The points P1 and P2 are identical.\n' );
    error ( 'LINE_POINT_NEAR_2D - Fatal error!' );
  end
%
%  (P-P1) dot (P2-P1) = Norm(P-P1) * Norm(P2-P1) * Cos(Theta).
%
%  (P-P1) dot (P2-P1) / Norm(P-P1)**2 = normalized coordinate T
%  of the projection of (P-P1) onto (P2-P1).
%
  t = ( p1(1:dim_num,1) - p(1:dim_num,1) )' ...
    * ( p1(1:dim_num,1) - p2(1:dim_num,1) ) / bot;

  pn(1:dim_num,1) = p1(1:dim_num,1) + t * ( p2(1:dim_num,1) - p1(1:dim_num,1) );

  dist = sqrt ( sum ( ( pn(1:dim_num,1) - p(1:dim_num,1) ).^2 ) );

  return
end

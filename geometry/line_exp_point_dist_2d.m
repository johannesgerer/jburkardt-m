function dist = line_exp_point_dist_2d ( p1, p2, p )

%*****************************************************************************80
%
%% LINE_EXP_POINT_DIST_2D: distance ( explicit line, point ) in 2D.
%
%  Discussion:
%
%    The explicit form of a line in 2D is:
%
%      ( P1, P2 ) = ( (X1,Y1), (X2,Y2) ).
%
%    Thanks to Francois Stuempfer for pointing out a parenthesis error
%    in the distance computation.
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
%  Parameters:
%
%    Input, real P1(2,1), P2(2,1), two points on the line.
%
%    Input, real P(2,1), the point whose distance from the line is
%    to be measured.
%
%    Output, real DIST, the distance from the point to the line.
%
  bot = sum ( ( p2(1:2,1) - p1(1:2,1) ).^2 );

  if ( bot == 0.0 )

    pn(1:2,1) = p1(1:2,1);
%
%  (P-P1) dot (P2-P1) = Norm(P-P1) * Norm(P2-P1) * Cos(Theta).
%
%  (P-P1) dot (P2-P1) / Norm(P-P1)**2 = normalized coordinate T
%  of the projection of (P-P1) onto (P2-P1).
%
  else

    dot = ( p(1:2,1) - p1(1:2,1) )' * ( p2(1:2,1) - p1(1:2,1) );

    t = dot / bot;

    pn(1:2,1) = p1(1:2,1) + t * ( p2(1:2,1) - p1(1:2,1) );

  end

  dist = sqrt ( sum ( ( p(1:2,1) - pn(1:2,1) ).^2 ) );

  return
end

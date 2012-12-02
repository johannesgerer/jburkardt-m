function dist = line_exp_point_dist_3d ( p1, p2, p )

%*****************************************************************************80
%
%% LINE_EXP_POINT_DIST_3D: distance ( explicit line, point ) in 3D.
%
%  Discussion:
%
%    The explicit form of a line in 3D is:
%
%      ( P1, P2 ) = ( (X1,Y1,Z1), (X2,Y2,Z2) ).
%
%    Thanks to Francois Struempfer for pointing out a parenthesis mistake in the
%    computation of the Euclidean norm.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 June 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real P1(3,1), P2(3,1), two points on the line.
%
%    Input, real P(3,1), the point whose distance from the line is
%    to be measured.
%
%    Output, real DIST, the distance from the point to the line.
%
  dim_num = 3;

  bot = sum ( ( p2(1:dim_num,1) - p1(1:dim_num,1) ).^2 );

  if ( bot == 0.0 )

    pn(1:dim_num,1) = p1(1:dim_num,1);
%
%  (P-P1) dot (P2-P1) = Norm(P-P1) * Norm(P2-P1) * Cos(Theta).
%
%  (P-P1) dot (P2-P1) / Norm(P-P1)**2 = normalized coordinate T
%  of the projection of (P-P1) onto (P2-P1).
%
  else

    t = sum ( ( p(1:dim_num,1) - p1(1:dim_num,1) )' ...
            * ( p2(1:dim_num,1) - p1(1:dim_num,1) ) ) / bot;

    pn(1:dim_num,1) = p1(1:dim_num,1) + t * ( p2(1:dim_num,1) - p1(1:dim_num,1) );

  end
%
%  Now compute the distance between the projection point and P.
%
  dist = sqrt ( sum ( ( p(1:dim_num,1) - pn(1:dim_num,1) ).^2 ) );

  return
end

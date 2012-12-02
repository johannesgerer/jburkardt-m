function dist_signed = line_exp_point_dist_signed_2d ( p1, p2, p )

%*****************************************************************************80
%
%% LINE_EXP_POINT_DIST_SIGNED_2D: signed distance ( explicit line, point ) in 2D.
%
%  Discussion:
%
%    The explicit form of a line in 2D is:
%
%      ( P1, P2 ) = ( (X1,Y1), (X2,Y2) ).
%
%    The signed distance has two interesting properties:
%
%    *  The absolute value of the signed distance is the
%        usual (Euclidean) distance.
%
%    *  Points with signed distance 0 lie on the line,
%       points with a negative signed distance lie on one side
%         of the line,
%       points with a positive signed distance lie on the
%         other side of the line.
%
%    Assuming that C is nonnegative, then if a point is a positive
%    distance away from the line, it is on the same side of the
%    line as the point (0,0), and if it is a negative distance
%    from the line, it is on the opposite side from (0,0).
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
%    Input, real P(2,1), the point whose signed distance is desired.
%
%    Output, real DIST_SIGNED, the signed distance from the
%    point to the line.
%

%
%  If the explicit line degenerates to a point, the computation is easy.
%
  if ( p1(1:2,1) == p2(1:2,1) )

    dist_signed = sqrt ( sum ( ( p1(1:2,1) - p(1:2,1) ).^2 ) );
%
%  Convert the explicit line to the implicit form A * X + B * Y + C = 0.
%  This makes the computation of the signed distance  to (X,Y) easy.
%
  else

    a = p2(2,1) - p1(2,1);
    b = p1(1,1) - p2(1,1);
    c = p2(1,1) * p1(2,1) - p1(1,1) * p2(2,1);

    dist_signed = ( a * p(1,1) + b * p(2,1) + c ) / sqrt ( a * a + b * b );

  end

  return
end

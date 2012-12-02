function [ ival, p ] = lines_imp_int_2d ( a1, b1, c1, a2, b2, c2 )

%*****************************************************************************80
%
%% LINES_IMP_INT_2D determines where two implicit lines intersect in 2D.
%
%  Discussion:
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
%    04 December 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A1, B1, C1, define the first line.
%    At least one of A1 and B1 must be nonzero.
%
%    Input, real A2, B2, C2, define the second line.
%    At least one of A2 and B2 must be nonzero.
%
%    Output, integer IVAL, reports on the intersection.
%    -1, both A1 and B1 were zero.
%    -2, both A2 and B2 were zero.
%     0, no intersection, the lines are parallel.
%     1, one intersection point, returned in X, Y.
%     2, infinitely many intersections, the lines are identical.
%
%    Output, real P(2,1), if IVAL = 1, then P is
%    the intersection point.  if IVAL = 2, then P is one of the
%    points of intersection.  Otherwise, P = [].
%

%
%  Refuse to handle degenerate lines.
%
  if ( a1 == 0.0 & b1 == 0.0 )
    ival = -1;
    p = [];
    return
  elseif ( a2 == 0.0 & b2 == 0.0 )
    ival = -2;
    p = [];
    return
  end
%
%  Set up and solve a linear system.
%
  a(1,1) = a1;
  a(1,2) = b1;
  a(1,3) = -c1;

  a(2,1) = a2;
  a(2,2) = b2;
  a(2,3) = -c2;

  [ a, info ] = r8mat_solve ( 2, 1, a );
%
%  If the inverse exists, then the lines intersect at the solution point.
%
  if ( info == 0 )

    ival = 1;
    p(1:2,1) = a(1:2,3);
%
%  If the inverse does not exist, then the lines are parallel
%  or coincident.  Check for parallelism by seeing if the
%  C entries are in the same ratio as the A or B entries.
%
  else

    ival = 0;
    p = [];

    if ( a1 == 0.0 )
      if ( b2 * c1 == c2 * b1 )
        ival = 2;
        p(1:2,1) = [ 0.0; - c1 / b1 ];
      end
    else
      if ( a2 * c1 == c2 * a1 )
        ival = 2;
        if ( abs ( a1 ) < abs ( b1 ) )
          p(1:2,1) = [ 0.0; - c1 / b1 ];
        else
          p(1:2,1) = [ - c1 / a1; 0.0 ];
        end
      end
    end

  end

  return
end

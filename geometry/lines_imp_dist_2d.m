function dist = lines_imp_dist_2d ( a1, b1, c1, a2, b2, c2 )

%*****************************************************************************80
%
%% LINES_IMP_DIST_2D determines the distance between two implicit lines in 2D.
%
%  Discussion:
%
%    If the lines intersect, then their distance is zero.
%    If the two lines are parallel, then they have a nonzero distance.
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
%    24 February 2005
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
%    Output, real DIST, the distance between the two lines.
%
  dim_num = 2;
%
%  Refuse to handle degenerate lines.
%
  if ( a1 == 0.0 & b1 == 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LINES_IMP_DIST_2D - Fatal error!\n' );
    fprintf ( 1, '  Line 1 is degenerate.\n' );
    error ( 'LINES_IMP_DIST_2D - Fatal error!' );
  elseif ( a2 == 0.0 & b2 == 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LINES_IMP_DIST_2D - Fatal error!\n' );
    fprintf ( 1, '  Line 2 is degenerate.\n' );
    error ( 'LINES_IMP_DIST_2D - Fatal error!' );
  end
%
%  Determine if the lines intersect.
%
  if ( a1 * b2 ~= a2 * b1 )
    dist = 0.0;
    return
  end
%
%  Determine the distance between the parallel lines.
%
  dist = abs ( c2 / sqrt ( a2 * a2 + b2 * b2 ) - c1 / sqrt ( a1 * a1 + b1 * b1 ) );

  return
end

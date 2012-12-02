function dist = line_imp_point_dist_2d ( a, b, c, p )

%*****************************************************************************80
%
%% LINE_IMP_POINT_DIST_2D: distance ( implicit line, point ) in 2D.
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
%    02 January 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, C, the implicit line parameters.
%
%    Input, real P(2,1), the point whose distance from the line is
%    to be measured.
%
%    Output, real DIST, the distance from the point to the line.
%
  if ( a * a + b * b == 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LINE_IMP_POINT_DIST_2D - Fatal error!\n' );
    fprintf ( 1, '  A * A + B * B = 0.\n' );
    error ( 'LINE_IMP_POINT_DIST_2D - Fatal error!' );
  end

  dist = abs ( a * p(1,1) + b * p(2,1) + c ) / sqrt ( a * a + b * b );

  return
end

function dist_signed = line_imp_point_dist_signed_2d ( a, b, c, p )

%*****************************************************************************80
%
%% LINE_IMP_POINT_DIST_SIGNED_2D: signed distance ( implicit line, point ) in 2D.
%
%  Discussion:
%
%    The implicit form of a line in 2D is:
%
%      A * X + B * Y + C * Z + D = 0
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, C, the implicit line parameters.
%
%    Input, real P(2,1), the coordinates of the point.
%
%    Output, real DIST_SIGNED, the signed distance from the
%    point to the line.
%
  dim_num = 2;

  if ( a * a + b * b == 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LINE_IMP_POINT_DIST_SIGNED_2D - Fatal error!\n' );
    fprintf ( 1, '  A * A + B * B = 0.\n' );
    error ( 'LINE_IMP_POINT_DIST_SIGNED_2D - Fatal error! );
  end

  dist_signed = - r8_sign ( c ) * ( a * p(1,1) + b * p(2,1) + c ) / ...
    sqrt ( a * a + b * b );

  return
end

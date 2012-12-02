function dist = ellipse_point_dist_2d ( a, b, p )

%*****************************************************************************80
%
%% ELLIPSE_POINT_DIST_2D finds the distance from a point to an ellipse in 2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 March 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Dianne O'Leary,
%    Elastoplastic Torsion: Twist and Stress,
%    Computing in Science and Engineering,
%    July/August 2004, pages 74-76.
%    September/October 2004, pages 63-65.
%
%  Parameters:
%
%    Input, real A, B, the ellipse parameters.  Normally,
%    these are both positive quantities.  Generally, they are also
%    distinct.
%
%    Input, real P(2), the point.
%
%    Output, real DIST, the distance to the ellipse.
%
  dim_num = 2;

  pn = ellipse_point_near_2d ( a, b, p );

  dist = sqrt ( sum ( ( p(1:dim_num) - pn(1:dim_num) ).^2 ) );

  return
end

function geometry_test014 ( )

%*****************************************************************************80
%
%% TEST014 tests CIRCLE_EXP_CONTAINS_POINT_2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  dim_num = 2;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST014\n' );
  fprintf ( 1, '  CIRCLE_EXP_CONTAINS_POINT_2D determines if a\n' );
  fprintf ( 1, '    point lies inside a circle.\n' );
%
%  This point is inside.
%
  p1(1:dim_num) = [  4.0, 2.0 ];
  p2(1:dim_num) = [  1.0, 5.0 ];
  p3(1:dim_num) = [ -2.0, 2.0 ];
  p(1:dim_num)  = [  2.0, 3.0 ];

  r8vec_print ( dim_num, p1, '  P1:' );
  r8vec_print ( dim_num, p2, '  P2:' );
  r8vec_print ( dim_num, p3, '  P3:' );
  r8vec_print ( dim_num, p, '  P:' );

  inside = circle_exp_contains_point_2d ( p1, p2, p3, p );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  INSIDE = %d\n', inside );
  if ( inside == -1 )
    fprintf ( 1, '  The point is inside the circle.\n' );
  elseif ( inside == 0 )
    fprintf ( 1, '  The point is on the circle.\n' );
  elseif ( inside == 1 )
    fprintf ( 1, '  The point is outside the circle\n' );
  elseif ( inside == 2 )
    fprintf ( 1, '  Colinear data, the point is on the line.\n' );
  elseif ( inside == 3 )
    fprintf ( 1, '  Colinear data, the point is not on the line.\n' );
  elseif ( inside == 4 )
    fprintf ( 1, '  Two equal data points, the point is on the line.\n' );
  elseif ( inside == 5 )
    fprintf ( 1, '  Two equal data points, the point is not on the line.\n' );
  elseif ( inside == 6 )
    fprintf ( 1, '  All data points equal, the point is equal.\n' );
  elseif ( inside == 7 )
    fprintf ( 1, '  All data points equal, the point is not equal.\n' );
  end
%
%  This point is actually right on the circle.
%
  p1(1:dim_num) = [  4.0,  2.0 ];
  p2(1:dim_num) = [  1.0,  5.0 ];
  p3(1:dim_num) = [ -2.0,  2.0 ];
  p(1:dim_num)  = [  1.0, -1.0 ];

  r8vec_print ( dim_num, p1, '  P1:' );
  r8vec_print ( dim_num, p2, '  P2:' );
  r8vec_print ( dim_num, p3, '  P3:' );
  r8vec_print ( dim_num, p, '  P:' );

  inside = circle_exp_contains_point_2d ( p1, p2, p3, p );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  INSIDE = %d\n', inside );
  if ( inside == -1 )
    fprintf ( 1, '  The point is inside the circle.\n' );
  elseif ( inside == 0 )
    fprintf ( 1, '  The point is on the circle.\n' );
  elseif ( inside == 1 )
    fprintf ( 1, '  The point is outside the circle\n' );
  elseif ( inside == 2 )
    fprintf ( 1, '  Colinear data, the point is on the line.\n' );
  elseif ( inside == 3 )
    fprintf ( 1, '  Colinear data, the point is not on the line.\n' );
  elseif ( inside == 4 )
    fprintf ( 1, '  Two equal data points, the point is on the line.\n' );
  elseif ( inside == 5 )
    fprintf ( 1, '  Two equal data points, the point is not on the line.\n' );
  elseif ( inside == 6 )
    fprintf ( 1, '  All data points equal, the point is equal.\n' );
  elseif ( inside == 7 )
    fprintf ( 1, '  All data points equal, the point is not equal.\n' );
  end
%
%  This point is outside.
%
  p1(1:dim_num) = [  4.0, 2.0 ];
  p2(1:dim_num) = [  1.0, 5.0 ];
  p3(1:dim_num) = [ -2.0, 2.0 ];
  p(1:dim_num)  = [  4.0, 6.0 ];

  r8vec_print ( dim_num, p1, '  P1:' );
  r8vec_print ( dim_num, p2, '  P2:' );
  r8vec_print ( dim_num, p3, '  P3:' );
  r8vec_print ( dim_num, p, '  P:' );

  inside = circle_exp_contains_point_2d ( p1, p2, p3, p );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  INSIDE = %d\n', inside );
  if ( inside == -1 )
    fprintf ( 1, '  The point is inside the circle.\n' );
  elseif ( inside == 0 )
    fprintf ( 1, '  The point is on the circle.\n' );
  elseif ( inside == 1 )
    fprintf ( 1, '  The point is outside the circle\n' );
  elseif ( inside == 2 )
    fprintf ( 1, '  Colinear data, the point is on the line.\n' );
  elseif ( inside == 3 )
    fprintf ( 1, '  Colinear data, the point is not on the line.\n' );
  elseif ( inside == 4 )
    fprintf ( 1, '  Two equal data points, the point is on the line.\n' );
  elseif ( inside == 5 )
    fprintf ( 1, '  Two equal data points, the point is not on the line.\n' );
  elseif ( inside == 6 )
    fprintf ( 1, '  All data points equal, the point is equal.\n' );
  elseif ( inside == 7 )
    fprintf ( 1, '  All data points equal, the point is not equal.\n' );
  end

  return
end

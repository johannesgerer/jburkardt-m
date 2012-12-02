function geometry_test018 ( )

%*****************************************************************************80
%
%% TEST018 tests CIRCLE_IMP_POINT_DIST_2D, CIRCLES_IMP_INT_2D;
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
  ntest = 5;
  center1(1:2,1) = [ 0.0; 0.0 ];
  r1 = 5.0;
  r2_test = [ 0.5, 5.0, 3.0, 3.0, 5.0 ];
  xc2_test = [ 5.0, 7.0710678, 4.0, 6.0, 0.0 ];
  yc2_test = [ 5.0, 7.0710678, 0.0, 0.0, 0.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST018\n' );
  fprintf ( 1, '  CIRCLES_IMP_INT_2D determines the intersections of\n' );
  fprintf ( 1, '    two circles in 2D.\n' );
  fprintf ( 1, '  CIRCLE_IMP_POINT_DIST_2D checks, by finding the\n' );
  fprintf ( 1, '    distance from a point to a circle.\n' );

  circle_imp_print_2d ( r1, center1, '  The first circle:' );

  for i = 1 : ntest

    r2 = r2_test(i);
    center2(1:2,1) = [ xc2_test(i); yc2_test(i) ];

    circle_imp_print_2d ( r2, center2, '  The second circle:' );

    [ num_int, x ] = circles_imp_int_2d ( r1, center1, r2, center2 );

    if ( num_int == 0 )

      fprintf ( 1, '\n' );
      fprintf ( 1, '  The circles do not intersect.\n' );

    elseif ( num_int == 1 )

      fprintf ( 1, '\n' );
      fprintf ( 1, '  The circles intersect at one point:\n' );
      fprintf ( 1, '\n' );
      fprintf ( 1, '    X       Y     Dist 1  Dist 2\n' );
      fprintf ( 1, '\n' );
      d1 = circle_imp_point_dist_2d ( r1, center1, x(1:2,1) );
      d2 = circle_imp_point_dist_2d ( r2, center2, x(1:2,1) );
      fprintf ( 1, '  %6f  %6f  %6f  %6f\n', x(1:2,1), d1, d2 );

    elseif ( num_int == 2 )

      fprintf ( 1, '\n' );
      fprintf ( 1, '  The circles intersect at two points:\n' );
      fprintf ( 1, '\n' );
      fprintf ( 1, '    X       Y     Dist 1  Dist 2\n' );
      fprintf ( 1, '\n' );
      d1 = circle_imp_point_dist_2d ( r1, center1, x(1:2,1) );
      d2 = circle_imp_point_dist_2d ( r2, center2, x(1:2,1) );
      fprintf ( 1, '  %6f  %6f  %6f  %6f\n', x(1:2,1), d1, d2 );
      d1 = circle_imp_point_dist_2d ( r1, center1, x(1:2,2) );
      d2 = circle_imp_point_dist_2d ( r2, center2, x(1:2,2) );
      fprintf ( 1, '  %6f  %6f  %6f  %6f\n', x(1:2,2), d1, d2 );

    elseif ( num_int == 3 )

      fprintf ( 1, '\n' );
      fprintf ( 1, '  The circles coincide (infinite intersection).\n' );

    end

  end

  return
end

function geometry_test1715 ( )

%*****************************************************************************80
%
%% TEST1715 tests QUAD_CONTAINS_POINT_2D, QUAD_POINT_DIST_2D, QUAD_POINT_DIST_SIGNED_2D.
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
  ntest = 7;

  ptest = [ ...
     0.25,   0.25; ...
     0.75,   0.25; ...
     1.00,   1.00; ...
    11.00,   0.50; ...
     0.00,   0.50; ...
     0.50, -10.00; ...
     2.00,   2.00 ]';
  q = [ ...
    0.0, 0.0; ...
    1.0, 0.0; ...
    1.0, 1.0; ...
    0.0, 1.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST1715\n' );
  fprintf ( 1, '  For a quadrilateral in 2D:\n' );
  fprintf ( 1, '  QUAD_AREA_2D finds the area;\n' );
  fprintf ( 1, '  QUAD_CONTAINS_POINT_2D tells if a point is inside;\n' );
  fprintf ( 1, '  QUAD_POINT_DIST_2D computes the distance.\n' );
  fprintf ( 1, '  QUAD_POINT_DIST_SIGNED_2D computes signed distance.\n' );

  r8mat_transpose_print ( 2, 4, q, '  The vertices:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '        P        Contains  Dist    Dist\n' );
  fprintf ( 1, '                          Signed  Unsigned\n' );
  fprintf ( 1, '\n' );

  for i = 1 : ntest

    p(1:2,1) = ptest(1:2,i);

    inside = quad_contains_point_2d ( q, p );

    dist_signed = quad_point_dist_signed_2d ( q, p );

    dist = quad_point_dist_2d ( q, p );

    fprintf ( 1, '  %12f  %12f  %1d  %10f  %10f\n', ...
      p(1:2,1), inside, dist_signed, dist );

  end

  return
end

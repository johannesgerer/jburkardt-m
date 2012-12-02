function geometry_test012 ( )

%*****************************************************************************80
%
%% TEST012 tests CIRCLE_LUNE_AREA_2D, CIRCLE_SECTOR_AREA_2D, CIRCLE_TRIANGLE_AREA_2D.
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
  n_test = 12;

  center(1:2) = [ 0.0, 0.0 ];
  r = 1.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST012\n' );
  fprintf ( 1, '  CIRCLE_LUNE_AREA_2D computes the area of a\n' );
  fprintf ( 1, '    circular lune, defined by joining the endpoints\n' );
  fprintf ( 1, '    of a circular arc.\n' );
  fprintf ( 1, '  CIRCLE_SECTOR_AREA_2D computes the area of a\n' );
  fprintf ( 1, '    circular sector, defined by joining the endpoints\n' );
  fprintf ( 1, '    of a circular arc to the center.\n' );
  fprintf ( 1, '  CIRCLE_TRIANGLE_AREA_2D computes the signed area of a\n' );
  fprintf ( 1, '    triangle, defined by joining the endpoints\n' );
  fprintf ( 1, '    of a circular arc and the center.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    '      R            Theta1      Theta2        Sector       Triangle     Lune\n' );
  fprintf ( 1, '\n' );

  for i = 0 : n_test

    theta1 = 0.0;
    theta2 = i * 2.0 * pi / n_test;

    area1 = circle_sector_area_2d ( r, center, theta1, theta2 );

    area2 = circle_triangle_area_2d ( r, center, theta1, theta2 );

    area3 = circle_lune_area_2d ( r, center, theta1, theta2 );

    fprintf ( 1, '  %10f  %10f  %10f  %10f  %10f  %10f\n', ...
      r, theta1, theta2, area1, area2, area3 );

  end

  return
end

function stroud_test11 ( )

%*****************************************************************************80
%
%% TEST11 tests LENS_HALF_AREA_2D, CIRCLE_SECTOR_AREA_2D, CIRCLE_TRIANGLE_AREA_2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    06 April 2009
%
%  Author:
%
%    John Burkardt
%
  r = 1.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST11\n' );
  fprintf ( 1, '  LENS_HALF_AREA_2D computes the area of a\n' );
  fprintf ( 1, '    circular half lens, defined by joining the endpoints\n' );
  fprintf ( 1, '    of a circular arc.\n' );
  fprintf ( 1, '  CIRCLE_SECTOR_AREA_2D computes the area of a\n' );
  fprintf ( 1, '    circular sector, defined by joining the endpoints\n' );
  fprintf ( 1, '    of a circular arc to the center.\n' );
  fprintf ( 1, '  CIRCLE_TRIANGLE_AREA_2D computes the signed area of a\n' );
  fprintf ( 1, '    triangle, defined by joining the endpoints\n' );
  fprintf ( 1, '    of a circular arc and the center.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    '      R       Theta1 Theta2        Sector       Triangle     Half Lens\n' );
  fprintf ( 1, '\n' );

  for i = 0 : 12

    theta1 = 0.0;
    theta2 = i * 2.0 * pi / 12.0;

    area1 = circle_sector_area_2d ( r, theta1, theta2 );

    area2 = circle_triangle_area_2d ( r, theta1, theta2 );

    area3 = lens_half_area_2d ( r, theta1, theta2 );

    fprintf ( 1, '  %7f  %7f  %7f  %12f  %12f  %12f\n', ...
      r, theta1, theta2, area1, area2, area3 );

  end

  return
end

function stroud_test12 ( )

%*****************************************************************************80
%
%% TEST12 tests LENS_HALF_AREA_2D, LENS_HALF_H_AREA_2D, LENS_HALF_W_AREA_2D.
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
  r = 50.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST12\n' );
  fprintf ( 1, '  For the area of a circular half lens,\n' );
  fprintf ( 1, '  LENS_HALF_AREA_2D uses two angles;\n' );
  fprintf ( 1, '  LENS_HALF_H_AREA_2D works from the height;\n' );
  fprintf ( 1, '  LENS_HALF_W_AREA_2D works from the width.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The circle has radius R = %f\n', r );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    THETA1    THETA2      H           W         Area(THETA)    Area(H)        Area(W)\n' );
  fprintf ( 1, '\n' );

  for i = 0 : 12

    theta1 = 0.0;
    theta2 = i * 2.0 * pi / 12.0;
    w = 2.0 * r * sin ( 0.5 * ( theta2 - theta1 ) ) ;
    h = r * ( 1.0 - cos ( 0.5 * ( theta2 - theta1 ) ) );

    area1 = lens_half_area_2d ( r, theta1, theta2 );

    area2 = lens_half_h_area_2d ( r, h );

    area3 = lens_half_w_area_2d ( r, w );

    fprintf ( 1, '  %5f  %5f  %10f  %10f  %11e  %11e  %11e\n', ...
      theta1, theta2, h, w, area1, area2, area3 );

  end

  return
end

function geometry_test002 ( )

%*****************************************************************************80
%
%% TEST002 tests ANGLE_DEG_2D and ANGLE_RAD_ND.
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
  n_angle = 12;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST002\n' );
  fprintf ( 1, '  ANGLE_DEG_2D computes an angle;\n' );
  fprintf ( 1, '  ANGLE_RAD_ND computes an angle.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  X, Y, Theta, atan2(y, x), ANGLE_RAD_ND, ANGLE_DEG_2D\n' );
  fprintf ( 1, '\n' );

  v1(1:2,1) = [ 1.0; 0.0 ];
  v3(1:2,1) = [ 0.0; 0.0 ];

  for i = 0 : n_angle

    thetad = i * 360.0 / n_angle;
    thetar = degrees_to_radians ( thetad );

    x = cos ( thetar );
    y = sin ( thetar );

    v2(1:2,1) = [ x; y ];

    temp1 = radians_to_degrees ( atan2 ( y, x ) );

    temp2 = angle_rad_nd ( 2, v1, v2 );

    temp3 = angle_deg_2d ( v1, v3, v2 );

    fprintf ( 1, '  %10f  %10f  %10f  %10f  %10f  %10f\n', ...
      x, y, thetad, temp1, temp2, temp3 );

  end

  return
end

function geometry_test0125 ( )

%*****************************************************************************80
%
%% TEST0125 tests CIRCLE_LUNE_AREA_2D, SPHERE_CAP_VOLUME_2D.
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
  ntest = 12;
  center(1:2) = [ 0.0, 0.0 ];
  r = 1.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0125\n' );
  fprintf ( 1, '  CIRCLE_LUNE_AREA_2D computes the area of a\n' );
  fprintf ( 1, '    circular lune, defined by joining the endpoints\n' );
  fprintf ( 1, '    of a circular arc (THETA1,THETA2).\n' );
  fprintf ( 1, '  SPHERE_CAP_VOLUME_2D computes the volume (area) of a\n' );
  fprintf ( 1, '    spherical cap, defined by a plane that cuts the\n' );
  fprintf ( 1, '    sphere to a thickness of H units.\n' );
  fprintf ( 1, '  SPHERE_CAP_VOLUME_ND does the same operation,\n' );
  fprintf ( 1, '    but in N dimensions.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The two routines should get the same results\n' );
  fprintf ( 1, '  if THETA1, THETA2 and H correspond.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Using a radius R = %f\n', r );

  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    '        Theta1      Theta2      H           Lune        Cap        Cap\n' );
  fprintf ( 1, ...
    '                                            area        vol_3d     vol_nd\n' );
  fprintf ( 1, '\n' );

  for i = 0 : ntest

    h = 2.0 * r * i / ntest;

    haver_sine = sqrt ( r * r - ( r - h ) * ( r - h ) );

    if ( h <= r )
      theta2 = r8_asin ( haver_sine / r );
    else
      theta2 = ( pi - r8_asin ( haver_sine / r ) );
    end

    theta1 = -theta2;

    area = circle_lune_area_2d ( r, center, theta1, theta2 );

    volume1 = sphere_cap_volume_2d ( r, h );

    volume2 = sphere_cap_volume_nd ( dim_num, r, h );

    fprintf ( 1, '  %10f  %10f  %10f %10f  %10f  %10f\n', ...
      theta1, theta2, h, area, volume1, volume2 );

  end

  return
end

function geometry_test0126 ( )

%*****************************************************************************80
%
%% TEST0126 tests SPHERE_CAP_VOLUME_3D, SPHERE_CAP_VOLUME_ND.
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
  dim_num = 3;
  ntest = 12;

  center(1:3) = [ 0.0, 0.0, 0.0 ];
  r = 1.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0126\n' );
  fprintf ( 1, '  SPHERE_CAP_VOLUME_3D computes the volume of a\n' );
  fprintf ( 1, '    spherical cap, defined by a plane that cuts the\n' );
  fprintf ( 1, '    sphere to a thickness of H units.\n' );
  fprintf ( 1, '  SPHERE_CAP_VOLUME_ND does the same operation,\n' );
  fprintf ( 1, '    but in N dimensions.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Using a radius R = %f\n', r );

  fprintf ( 1, '\n' );
  fprintf ( 1, '        H           Cap        Cap\n' );
  fprintf ( 1, '                    volume_3d  volume_nd\n' );
  fprintf ( 1, '\n' );

  for i = 0 : ntest

    h = 2.0 * r * i / ntest;

    volume1 = sphere_cap_volume_3d ( r, h );

    volume2 = sphere_cap_volume_nd ( dim_num, r, h );

    fprintf ( 1, '  %10f  %10f  %10f\n', h, volume1, volume2 );

  end

  return
end

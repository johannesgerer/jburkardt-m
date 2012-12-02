function stroud_test33 ( )

%*****************************************************************************80
%
%% TEST33 tests SPHERE_CAP_AREA_ND.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST33\n' );
  fprintf ( 1, '  For a sphere in ND:\n' );
  fprintf ( 1, '  SPHERE_AREA_ND computes the area.\n' );
  fprintf ( 1, '  BALL_VOLUME_ND computes the volume.\n' );
  fprintf ( 1, '  SPHERE_CAP_AREA_ND computes the area \n' );
  fprintf ( 1, '    of a spherical cap.\n' );
  fprintf ( 1, '\n' );

  r = 2.0;

  for n = 2 : 5

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Spatial dimension N = %d\n', n );
    fprintf ( 1,  '  Sphere radius =       %f\n', r );
    fprintf ( 1,  '  Sphere volume =       %f\n', ball_volume_nd ( n, r ) );
    fprintf ( 1,  '  Sphere area =         %f\n', sphere_area_nd ( n, r ) );
    fprintf ( 1, '\n' );
    fprintf ( 1,  '  Theta      Cap area\n' );
    fprintf ( 1, '\n' );

    for i = 1 : 6

      theta = i * pi / 6.0;
      cap_area = sphere_cap_area_nd ( n, theta, r );
      fprintf ( 1, '  %12f  %12f\n', theta, cap_area );

    end

  end

  return
end

function geometry_test0127 ( )

%*****************************************************************************80
%
%% TEST0127 tests SPHERE_CAP_AREA_3D, SPHERE_CAP_AREA_ND.
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
  fprintf ( 1, 'TEST0127\n' );
  fprintf ( 1, '  SPHERE_CAP_AREA_3D computes the volume of a\n' );
  fprintf ( 1, '    3D spherical cap, defined by a plane that cuts the\n' );
  fprintf ( 1, '    sphere to a thickness of H units.\n' );
  fprintf ( 1, '  SPHERE_CAP_AREA_ND computes the volume of an\n' );
  fprintf ( 1, '    ND spherical cap, defined by a plane that cuts the\n' );
  fprintf ( 1, '    sphere to a thickness of H units.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '        R           H           Cap         Cap\n' );
  fprintf ( 1, '                                area_3d     area_nd\n' );
  fprintf ( 1, '\n' );

  for i = 0 : ntest

    h = 2.0 * r * i / ntest;

    area1 = sphere_cap_area_3d ( r, h );

    area2 = sphere_cap_area_nd ( dim_num, r, h );

    fprintf ( 1, '  %10f  %10f  %10f  %10f\n', r, h, area1, area2 );

  end

  return
end

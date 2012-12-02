function stroud_test322 ( )

%*****************************************************************************80
%
%% TEST322 tests SPHERE_CAP_AREA_3D, SPHERE_CAP_AREA_ND.
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
  dim_num = 3;
  ntest = 12;
  r = 1.0;
  center = [ 0.0, 0.0, 0.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST322\n' );
  fprintf ( 1, '  SPHERE_CAP_AREA_3D computes the volume of a\n' );
  fprintf ( 1, '    3D spherical cap, defined by a plane that cuts the\n' );
  fprintf ( 1, '    sphere to a thickness of H units.\n' );
  fprintf ( 1, '  SPHERE_CAP_AREA_ND computes the volume of an\n' );
  fprintf ( 1, '    ND spherical cap, defined by a plane that cuts the\n' );
  fprintf ( 1, '    sphere to a thickness of H units.\n' );

  area1 = sphere_area_3d ( r );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Area of the total sphere in 3D = %f\n', area1 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '        R           H           Cap         Cap\n' );
  fprintf ( 1, '                                area_3d     area_nd\n' );
  fprintf ( 1, '\n' );

  for i = 0 : ntest + 1

    h = 2.0 * r * i / ntest;

    area1 = sphere_cap_area_3d ( r, h );

    area2 = sphere_cap_area_nd ( dim_num, r, h );

    fprintf ( 1, '  %12.6f  %12.6f  %12,6f  %12.6f\n', r, h, area1, area2 );

  end

  return
end

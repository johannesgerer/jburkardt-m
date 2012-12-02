function geometry_test189 ( )

%*****************************************************************************80
%
%% TEST189 tests SPHERE_IMP_AREA_ND, SPHERE_IMP_VOLUME_ND.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 May 2005
%
%  Author:
%
%    John Burkardt
%
  r = 1.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST189\n' );
  fprintf ( 1, '  For a implicit sphere in N dimensions:\n' );
  fprintf ( 1, '  SPHERE_IMP_AREA_ND computes the area;\n' );
  fprintf ( 1, '  SPHERE_IMP_VOLUME_ND computes the volume.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  We use a radius of R = %f\n', r );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    DIM_NUM Area    Volume\n' );
  fprintf ( 1, '\n' );

  for dim_num = 2 : 10
    area = sphere_imp_area_nd ( dim_num, r );
    volume = sphere_imp_volume_nd ( dim_num, r );
    fprintf ( 1, '  %3d  %12f  %12f\n', dim_num, area, volume );
  end

  return
end

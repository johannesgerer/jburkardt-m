function sphere_llt_grid_points_test ( )

%*****************************************************************************80
%
%% SPHERE_LLT_GRID_POINTS_TEST tests SPHERE_LLT_GRID_POINTS.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 April 2015
%
%  Author:
%
%    John Burkardt
%
  lat_num = 3;
  long_num = 4;

  pc(1,1:3) = [ 0.0, 0.0, 0.0 ];
  r = 10.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_LLT_GRID_POINTS_TEST\n' );
  fprintf ( 1, '  SPHERE_LLT_POINTS produces latitude/longitude\n' );
  fprintf ( 1, '  points on a sphere in 3D.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Radius = %f\n', r );

  r8vec_print ( 3, pc, '  Center:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The number of latitudes =  %d\n', lat_num );
  fprintf ( 1, '  The number of longitudes = %d\n', long_num );

  node_num = sphere_llt_grid_point_count ( lat_num, long_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The number of grid points is %d\n', node_num );

  node_xyz = sphere_llt_grid_points ( r, pc, lat_num, long_num, node_num );

  fprintf ( 1, '\n' );

  k = 1;
  fprintf ( 1, '  %8d', k );
  for i = 1 : 3
    fprintf ( 1, '  %12f', node_xyz(k,i) );
  end

  fprintf ( 1, '\n' );

  for lat = 1 : lat_num
    fprintf ( 1, '\n' );
    for lon = 0 : long_num - 1
      k = k + 1;
      fprintf ( 1, '  %8d', k );
      for i = 1 : 3
        fprintf ( 1, '  %12f', node_xyz(k,i) );
      end
      fprintf ( 1, '\n' );
    end
  end

  fprintf ( 1, '\n' );

  k = k + 1;
  fprintf ( 1, '  %8d', k );
  for i = 1 : 3
    fprintf ( 1, '  %12f', node_xyz(k,i) );
  end
  fprintf ( 1, '\n' );

  return
end

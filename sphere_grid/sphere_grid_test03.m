function sphere_grid_test03 ( )

%*****************************************************************************80
%
%% SPHERE_GRID_TEST03 tests SPHERE_ICOS2_POINTS.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 August 2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_GRID_TEST03\n' );
  fprintf ( 1, '  SPHERE_ICOS_POINT_NUM "sizes" a grid generated\n' );
  fprintf ( 1, '  on an icosahedron and projected to a sphere.\n' );
  fprintf ( 1, '  SPHERE_ICOS2_POINTS creates the grid.\n' );

  factor = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Sizing factor FACTOR = %d\n', factor );

  point_num = sphere_icos_point_num ( factor );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of points =  %d\n', point_num );

  node_xyz = sphere_icos2_points ( factor, point_num );

  r8mat_transpose_print_some ( 3, point_num, node_xyz, 1, 1, 3, 20, ...
    '  Initial part of NODE_XYZ array:' );
%
%  Display the nodes on a sphere.
%
  figure ( )
  clf
  hold on
  [ x, y, z ] = sphere ( 20 );
  c = ones ( size ( z ) );
  surf ( x, y, z, c );
  plot3 ( node_xyz(1,:), node_xyz(2,:), node_xyz(3,:), 'b.', 'Markersize', 20 );
  axis equal
  grid on
  view ( 3 )
  xlabel ( '<--X-->' )
  ylabel ( '<--Y-->' )
  zlabel ( '<--Z-->' )
  title ( 'Icosahedral sphere grid' );
  hold off
  filename = sprintf ( 'sphere_icos2_points_f%d.png', factor );
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Plot file saved to "%s".\n', filename );
%
%  Write the nodes to a file.
%
  if ( 1 )

    file_name = sprintf ( 'sphere_icos2_points_f%d.xyz', factor );

    file_unit = fopen ( file_name, 'wt' );
    for node = 1 : point_num
      for i = 1 : 3
        fprintf ( file_unit, '  %f', node_xyz(i,node) );
      end
      fprintf ( file_unit, '\n' );
    end
    fclose ( file_unit );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Wrote grid nodes to "%s".\n', file_name );

  end

  return
end

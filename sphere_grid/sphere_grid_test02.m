function test02 ( )

%*****************************************************************************80
%
%% TEST02 tests SPHERE_ICOS1_POINTS.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 September 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST02\n' );
  fprintf ( 1, '  SPHERE_ICOS_POINT_NUM "sizes" a grid generated\n' );
  fprintf ( 1, '  on an icosahedron and projected to a sphere.\n' );
  fprintf ( 1, '  SPHERE_ICOS1_POINTS creates the grid points.\n' );

  factor = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Sizing factor =       %f\n', factor );

  point_num = sphere_icos_point_num ( factor );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of points = %d\n', point_num );

  node_xyz = sphere_icos1_points ( factor, point_num );

  r8mat_transpose_print_some ( 3, point_num, node_xyz, 1, 1, 3, 20, ...
    '  Initial part of NODE_XYZ array:' );
%
%  Display the nodes on a sphere.
%
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
  filename = sprintf ( 'sphere_icos1_points_f%d.png', factor );
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Plot file saved to "%s".\n', filename );
%
%  Write the nodes to a file.
%
  if ( 1 )

    filename = sprintf ( 'sphere_icos1_points_f%d.xyz', factor );

    file_unit = fopen ( filename, 'wt' );
    for node = 1 : point_num
      for i = 1 : 3
        fprintf ( file_unit, '  %f', node_xyz(i,node ) );
      end
      fprintf ( file_unit, '\n' );
    end
    fclose ( file_unit );

    fprintf ( 1, '  Wrote grid nodes to "%s".\n', filename );

  end


  return
end

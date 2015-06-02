function sphere_grid_test10 ( )

%*****************************************************************************80
%
%% SPHERE_GRID_TEST10 tests SPHERE_CUBED_POINTS.
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
  fprintf ( 1, 'SPHERE_GRID_TEST10\n' );
  fprintf ( 1, '  SPHERE_CUBED_POINTS computes points on a cubed sphere grid.\n' );

  n = 10;
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of divisions on each face = %d\n', n );

  ns = sphere_cubed_point_num ( n );
  fprintf ( 1, '  Total number of points = %d\n', ns );

  xyz = sphere_cubed_points ( n, ns );

  r8mat_transpose_print_some ( 3, ns, xyz, 1, 1, 3, 20, ...
    '  Initial part of XYZ array:' );
%
%  Display the nodes on a sphere.
%
  figure ( )
  clf
  hold on
  [ x, y, z ] = sphere ( 20 );
  c = ones ( size ( z ) );
  surf ( x, y, z, c );
  plot3 ( xyz(1,:), xyz(2,:), xyz(3,:), 'b.', 'Markersize', 20 );
  axis equal
  grid on
  view ( 3 )
  xlabel ( '<--X-->' )
  ylabel ( '<--Y-->' )
  zlabel ( '<--Z-->' )
  title ( 'Cubed sphere points' );
  hold off
  filename = sprintf ( 'sphere_cubed_points_f%d.png', n );
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Plot file saved to "%s".\n', filename );
%
%  Write the nodes to a file.
%
  if ( 1 )

    filename = sprintf ( 'sphere_cubed_grid_f%d.xyz', n );

    file_unit = fopen ( filename, 'wt' );
    for node = 1 : ns
      for i = 1 : 3
        fprintf ( file_unit, '  %f', xyz(i,node ) );
      end
      fprintf ( file_unit, '\n' );
    end
    fclose ( file_unit );

    fprintf ( 1, '  Wrote grid nodes to "%s".\n', filename );

  end


  return
end

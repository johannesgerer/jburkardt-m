function test05 ( )

%*****************************************************************************80
%
%% TEST05 tests SPHERE_SPIRALPOINTS.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 December 2010
%
%  Author:
%
%    John Burkardt
%
  node_num = 500;

  center_xyz(1:3,1) = [ 0.0; 0.0; 0.0 ];
  r = 1.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST05\n' );
  fprintf ( 1, '  SPHERE_SPIRALPOINTS produces a spiral of\n' );
  fprintf ( 1, '  points on an implicit sphere in 3D.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Radius = %f\n', r );

  r8vec_print ( 3, center_xyz, '  Center:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The number of spiral points is %d\n', node_num );

  node_xyz = sphere_spiralpoints ( r, center_xyz, node_num );

  r8mat_transpose_print_some ( 3, node_num, node_xyz, 1, 1, 3, 10, ...
    '  The spiral points:' );
%
%  Write the nodes to a file.
%
  if ( 1 )

    file_name = sprintf ( 'sphere_grid_spiral_n%d.xyz', node_num );

    file_unit = fopen ( file_name, 'wt' );
    for node = 1 : node_num
      for i = 1 : 3
        fprintf ( file_unit, '  %f', node_xyz(i,node) );
      end
      fprintf ( file_unit, '\n' );
    end
    fclose ( file_unit );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Wrote grid nodes to "%d".\n', file_name );

  end

  return
end

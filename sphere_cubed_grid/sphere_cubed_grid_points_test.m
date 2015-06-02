function sphere_cubed_grid_points_test ( )

%*****************************************************************************80
%
%% SPHERE_CUBED_GRID_POINTS_TEST tests SPHERE_CUBED_GRID_POINTS.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_CUBED_GRID_POINTS_TEST\n' );
  fprintf ( 1, '  SPHERE_CUBED_GRID_POINTS computes points on a cubed sphere grid.\n' );

  n = 10;
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of divisions on each face = %d\n', n );

  ns = sphere_cubed_grid_point_count ( n );
  fprintf ( 1, '  Total number of points = %d\n', ns );

  xyz = sphere_cubed_grid_points ( n, ns );

  r8mat_print_some ( ns, 3, xyz, 1, 1, 20, 3, ...
    '  Initial part of XYZ array:' );

  return
end

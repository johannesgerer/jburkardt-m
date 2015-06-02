function sphere_fibonacci_grid_points_test ( )

%*****************************************************************************80
%
%% SPHERE_FIBONACCI_GRID_POINTS_TEST tests SPHERE_FIBONACCI_GRID_POINTS.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 April 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_FIBONACCI_GRID_POINTS_TEST\n' );
  fprintf ( 1, '  SPHERE_FIBONACCI_GRID_POINTS computes points on a sphere\n' );
  fprintf ( 1, '  that lie on a Fibonacci spiral.\n' );

  ng = 1000;
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of points NG = %d\n', ng );

  xg = sphere_fibonacci_grid_points ( ng );

  r8mat_print_some ( ng, 3, xg, 1, 1, 20, 3, '  Part of the grid array:' );
%
%  Display the nodes on a sphere.
%
  filename = sprintf ( 'sphere_fibonacci_grid_n%d.png', ng );

  sphere_fibonacci_grid_display ( ng, xg, filename );
%
%  Write the nodes to a file.
%
  filename = sprintf ( 'sphere_fibonacci_grid_n%d.xyz', ng );

  r8mat_write ( filename, ng, 3, xg )

  return
end

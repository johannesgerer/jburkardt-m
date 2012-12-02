function test07 ( )

%*****************************************************************************80
%
%% TEST07 tests SPHERE_GRID_Q4.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 August 2010
%
%  Author:
%
%    John Burkardt
%
  lat_num = 3;
  long_num = 4;
  rectangle_num = lat_num * long_num;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST07\n' );
  fprintf ( 1, '  SPHERE_GRID_Q4 computes a grid\n' );
  fprintf ( 1, '  of Q4 rectangular elements on a sphere in 3D.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of latitudes is      %d\n', lat_num );
  fprintf ( 1, '  Number of longitudes is     %d\n', long_num );
  fprintf ( 1, '  The number of rectangles is %d\n', rectangle_num );

  rectangle_node = sphere_grid_q4 ( lat_num, long_num );

  i4mat_transpose_print ( 4, rectangle_num, rectangle_node, ...
    '  Rectangle vertices:' );

  return
end

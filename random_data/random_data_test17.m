function random_data_test17 ( )

%*****************************************************************************80
%
%% TEST17 tests UNIFORM_IN_POLYGON_MAP.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 August 2005
%
%  Author:
%
%    John Burkardt
%
  dim_num = 2;
  file_out_name = 'uniform_in_polygon_map.txt';
  n = 1000;
  nv = 10;
  seed = 123456789;
  v = [ ...
    0.0, 0.0; ...
    0.5, 0.3; ...
    1.0, 0.0; ...
    0.7, 0.4; ...
    1.0, 0.6; ...
    0.6, 0.6; ...
    0.5, 1.0; ...
    0.4, 0.6; ...
    0.0, 0.6; ...
    0.3, 0.4 ]'; 

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST17\n' );
  fprintf ( 1, '  UNIFORM_IN_POLYGON_MAP maps uniform\n' );
  fprintf ( 1, '  points into a polygon.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension DIM_NUM =   %12d\n', dim_num );
  fprintf ( 1, '  Number of points N =          %12d\n', n );
  fprintf ( 1, '  Initial random number SEED =  %12d\n', seed );

  r8mat_print ( dim_num, nv, v, '  Polygonal vertices:' );

  [ x, seed ] = uniform_in_polygon_map ( nv, v, n, seed );

  fprintf ( 1, '  Final random number SEED =    %12d\n', seed );

  r8mat_write ( 'polygon_vertices.txt', dim_num, nv, v );

  r8mat_write ( file_out_name, dim_num, n, x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Data written to "%s".\n', file_out_name );

  return
end

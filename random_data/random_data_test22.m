function random_data_test22 ( )

%*****************************************************************************80
%
%% TEST22 tests UNIFORM_IN_TRIANGLE_MAP2.
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
  file_out_name = 'uniform_in_triangle_map2.txt';
  n = 1000;
  seed = 123456789;
  v1 = [ 0.75, 0.90 ];
  v2 = [ 0.00, 0.20 ];
  v3 = [ 0.95, 0.65 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST22\n' );
  fprintf ( 1, '  UNIFORM_IN_TRIANGLE_MAP maps uniform \n' );
  fprintf ( 1, '  points into a triangle.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension DIM_NUM =   %12d\n', dim_num );
  fprintf ( 1, '  Number of points N =          %12d\n', n );
  fprintf ( 1, '  Initial random number SEED =  %12d\n', seed );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  V1 = %12f  %12f\n', v1(1:2) );
  fprintf ( 1, '  V2 = %12f  %12f\n', v2(1:2) );
  fprintf ( 1, '  V3 = %12f  %12f\n', v3(1:2) );

  [ x, seed ] = uniform_in_triangle_map2 ( v1, v2, v3, n, seed );

  fprintf ( 1, '  Final random number SEED =    %12d\n', seed );

  r8mat_write ( file_out_name, dim_num, n, x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Data written to "%s".\n', file_out_name );

  return
end

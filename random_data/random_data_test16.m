function random_data_test16 ( )

%*****************************************************************************80
%
%% TEST16 tests UNIFORM_IN_PARALLELOGRAM_MAP.
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
  file_out_name = 'uniform_in_parallelogram_map.txt';
  n = 1000;
  seed = 123456789;
  v1 = [ 0.75, 0.90 ];
  v2 = [ 0.00, 0.20 ];
  v3 = [ 1.10, 0.65 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST16\n' );
  fprintf ( 1, '  UNIFORM_IN_PARALLELOGRAM_MAP maps uniform\n' );
  fprintf ( 1, '  points into an arbitrary parallelogram.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension DIM_NUM =   %12d\n', dim_num );
  fprintf ( 1, '  Number of points N =          %12d\n', n );
  fprintf ( 1, '  Initial random number SEED =  %12d\n', seed );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  V1 = %12f  %12f\n', v1(1:2) );
  fprintf ( 1, '  V2 = %12f  %12f\n', v2(1:2) );
  fprintf ( 1, '  V3 = %12f  %12f\n', v3(1:2) );
  fprintf ( 1, '  V4 = %12f  %12f\n', v3(1:2)+v2(1:2)-v1(1:2) );

  [ x, seed ] = uniform_in_parallelogram_map ( v1, v2, v3, n, seed );

  fprintf ( 1, '  Final random number SEED =    %12d\n', seed );

  x = scale_to_block01 ( dim_num, n, x );

  r8mat_write ( file_out_name, dim_num, n, x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Data written to "%s".\n', file_out_name );

  return
end

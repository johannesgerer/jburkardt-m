function random_data_test18 ( )

%*****************************************************************************80
%
%% TEST18 tests UNIFORM_IN_SECTOR_MAP.
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
  file_out_name = 'uniform_in_sector_map.txt';
  n = 300;
  r1 = 1.0;
  r2 = 2.0;
  seed = 123456789;
  t1 = 0.78;
  t2 = 2.35;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST18\n' );
  fprintf ( 1, '  UNIFORM_IN_SECTOR_MAP maps uniform \n' );
  fprintf ( 1, '  points into a circular sector.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  R1 = %f\n', r1 );
  fprintf ( 1, '  R2 = %f\n', r2 );
  fprintf ( 1, '  T1 = %f\n', t1 );
  fprintf ( 1, '  T2 = %f\n', t2 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension DIM_NUM =   %12d\n', dim_num );
  fprintf ( 1, '  Number of points N =          %12d\n', n );
  fprintf ( 1, '  Initial random number SEED =  %12d\n', seed );

  [ x, seed ] = uniform_in_sector_map ( r1, r2, t1, t2, n, seed );

  fprintf ( 1, '  Final random number SEED =    %12d\n', seed );

  r8mat_write ( file_out_name, dim_num, n, x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Data written to "%s".\n', file_out_name );

  return
end

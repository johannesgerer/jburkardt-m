function random_data_test25 ( )

%*****************************************************************************80
%
%% TEST25 tests UNIFORM_ON_SIMPLEX01_MAP.
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
  file_out_name = 'uniform_on_simplex01_map.txt';
  n = 50;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST25\n' );
  fprintf ( 1, '  UNIFORM_ON_SIMPLEX01_MAP maps uniform \n' );
  fprintf ( 1, '  points onto the unit simplex.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension DIM_NUM =   %12d\n', dim_num );
  fprintf ( 1, '  Number of points N =          %12d\n', n );
  fprintf ( 1, '  Initial random number SEED =  %12d\n', seed );

  [ x, seed ] = uniform_on_simplex01_map ( dim_num, n, seed );

  fprintf ( 1, '  Final random number SEED =    %12d\n', seed );

  r8mat_write ( file_out_name, dim_num, n, x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Data written to "%s".\n', file_out_name );

  return
end

function random_data_test04 ( )

%*****************************************************************************80
%
%% TEST04 tests GRID_IN_CUBE01.
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
  file_out_name = 'grid_in_cube01.txt';
  n = 85;
  center = 1;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST04\n' );
  fprintf ( 1, '  GRID_IN_CUBE01 generates grid points\n' );
  fprintf ( 1, '  in the unit hypercube.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension DIM_NUM =   %12d\n', dim_num );
  fprintf ( 1, '  Number of points N =          %12d\n', n );
  fprintf ( 1, '  CENTER option =               %12d\n', center );
  fprintf ( 1, '  Initial random number SEED =  %12d\n', seed );

  [ x, seed ] = grid_in_cube01 ( dim_num, n, center, seed );

  fprintf ( 1, '  Final random number SEED =    %12d\n', seed );

  r8mat_write ( file_out_name, dim_num, n, x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Data written to "%s".\n', file_out_name );

  return
end

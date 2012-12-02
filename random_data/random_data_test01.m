function random_data_test01 ( )

%*****************************************************************************80
%
%% TEST01 tests BROWNIAN.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 August 2005
%
%  Author:
%
%    John Burkardt
%
  dim_num = 2;
  file_out_name = 'brownian.txt';
  n = 100;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST01:\n' );
  fprintf ( 1, '  BROWNIAN generates Brownian motion points.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension DIM_NUM =   %12d\n', dim_num );
  fprintf ( 1, '  Number of points N =          %12d\n', n );
  fprintf ( 1, '  Initial random number SEED =  %12d\n', seed );

  [ x, seed ] = brownian ( dim_num, n, seed );

  fprintf ( 1, '  Final random number SEED =    %12d\n', seed );

  x = scale_to_block01 ( dim_num, n, x );

  r8mat_write ( file_out_name, dim_num, n, x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Data written to "%s".\n', file_out_name );

  return
end

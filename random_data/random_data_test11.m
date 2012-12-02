function random_data_test11 ( )

%*****************************************************************************80
%
%% TEST11 tests NORMAL_SIMPLE.
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
  file_out_name = 'normal_simple.txt';
  n = 1000;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST11\n' );
  fprintf ( 1, '  NORMAL_SIMPLE generates normal points\n' );
  fprintf ( 1, '    in M dimensions, using a zero mean, and with\n' );
  fprintf ( 1, '    the identity as the variance-covariance matrix.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension DIM_NUM =   %12d\n', dim_num );
  fprintf ( 1, '  Number of points N =          %12d\n', n );
  fprintf ( 1, '  Initial random number SEED =  %12d\n', seed );

  [ x, seed ] = normal_simple ( dim_num, n, seed );

  fprintf ( 1, '  Final random number SEED =    %12d\n', seed );

  x = scale_to_block01 ( dim_num, n, x );

  r8mat_write ( file_out_name, dim_num, n, x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Data written to "%s".\n', file_out_name );

  return
end

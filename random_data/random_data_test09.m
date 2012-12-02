function random_data_test09 ( )

%*****************************************************************************80
%
%% TEST09 tests NORMAL.
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
  file_out_name = 'normal.txt';
  n = 1000;
  mu = [ 6.0, 100.0 ];
  seed = 123456789;
  v = [ 5.0, 2.0; ...
        2.0, 1.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST09\n' );
  fprintf ( 1, '  NORMAL generates normal points\n' );
  fprintf ( 1, '    in M dimensions, using a nonzero mean, and with\n' );
  fprintf ( 1, '    user-specified variance-covariance matrix.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension DIM_NUM =   %12d\n', dim_num );
  fprintf ( 1, '  Number of points N =          %12d\n', n );
  fprintf ( 1, '  Initial random number SEED =  %12d\n', seed );

  r8vec_print ( dim_num, mu, '  Mean vector MU:' );

  r8mat_print ( dim_num, dim_num, v, '  Variance-covariance matrix V:' );
 
  [ r, info ] = dpo_fa ( dim_num, v );

  if ( info ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'Fatal error!\n' );
    fprintf ( 1, '  Variance-covariance matrix factorization failed.\n' );
    fprintf ( 1, '  INFO = %d\n', info );
    error ( 'Fatal error!' );
  end

  r8mat_print ( dim_num, dim_num, r, '  Cholesky factor R:' );

  [ x, seed ] = normal ( dim_num, n, r, mu, seed );

  fprintf ( 1, '  Final random number SEED =    %12d\n', seed );

  x = scale_to_block01 ( dim_num, n, x );

  r8mat_write ( file_out_name, dim_num, n, x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Data written to "%s".\n', file_out_name );

  return
end

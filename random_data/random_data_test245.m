function random_data_test245 ( )

%*****************************************************************************80
%
%% TEST245 tests UNIFORM_ON_HEMISPHERE01_PHONG.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 April 2006
%
%  Author:
%
%    John Burkardt
%
  dim_num = 3;
  n = 50;
  m = 2;
  seed = 123456789;
  file_out_name = 'uniform_on_hemisphere01_phong.txt';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST245\n' );
  fprintf ( 1, '  UNIFORM_ON_HEMISPHERE01_PHONG maps uniform \n' );
  fprintf ( 1, '  points onto the unit hemisphere with Phong density.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension DIM_NUM =   %12d\n', dim_num );
  fprintf ( 1, '  Number of points N =          %12d\n', n );
  fprintf ( 1, '  Phong exponent M =            %12d\n', m );
  fprintf ( 1, '  Initial random number SEED =  %12d\n', seed );

  [ x, seed ] = uniform_on_hemisphere01_phong ( n, m, seed );

  fprintf ( 1, '  Final random number SEED =    %12d\n', seed );

  r8mat_write ( file_out_name, dim_num, n, x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Data written to "%s".\n', file_out_name );

  return
end

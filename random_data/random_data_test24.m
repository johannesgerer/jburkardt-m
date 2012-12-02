function random_data_test24 ( )

%*****************************************************************************80
%
%% TEST24 tests UNIFORM_ON_ELLIPSOID_MAP.
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
  file_out_name = 'uniform_on_ellipsoid_map.txt';
  n = 200;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST24\n' );
  fprintf ( 1, '  UNIFORM_ON_ELLIPSOID_MAP maps uniform\n' );
  fprintf ( 1, '  points onto an ellipsoid.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension DIM_NUM =   %12d\n', dim_num );
  fprintf ( 1, '  Number of points N =          %12d\n', n );
  fprintf ( 1, '  Initial random number SEED =  %12d\n', seed );

  a = [ 3.0, 1.0; ...
        1.0,  2.0 ]';
  r = 1.0;

  [ x, seed ] = uniform_on_ellipsoid_map ( dim_num, n, a, r, seed );

  fprintf ( 1, '  Final random number SEED =    %12d\n', seed );

  r8mat_write ( file_out_name, dim_num, n, x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Data written to "%s".\n', file_out_name );

  return
end

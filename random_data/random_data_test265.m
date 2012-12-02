function random_data_test265 ( )

%*****************************************************************************80
%
%% TEST265 tests UNIFORM_ON_SPHERE01_PATCH_XYZ.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 August 2010
%
%  Author:
%
%    John Burkardt
%
  dim_num = 3;
  n = 50;
  file_out_name = 'uniform_on_sphere01_patch_xyz.txt';
  seed = 123456789;

  phi1 = 75.0 * ( pi / 180.0 );
  phi2 = 90.0 * ( pi / 180.0 );
  theta1 =  0.0 * ( pi / 360.0 );
  theta2 = 30.0 * ( pi / 360.0 );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST265\n' );
  fprintf ( 1, '  UNIFORM_ON_SPHERE01_PATCH_XYZ maps uniform\n' );
  fprintf ( 1, '  points onto an XYZ patch of the unit sphere.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension DIM_NUM =   %12d\n', dim_num );
  fprintf ( 1, '  Number of points N =          %12d\n', n );
  fprintf ( 1, '  Latitudinal angle PHI1 =      %12f\n', phi1 );
  fprintf ( 1, '  Latitudinal angle PHI2 =      %12f\n', phi2 );
  fprintf ( 1, '  Longitudinal angle THETA1 =   %12f\n', theta1 );
  fprintf ( 1, '  Longitudinal angle THETA2 =   %12f\n', theta2 );
  fprintf ( 1, '  Initial random number SEED =  %12d\n', seed );

  [ x, seed ] = uniform_on_sphere01_patch_xyz ( n, phi1, phi2, theta1, ...
    theta2, seed );

  fprintf ( 1, '  Final random number SEED =    %12d\n', seed );

  r8mat_write ( file_out_name, dim_num, n, x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Data written to "%s".\n', file_out_name );

  return
end

function random_data_test264 ( )

%*****************************************************************************80
%
%% TEST264 tests UNIFORM_ON_SPHERE01_PATCH_TP.
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
  file_out_name = 'uniform_on_sphere01_patch_tp.txt';
  seed = 123456789;

  phi1 = 75.0 * ( pi / 180.0 );
  phi2 = 90.0 * ( pi / 180.0 );
  theta1 =  0.0 * ( pi / 360.0 );
  theta2 = 30.0 * ( pi / 360.0 );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST264\n' );
  fprintf ( 1, '  UNIFORM_ON_SPHERE01_PATCH_TP maps uniform\n' );
  fprintf ( 1, '  points onto a TP (THETA,PHI) patch of the unit sphere.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension =           %12d\n', 3 );
  fprintf ( 1, '  Data dimension =              %12d\n', 2 );
  fprintf ( 1, '  Number of points N =          %12d\n', n );
  fprintf ( 1, '  Latitudinal angle PHI1 =      %12f\n', phi1 );
  fprintf ( 1, '  Latitudinal angle PHI2 =      %12f\n', phi2 );
  fprintf ( 1, '  Longitudinal angle THETA1 =   %12f\n', theta1 );
  fprintf ( 1, '  Longitudinal angle THETA2 =   %12f\n', theta2 );
  fprintf ( 1, '  Initial random number SEED =  %12d\n', seed );

  [ tp, seed ] = uniform_on_sphere01_patch_tp ( n, phi1, phi2, theta1, ...
    theta2, seed );

  fprintf ( 1, '  Final random number SEED =    %12d\n', seed );

  r8mat_write ( file_out_name, 2, n, tp );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Data written to "%s".\n', file_out_name );

  return
end

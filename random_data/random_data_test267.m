function random_data_test267 ( )

%*****************************************************************************80
%
%% TEST267 tests UNIFORM_ON_SPHERE01_TRIANGLE_XYZ.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 August 2010
%
%  Author:
%
%    John Burkardt
%
  n = 500;
  file_out_name = 'uniform_on_sphere01_triangle_xyz.txt';
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST267\n' );
  fprintf ( 1, '  UNIFORM_ON_SPHERE01_TRIANGLE_XYZ maps uniform\n' );
  fprintf ( 1, '  points onto a spherical triangle using XYZ coordinates.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension DIM_NUM =   %12d\n', 3 );
  fprintf ( 1, '  Number of points N =          %12d\n', n );
  fprintf ( 1, '  Initial random number SEED =  %12d\n', seed );

  if ( 1 )

    [ v1, seed ] = uniform_on_sphere01_map ( 3, 1, seed );
    [ v2, seed ] = uniform_on_sphere01_map ( 3, 1, seed );
    [ v3, seed ] = uniform_on_sphere01_map ( 3, 1, seed );

  else

    v1 = [ 1.0, 0.0, 0.0 ]';
    v2 = [ 0.0, 1.0, 0.0 ]';
    v3 = [ 0.0, 0.0, 1.0 ]';

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Vertices of spherical triangle:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  V1:  %10f  %10f  %10f\n', v1(1:3) );
  fprintf ( 1, '  V2:  %10f  %10f  %10f\n', v2(1:3) );
  fprintf ( 1, '  V3:  %10f  %10f  %10f\n', v3(1:3) );

  [ x, seed ] = uniform_on_sphere01_triangle_xyz ( n, v1, v2, v3, seed );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Final random number SEED =    %12d\n', seed );

  r8mat_write ( file_out_name, 3, n, x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Data written to "%s".\n', file_out_name );

  return
end

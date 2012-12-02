function geometry_test02035 ( )

%*****************************************************************************80
%
%% TEST02035 tests CYLINDER_SAMPLE_3D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 December 2010
%
%  Author:
%
%    John Burkardt
%
  n = 20;

  p1 = [ 0.0; -2.0; 0.0 ];
  p2 = [ 0.0;  2.0; 0.0 ];
  r = 1.0;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST02035\n' );
  fprintf ( 1, '  CYLINDER_SAMPLE_3D samples points in a cylinder.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Radius R = %f\n', r );
  fprintf ( 1, '  Center of bottom disk = %f  %f  %f\n', p1(1:3,1) );
  fprintf ( 1, '  Center of top disk =    %f  %f  %f\n', p2(1:3,1) );

  [ p, seed ] = cylinder_sample_3d ( p1, p2, r, n, seed );

  r8mat_transpose_print ( 3, n, p, '  Sample points:' );

  return
end

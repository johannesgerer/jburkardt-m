function geometry_test0204 ( )

%*****************************************************************************80
%
%% TEST0204 tests CYLINDER_VOLUME_3D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  dim_num = 3;

  p1 = [ 1.0, 2.0, 3.0 ];
  p2 = [ 5.0, 6.0, 5.0 ];
  r = 5.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0204\n' );
  fprintf ( 1, '  CYLINDER_VOLUME_3D computes the volume of a cylinder.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Radius R = %f\n', r );
  fprintf ( 1, '  Center of bottom disk = %14f  %14f  %14f\n', p1(1:dim_num) );
  fprintf ( 1, '  Center of top disk =    %14f  %14f  %14f\n', p2(1:dim_num) );

  volume = cylinder_volume_3d ( p1, p2, r );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Volume (computed) = %f\n', volume );
  fprintf ( 1, '  Volume (exact)    = %f\n', pi * 150.0 );

  return
end

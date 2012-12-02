function geometry_test181 ( )

%*****************************************************************************80
%
%% TEST181 tests SPHERE_DIA2IMP_3D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 May 2005
%
%  Author:
%
%    John Burkardt
%
  dim_num = 3;

  p1 = [ -1.0, -1.0, 4.0 ];
  p2 = [  5.0,  7.0, 4.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST181\n' );
  fprintf ( 1, '  SPHERE_DIA2IMP_3D converts a sphere from\n' );
  fprintf ( 1, '    diameter to implicit form.\n' );

  r8vec_print ( dim_num, p1, '  Point P1:' );
  r8vec_print ( dim_num, p2, '  Point P2:' );

  [ r, center ] = sphere_dia2imp_3d ( p1, p2 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '    Radius: %f\n', r );
 
  r8vec_print ( dim_num, center, '  The center:' );

  return
end

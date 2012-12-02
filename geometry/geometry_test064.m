function geometry_test064 ( )

%*****************************************************************************80
%
%% TEST064 tests PLANE_NORMAL2IMP_3D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 April 2009
%
%  Author:
%
%    John Burkardt
%
  dim_num = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST064\n' );
  fprintf ( 1, '  PLANE_NORMAL2IMP_3D puts a plane defined by\n' );
  fprintf ( 1, '    point, normal form into implicit ABCD form.\n' );

  pp(1:dim_num) = [ -1.0,   0.0, -1.0 ];
  normal(1:dim_num) = [ -0.2672612, -0.5345225, -0.8017837 ];
 
  r8vec_print ( dim_num, pp, '  The point PP:' );

  r8vec_print ( dim_num, normal, '  Normal vector:' );

  [ a, b, c, d ] = plane_normal2imp_3d ( pp, normal );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Output:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    (A,B,C,D)= %f  %f  %f  %f\n', a, b, c, d );

  pp(1:dim_num) = [ -16.0, 2.0, 4.0 ];
 
  normal(1:dim_num) = [ -0.2672612, -0.5345225, -0.8017837 ];

  r8vec_print ( dim_num, pp, '  The point PP:' );

  r8vec_print ( dim_num, normal, '  Normal vector:' );

  [ a, b, c, d ] = plane_normal2imp_3d ( pp, normal );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Output:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    (A,B,C,D)= %f  %f  %f  %f\n', a, b, c, d );

  return
end

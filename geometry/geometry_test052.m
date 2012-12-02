function geometry_test052 ( )

%*****************************************************************************80
%
%% TEST052 tests PLANE_EXP2NORMAL_3D.
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
  fprintf ( 1, 'TEST052\n' );
  fprintf ( 1, '  PLANE_EXP2NORMAL_3D puts a plane defined by\n' );
  fprintf ( 1, '    3 points into point, normal form.\n' );
  fprintf ( 1, '\n' );

  p1(1:dim_num) = [  -1.0, 0.0, -1.0 ];
  p2(1:dim_num) = [  -4.0, 0.0,  0.0 ];
  p3(1:dim_num) = [ -20.0, 2.0,  4.0 ];
 
  [ pp, normal ] = plane_exp2normal_3d ( p1, p2, p3 );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  P1, P2, P3:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  %10f  %10f  %10f\n', p1(1:dim_num) );
  fprintf ( 1, '  %10f  %10f  %10f\n', p2(1:dim_num) );
  fprintf ( 1, '  %10f  %10f  %10f\n', p3(1:dim_num) );

  r8vec_print ( dim_num, pp, '  The point PP:' );

  r8vec_print ( dim_num, normal, '  Normal vector:' );

  p1(1:dim_num) = [ -16.0,  2.0, 4.0 ];
  p2(1:dim_num) = [   0.0,  0.0, 0.0 ];
  p3(1:dim_num) = [   4.0, -2.0, 0.0 ];

  [ pp, normal ] = plane_exp2normal_3d ( p1, p2, p3 );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  P1, P2, P3:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  %10f  %10f  %10f\n', p1(1:dim_num) );
  fprintf ( 1, '  %10f  %10f  %10f\n', p2(1:dim_num) );
  fprintf ( 1, '  %10f  %10f  %10f\n', p3(1:dim_num) );

  r8vec_print ( dim_num, pp, '  The point PP:' );

  r8vec_print ( dim_num, normal, '  Normal vector:' );
 
  return
end

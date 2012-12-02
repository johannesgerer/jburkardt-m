function geometry_test055 ( )

%*****************************************************************************80
%
%% TEST055 tests PLANE_IMP2NORMAL_3D.
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
  fprintf ( 1, 'TEST055\n' );
  fprintf ( 1, '  PLANE_IMP2NORMAL_3D converts a plane in implicit\n' );
  fprintf ( 1, '    (A,B,C,D) form to point, normal form.\n' );

  a = 1.0;
  b = -2.0;
  c = -3.0;
  d = 6.0;
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Input:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    (A,B,C,D) = %12f  %12f  %12f  %12f\n', a, b, c, d );

  [ pp, normal ] = plane_imp2normal_3d ( a, b, c, d );

  r8vec_print ( dim_num, pp, '  The point PP:' );

  r8vec_print ( dim_num, normal, '  Normal vector:' );

  return
end

function geometry_test063 ( )

%*****************************************************************************80
%
%% TEST063 tests PLANE_NORMAL2EXP_3D.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST063\n' );
  fprintf ( 1, '  PLANE_NORMAL2EXP_3D puts a plane defined by\n' );
  fprintf ( 1, '    point, normal form into explicit form.\n' );

  pp(1:3,1) = [ -1.0;   0.0; -1.0 ];
  normal(1:3,1) = [ -0.2672612; -0.5345225; -0.8017837 ];

  r8vec_print ( 3, pp, '  The point PP:' );

  r8vec_print ( 3, normal, '  Normal vector:' );

  [ p1, p2, p3 ] = plane_normal2exp_3d ( pp, normal );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  P1, P2, P3:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  %12f  %12f  %12f\n', p1(1:3,1) );
  fprintf ( 1, '  %12f  %12f  %12f\n', p2(1:3,1) );
  fprintf ( 1, '  %12f  %12f  %12f\n', p3(1:3,1) );

  return
end

function geometry_test054 ( )

%*****************************************************************************80
%
%% TEST054 tests PLANE_IMP2EXP_3D.
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
  fprintf ( 1, 'TEST054\n' );
  fprintf ( 1, '  PLANE_IMP2EXP_3D converts a plane in implicit\n' );
  fprintf ( 1, '    (A,B,C,D) form to explicit form.\n' );

  a = 1.0;
  b = -2.0;
  c = -3.0;
  d = 6.0;

  [ p1, p2, p3 ] = plane_imp2exp_3d ( a, b, c, d );

  fprintf ( 1, '\n' );
  fprintf ( 1, '    (A,B,C,D) =\n' );
  fprintf ( 1, '  %12f  %12f  %12f  %12f\n', a, b, c, d );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  P1, P2, P3:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  %12f  %12f  %12f\n', p1(1:3,1) );
  fprintf ( 1, '  %12f  %12f  %12f\n', p2(1:3,1) );
  fprintf ( 1, '  %12f  %12f  %12f\n', p3(1:3,1) );

  return
end

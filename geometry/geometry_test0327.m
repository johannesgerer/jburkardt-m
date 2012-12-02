function geometry_test0327 ( )

%*****************************************************************************80
%
%% TEST0327 tests LINE_EXP_NORMAL_2D.
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
  ntest = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0327\n' );
  fprintf ( 1, '  LINE_EXP_NORMAL_2D determines a unit normal vector\n' );
  fprintf ( 1, '  to a given explicit line.\n' );

  p1(1:2,1) = [ 1.0; 3.0 ];
  p2(1:2,1) = [ 4.0; 0.0 ];

  r8vec_print ( 2, p1, '  Point 1: ' );
  r8vec_print ( 2, p2, '  Point 2: ' );

  normal = line_exp_normal_2d ( p1, p2 );

  r8vec_print ( 2, normal, '  Normal vector N:' );

  return
end

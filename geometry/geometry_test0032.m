function geometry_test0032 ( )

%*****************************************************************************80
%
%% TEST0032 tests ANGLE_TURN_2D.
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
  dim_num = 2;
  test_num = 13;

  p2 = [ 0.0, 0.0 ];
  p3 = [ 1.0, 0.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0032\n' );
  fprintf ( 1, '  ANGLE_TURN_2D computes the turning angle\n' );
  fprintf ( 1, '  defined by the line segments [P1,P2] and [P2,P3].\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Our three points are:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    P1 = (C,S)\n' );
  fprintf ( 1, '    P2 = (0,0)\n' );
  fprintf ( 1, '    P3 = (1,0)\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  C = cosine ( theta), S = sine ( theta ).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Test  Theta    Angle\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num

    theta = 2.0 * pi * ( test - 1 ) / ( test_num - 1 );

    theta_degrees = 360.0 * ( test - 1 ) / ( test_num - 1 );
%
%  Flaky features of COS mean I have to do this as two separate calls.
%
    p1(1) = cos ( theta );
    p1(2) = sin ( theta );

    turn = angle_turn_2d ( p1, p2, p3 );

    fprintf ( 1, '  %4d  %4f  %14f\n', test, theta_degrees, turn );

  end

  return
end

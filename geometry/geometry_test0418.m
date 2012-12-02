function geometry_test0418 ( )

%*****************************************************************************80
%
%% TEST0418 tests SEGMENTS_CURVATURE_2D.
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
  test_num = 13;

  p1 = [ 0.0; 0.0 ];
  p2 = [ 1.0; 0.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0418\n' );
  fprintf ( 1, '  SEGMENTS_CURVATURE_2D computes the local curvature\n' );
  fprintf ( 1, '  defined by the line segments [P1,P2] and [P2,P3].\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Our three points are:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    P1 = (0,0)\n' );
  fprintf ( 1, '    P2 = (1,0)\n' );
  fprintf ( 1, '    P3 = (C,S)\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  C = cosine ( theta), S = sine ( theta ).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Test  Theta  Curvature\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num

    theta = 2.0 * pi * ( test - 1) / ( test_num - 1);

    theta_degrees = 360.0 * ( test - 1 ) / ( test_num - 1 );

    p3(1,1) = cos ( theta );
    p3(2,1) = sin ( theta );

    curvature = segments_curvature_2d ( p1, p2, p3 );

    fprintf ( 1, '  %4d  %5f  %14f\n', test, theta_degrees, curvature );

  end

  return
end

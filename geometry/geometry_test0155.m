function geometry_test0155 ( )

%*****************************************************************************80
%
%% TEST0155 tests CIRCLE_EXP2IMP_2D.
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

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0155\n' );
  fprintf ( 1, '  CIRCLE_EXP2IMP_2D computes the radius and\n' );
  fprintf ( 1, '    center of the circle through three points.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  We can use this routine to compute, for three\n' );
  fprintf ( 1, '  points in space, the circle incident to those\n' );
  fprintf ( 1, '  points, and hence the radius of that circle,\n' );
  fprintf ( 1, '  and hence the "curvature" of those points.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Our three points are:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    (0,0)\n' );
  fprintf ( 1, '    (1,0)\n' );
  fprintf ( 1, '    (C,S)\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  C = cosine ( theta), S = sine ( theta ).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Test  Theta  Curvature\n' );
  fprintf ( 1, '\n' );

  p1(1:2,1) = [ 0.0; 0.0 ];
  p2(1:2,1) = [ 1.0; 0.0 ];

  for test = 1 : test_num

    theta = 2.0 * pi * ( test - 1 ) / ( test_num - 1 );

    theta_degrees = 360.0 * ( test - 1 ) / ( test_num - 1 );
%
%  A flaky peculiarity of MATLAB means I have to do this as
%  two statements, not one.
%
    p3(1,1) = cos ( theta );
    p3(2,1) = sin ( theta );

    [ r, pc ] = circle_exp2imp_2d ( p1, p2, p3 );

    if ( 0.0 < r )
      curvature = 1.0 / r;
    else
      curvature = 0.0;
    end

    fprintf ( 1, '  %4d  %5f  %14f\n', test, theta_degrees, curvature );

  end

  return
end

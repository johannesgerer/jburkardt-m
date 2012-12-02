function geometry_test0023 ( )

%*****************************************************************************80
%
%% TEST0023 tests ANGLE_HALF_2D;
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
  fprintf ( 1, 'TEST0023\n' );
  fprintf ( 1, '  ANGLE_HALF_2D computes the half angle between two rays;\n' );
  fprintf ( 1, '  The angle is defined by the points (P1,P2,P3)\n' );
  fprintf ( 1, '  or by the rays P2-->P3, P2-->P1.\n' );

  p2(1:2,1) = [ 5.0; 3.0 ];

  angle_deg = 75.0;
  r = 3.0;
  p1(1,1) = p2(1,1) + r * cos_deg ( angle_deg );
  p1(2,1) = p2(2,1) + r * sin_deg ( angle_deg );

  angle_deg = 15.0;
  r = 2.0;
  p3(1,1) = p2(1,1) + r * cos_deg ( angle_deg );
  p3(2,1) = p2(2,1) + r * sin_deg ( angle_deg );

  r8vec_print ( 2, p1, '  Point P1:' );
  r8vec_print ( 2, p2, '  Point P2:' );
  r8vec_print ( 2, p3, '  Point P3:' );

  p4 = angle_half_2d ( p1, p2, p3 );

  r8vec_print ( 2, p4, ...
    '  End point of unit ray from P2, defining half angle, P4:' );

  angle_deg = 45.0;
  r = 1.0;
  p4(1,1) = p2(1,1) + r * cos_deg ( angle_deg );
  p4(2,1) = p2(2,1) + r * sin_deg ( angle_deg );

  r8vec_print ( 2, p4, '  Expected value of P4:' );

  return
end

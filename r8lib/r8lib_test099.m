function r8lib_test099 ( )

%*****************************************************************************80
%
%% TEST099 tests R8POLY2_EX and R8POLY2_EX2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST099\n' );
  fprintf ( 1, '  R8POLY2_EX finds the extreme value\n' );
  fprintf ( 1, '    of a parabola determined by three points.\n' );
  fprintf ( 1, '  R8POLY2_EX2 finds the extreme value\n' );
  fprintf ( 1, '    of a parabola determined by three points.\n' );

  a =  2.0;
  b = -4.0;
  c = 10.0;

  x1 = 1.0;
  y1 = a * x1 * x1 + b * x1 + c;
  x2 = 2.0;
  y2 = a * x2 * x2 + b * x2 + c;
  x3 = 3.0;
  y3 = a * x3 * x3 + b * x3 + c;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Parabolic coefficients:\n' );
  fprintf ( 1, '  A = %f, B = %f, C = %f\n', a, b, c );
  fprintf ( 1, '\n' );
  r8r8_print ( x1, y1, '  Point 1' );
  r8r8_print ( x2, y2, '  Point 2' );
  r8r8_print ( x3, y3, '  Point 3' );

  a = 0.0;
  b = 0.0;
  c = 0.0;

  [ xmin, ymin, ierror ] = r8poly2_ex ( x1, y1, x2, y2, x3, y3 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  R8POLY2_EX returns XMIN = %f, YMIN = %f\n', xmin, ymin );

  [ xmin, ymin, a, b, c, ierror ] = r8poly2_ex2 ( x1, y1, x2, y2, x3, y3 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  R8POLY2_EX2 returns XMIN = %f, YMIN = %f\n', xmin, ymin );
  fprintf ( 1, '  and A = %f, B = %f, C = %f\n', a, b, c );

  return
end

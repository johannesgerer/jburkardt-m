function geometry_test0493 ( )

%*****************************************************************************80
%
%% TEST0493 tests PARABOLA_EX, PARABOLA_EX2.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0493\n' );
  fprintf ( 1, '  PARABOLA_EX finds the extreme value of a parabola\n' );
  fprintf ( 1, '    determined by three points.\n' );
  fprintf ( 1, '  PARABOLA_EX2 finds the extreme value of a parabola\n' );
  fprintf ( 1, '    determined by three points.\n' );

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
  fprintf ( 1, '  Parabolic coefficients (A,B,C) = %f  %f  %f\n', a, b, c );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  X, Y data\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  X1, Y1 = %f  %f\n', x1, y1 );
  fprintf ( 1, '  X2, Y2 = %f  %f\n', x2, y2 );
  fprintf ( 1, '  X3, Y3 = %f  %f\n', x3, y3 );

  a = 0.0;
  b = 0.0;
  c = 0.0;

  [ xmin, ymin, ierror ] = parabola_ex ( x1, y1, x2, y2, x3, y3 );

  if ( ierror == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  PARABOLA_EX returns (XMIN,YMIN) = %f  %f\n', xmin, ymin );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, '  PARABOLA_EX returns error code %d\n', ierror );
  end

  [ xmin, ymin, a, b, c, ierror ] = parabola_ex2 ( x1, y1, x2, y2, x3, y3 );

  if ( ierror == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  PARABOLA_EX2 returns (XMIN,YMIN) = %f  %f\n', xmin, ymin );
    fprintf ( 1, '  and (A,B,C) = %f  %f  %f\n', a, b, c );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, '  PARABOLA_EX2 returns error code %d\n', ierror );
  end

  return
end

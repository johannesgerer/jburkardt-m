function geometry_test047 ( )

%*****************************************************************************80
%
%% TEST047 tests MINQUAD.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 April 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST047\n' );
  fprintf ( 1, '  MINQUAD finds the minimum of a function\n' );
  fprintf ( 1, '    F(X) = A * X * X + B * X + C\n' );
  fprintf ( 1, '    within an interval, given three data points.\n' );
%
%  Case 1: a minimum is in the interval.
%  y = ( x - 1 ).^2 + 4
%
  x1 = 0.0;
  y1 = ( x1 - 1.0 ).^2 + 4.0;

  x2 = 2.0;
  y2 = ( x2 - 1.0 ).^2 + 4.0;

  x3 = 3.0;
  y3 = ( x3 - 1.0 ).^2 + 4.0;

  [ xmin, ymin ] = minquad ( x1, y1, x2, y2, x3, y3 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The minimum lies in the interval.\n' );
  fprintf ( 1, '  X1,   Y1   = %8f  %8f\n', x1, y1 );
  fprintf ( 1, '  X2,   Y2   = %8f  %8f\n', x2, y2 );
  fprintf ( 1, '  X3,   Y3   = %8f  %8f\n', x3, y3 );
  fprintf ( 1, '  XMIN, YMIN = %8f  %8f\n', xmin, ymin );
%
%  Case 2: the minimum is to the left of the interval.
%  y = ( x - 1 ).^2 + 4
%
  x1 = 2.0;
  y1 = ( x1 - 1.0 ).^2 + 4.0;

  x2 = 4.0;
  y2 = ( x2 - 1.0 ).^2 + 4.0;

  x3 = 5.0;
  y3 = ( x3 - 1.0 ).^2 + 4.0;

  [ xmin, ymin ] = minquad ( x1, y1, x2, y2, x3, y3 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The minimum is to the left of the interval\n' );
  fprintf ( 1, '  X1,   Y1   = %8f  %8f\n', x1, y1 );
  fprintf ( 1, '  X2,   Y2   = %8f  %8f\n', x2, y2 );
  fprintf ( 1, '  X3,   Y3   = %8f  %8f\n', x3, y3 );
  fprintf ( 1, '  XMIN, YMIN = %8f  %8f\n', xmin, ymin );
%
%  Case 3: the function is flat.
%
  x1 = 11.0;
  y1 = 6.0;

  x2 = 6.0;
  y2 = 6.0;

  x3 = 2.0;
  y3 = 6.0;

  [ xmin, ymin ] = minquad ( x1, y1, x2, y2, x3, y3 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The function is flat.\n' );
  fprintf ( 1, '  X1,   Y1   = %8f  %8f\n', x1, y1 );
  fprintf ( 1, '  X2,   Y2   = %8f  %8f\n', x2, y2 );
  fprintf ( 1, '  X3,   Y3   = %8f  %8f\n', x3, y3 );
  fprintf ( 1, '  XMIN, YMIN = %8f  %8f\n', xmin, ymin );
%
%  Case 4: the function has a maximum.
%  y = - ( x - 1 ).^2 + 4
%
  x1 = 0.0;
  y1 = - ( x1 - 1.0 ).^2 + 4.0;

  x2 = 2.0;
  y2 = - ( x2 - 1.0 ).^2 + 4.0;

  x3 = 3.0;
  y3 = - ( x3 - 1.0 ).^2 + 4.0;

  [ xmin, ymin ] = minquad ( x1, y1, x2, y2, x3, y3 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The function has a maximum.\n' );
  fprintf ( 1, '  X1,   Y1   = %8f  %8f\n', x1, y1 );
  fprintf ( 1, '  X2,   Y2   = %8f  %8f\n', x2, y2 );
  fprintf ( 1, '  X3,   Y3   = %8f  %8f\n', x3, y3 );
  fprintf ( 1, '  XMIN, YMIN = %8f  %8f\n', xmin, ymin );

  return
end

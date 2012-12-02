function geometry_test046 ( )

%*****************************************************************************80
%
%% TEST046 tests MINABS.
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
  fprintf ( 1, 'TEST046\n' );
  fprintf ( 1, '  MINABS finds the minimum of a function\n' );
  fprintf ( 1, '    F(X) = a * ABS ( X ) + B\n' );
  fprintf ( 1, '  within an interval, given three data points.\n' );
%
%  Case 1: the three points lie on a straight line.
%  (XMIN=9,YMIN=2).
%
  x1 = 14.0;
  y1 = 7.0;

  x2 = 9.0;
  y2 = 2.0;

  x3 = 12.0;
  y3 = 5.0;

  [ xmin, ymin ] = minabs ( x1, y1, x2, y2, x3, y3 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The points lie on a straight line.\n' );
  fprintf ( 1, '  XMIN, YMIN = %8f  %8f\n', xmin, ymin );
%
%  Case 2: the three points straddle a minimum.
%  (XMIN=7, YMIN=2).
%
  x1 = 3.0;
  y1 = 6.0;

  x2 = 12.0;
  y2 = 7.0;

  x3 = 9.0;
  y3 = 4.0;

  [ xmin, ymin ] = minabs ( x1, y1, x2, y2, x3, y3 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The points straddle a minimum.\n' );
  fprintf ( 1, '  XMIN, YMIN = %8f  %8f\n', xmin, ymin );
%
%  Case 3: the three points straddle a maximum.
%  (XMIN=2, YMIN=5).
%
  x1 = 11.0;
  y1 = 6.0;

  x2 = 6.0;
  y2 = 9.0;

  x3 = 2.0;
  y3 = 5.0;

  [ xmin, ymin ] = minabs ( x1, y1, x2, y2, x3, y3 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The points straddle a maximum.\n' );
  fprintf ( 1, '  XMIN, YMIN = %8f  %8f\n', xmin, ymin );

  return
end

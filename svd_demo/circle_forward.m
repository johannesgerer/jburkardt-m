function circle_forward ( a )

%*****************************************************************************80
%
%% CIRCLE_FORWARD plots the image of the unit circle under the 2x2 matrix A.
%
%  Discussion:
%
%    A typical 2x2 matrix will map the unit circle to some kind of tilted ellipse.
%    The aspect ratio of the ellipse (ratio of major to minor axes) is a measure
%    of the conditioning of the matrix.
%
%    A singular matrix maps the unit circle to a line.
%
%    A diagonal matrix maps the unit circle to an ellipse with no tilting.
%    (There is no rotation.)
%
%    An orthogonal matrix maps the unit circle to the unit circle (but points
%    may have rotated.)
%
%    The identity matrix maps the unit circle to itself.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A(2,2), the matrix whose mapping of the unit circle 
%    is to be studied.
%

%
%  This call produces matrices U, S and V.
%
% [ u, s, v ] = svd ( a );
%
%  This call produces just the singular values, and in a vector, not a matrix.
%
  s = svd ( a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Singular values of A are %f and %f\n', s(1), s(2) );
%
%  Select N+1 evenly spaced points X on the unit circle.
%
  n = 32;

  i = [ 0 : n ];

  angle = 2 * pi * i / n;

  r = 1;

  x = [ r * cos(angle); r * sin(angle) ];
%
%  AX contains the image of each point under the mapping X -> A*X.
%
  ax =  a * x;
%
%  Plot the corners of the region.  This is a trick to force MATLAB
%  to plot in a square with equal axes.  I don't know why it seems to
%  hard to get this to happen in general!
%
  s = [];

  p_min = min ( min ( min ( ax ) ), min ( min ( x ) ) );
  p_max = max ( max ( max ( ax ) ), max ( max ( x ) ) );

  scatter ( [ p_min, p_max, p_max, p_min ], [ p_min, p_min, p_max, p_max ], s, 'k' );
  axis ( [ p_min, p_max, p_min, p_max ] );

  axis equal
  axis tight
  axis square

  hold on
%
%  Plot the points X on the unit circle.
%
  scatter ( x(1,:), x(2,:), s, 'b', 'filled' );
%
%  Plot the points AX on the image of the unit circle.
%
  scatter ( ax(1,:), ax(2,:), s, 'r', 'filled' );
%
%  Plot vectors for "3-oclock" and "12-oclock".
%
  line ( [ 0, x(1,1)], [ 0, x(2,1)], 'color', 'b' );
  line ( [ 0, x(1,n/4+1)], [ 0, x(2,n/4+1)], 'color', 'b' );
%
%  Plot the images of "3-oclock" and "12-oclock".
%
  line ( [ 0, ax(1,1)], [ 0, ax(2,1)], 'color', 'r' );
  line ( [ 0, ax(1,n/4+1)], [ 0, ax(2,n/4+1)], 'color', 'r' );

  xlabel ( '--X axis--' )
  ylabel ( '--Y axis--' )
  title ( 'X in blue, A*X in red' );

  hold off

  return
end

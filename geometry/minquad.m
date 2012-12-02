function [ xmin, ymin ] = minquad ( x1, y1, x2, y2, x3, y3 )

%*****************************************************************************80
%
%% MINQUAD finds a local minimum of F(X) = A * X * X + B * X + C.
%
%  Discussion:
%
%    MINQUAD is primarily intended as a utility routine.
%    The square of the distance function between a point
%    and a line segment has the form of F(X).  Hence, we can seek
%    the line on the second segment which minimizes the square of
%    the distance to the other line segment.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 March 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X1, Y1, X2, Y2, X3, Y3, three sets of data
%    of the form ( X, F(X) ).  The three X values must be distinct.
%
%    Output, real XMIN, YMIN.  XMIN is a point within the interval
%    spanned by X1, X2 and X3, at which F takes its local minimum value YMIN.
%

%
%  Refuse to deal with coincident data.
%
  if ( x1 == x2 | x2 == x3 | x3 == x1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MINQUAD - Fatal error!\n' );
    fprintf ( 1, '  X values are equal.\n' );
    error ( 'MINQUAD - Fatal error!' );
  end
%
%  Find the interval endpoints.
%
  xleft = min ( x1, min ( x2, x3 ) );
  xrite = max ( x1, max ( x2, x3 ) );
%
%  Find the minimizer and its function value, over the three input points.
%
  if ( y1 <= y2 & y1 <= y3 )
    xmin = x1;
    ymin = y1;
  elseif ( y2 <= y1 & y2 <= y3 )
    xmin = x2;
    ymin = y2;
  else
    xmin = x3;
    ymin = y3;
  end
%
%  Find the minimizer and its function value over the real line.
%
  [ x, y, ierror ] = parabola_ex ( x1, y1, x2, y2, x3, y3 );
%
%  If F is linear, then take the already computed min.
%
  if ( ierror == 2 )
%
%  If F has a maximum, then take the already computed min.
%
  elseif ( ymin < y )
%
%  If the minimizer is to the left, take the already computed min.
%
  elseif ( x < xleft )
%
%  If the minimizer is to the right, take the already computed min.
%
  elseif ( xrite < x )

  else

    xmin = x;
    ymin = y;

  end

  return
end


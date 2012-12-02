function [ x, y, a, b, c, ierror ] = parabola_ex2 ( x1, y1, x2, y2, x3, y3 )

%*****************************************************************************80
%
%% PARABOLA_EX2 finds the extremal point of a parabola determined by three points.
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
%    Input, real X1, Y1, X2, Y2, X3, Y3, the coordinates of 
%    three points on the parabola.  X1, X2 and X3 must be distinct.
%
%    Output, real X, Y, the X coordinate of the extremal point
%    of the parabola, and the value of the parabola at that point.
%
%    Output, real A, B, C, the coefficients that define the
%    parabola: P(X) = A * X * X + B * X + C.
%
%    Output, integer IERROR, error flag.
%    0, no error.
%    1, two of the X values are equal.
%    2, the data lies on a straight line; there is no finite extremal
%    point.
%
  ierror = 0;

  if ( x1 == x2 | x2 == x3 | x3 == x1 )
    ierror = 1;
    return
  end

  if ( y1 == y2 & y2 == y3 & y3 == y1 )
    x = x1;
    y = y1;
    return
  end
%
%  Set up the Vandermonde matrix.
%
  v(1,1) = 1.0;
  v(1,2) = x1;
  v(1,3) = x1 * x1;

  v(2,1) = 1.0;
  v(2,2) = x2;
  v(2,3) = x2 * x2;

  v(3,1) = 1.0;
  v(3,2) = x3;
  v(3,3) = x3 * x3;
%
%  Get the inverse.
%
  [ w, det ] = r8mat_inverse_3d ( v );
%
%  Compute the parabolic coefficients.
%
  c = w(1,1) * y1 + w(1,2) * y2 + w(1,3) * y3;
  b = w(2,1) * y1 + w(2,2) * y2 + w(2,3) * y3;
  a = w(3,1) * y1 + w(3,2) * y2 + w(3,3) * y3;
%
%  Determine the extremal point.
%
  if ( a == 0.0 )
    ierror = 2;
    return
  end

  x = - b / ( 2.0 * a );
  y = a * x * x + b * x + c;

  return
end

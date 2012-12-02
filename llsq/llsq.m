function [ a, b ] = llsq ( n, x, y )

%*****************************************************************************80
%
%% LLSQ solves a linear least squares problem matching a line to data.
%
%  Discussion:
%
%    A formula for a line of the form Y = A * X + B is sought, which
%    will minimize the root-mean-square error to N data points ( X(I), Y(I) );
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    09 March 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of data values.
%
%    Input, real X(N), Y(N), the coordinates of the data points.
%
%    Output, real A, B, the slope and Y-intercept of the 
%    least-squares approximant to the data.
%

%
%  Special case.
%
  if ( n == 1 )
    a = 0.0;
    b = y(1);
    return
  end
%
%  Average X and Y.
%
  xbar = sum ( x(1:n) ) / n;
  ybar = sum ( y(1:n) ) / n;
%
%  Compute Beta.
%
  xb = x(1:n) - xbar;
  yb = y(1:n) - ybar;

  top = xb' * yb;
  bot = xb' * xb;

  a = top / bot;

  b = ybar - a * xbar;

  return
end

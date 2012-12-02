function [ data_x, data_y ] = spline_linear_intset ( n, int_x, int_v )

%*****************************************************************************80
%
%% SPLINE_LINEAR_INTSET sets a piecewise linear spline with given integral properties.
%
%  Discussion:
%
%    The user has in mind an interval, divided by INT_N+1 points into
%    INT_N intervals.  A linear spline is to be constructed,
%    with breakpoints at the centers of each interval, and extending
%    continuously to the left of the first and right of the last
%    breakpoints.  The constraint on the linear spline is that it is
%    required that it have a given integral value over each interval.
%
%    A tridiagonal linear system of equations is solved for the
%    values of the spline at the breakpoints.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 February 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of intervals.
%
%    Input, real INT_X(N+1), the points that define the intervals.
%    Interval I lies between INT_X(I) and INT_X(I+1).
%
%    Input, real INT_V(N), the desired value of the integral of the
%    linear spline over each interval.
%
%    Output, real DATA_X(N), DATA_Y(N), the values of the independent
%    and dependent variables at the data points.  The values of DATA_X are
%    the interval midpoints.  The values of DATA_Y are determined in such
%    a way that the exact integral of the linear spline over interval I
%    is equal to INT_V(I).
%

%
%  Set up the easy stuff.
%
  data_x(1:n) = 0.5E+00 * ( int_x(1:n) + int_x(2:n+1) );
%
%  Set up C, D, E, the coefficients of the linear system.
%
  a = zeros(3,n);

  a(3,1:n-2) = 1.0E+00 ...
    - ( 0.5E+00 * ( data_x(2:n-1) + int_x(2:n-1) ) - data_x(1:n-2) ) ...
    ./ ( data_x(2:n-1) - data_x(1:n-2) );
  a(3,n-1) = 0.0E+00;
  a(3,n) = 0.0E+00;

  a(2,1) = int_x(2) - int_x(1);

  a(2,2:n-1) = 1.0E+00 ...
    + ( 0.5E+00 * ( data_x(2:n-1) + int_x(2:n-1) ) ...
    - data_x(1:n-2) ) ...
    ./ ( data_x(2:n-1) - data_x(1:n-2) ) ...
    - ( 0.5E+00 * ( data_x(2:n-1) + int_x(3:n) ) - data_x(2:n-1) ) ...
    ./ ( data_x(3:n) - data_x(2:n-1) );

  a(2,n) = int_x(n+1) - int_x(n);

  a(1,1) = 0.0E+00;
  a(1,2) = 0.0E+00;

  a(1,3:n) = ( 0.5E+00 * ( data_x(2:n-1) + int_x(3:n) ) ...
    - data_x(2:n-1) ) ./ ( data_x(3:n) - data_x(2:n-1) );
%
%  Set up DATA_Y, which begins as the right hand side of the linear system.
%  
  b(1) = int_v(1);
  b(2:n-1) = 2.0E+00 * int_v(2:n-1) ./ ( int_x(3:n) - int_x(2:n-1) );
  b(n) = int_v(n);
%
%  Solve the linear system.
%
  data_y = d3_np_fs ( n, a, b );

  return
end

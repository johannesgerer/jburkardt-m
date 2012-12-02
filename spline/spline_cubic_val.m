function [ yval, ypval, yppval ] = spline_cubic_val ( n, t, y, ypp, tval )

%*****************************************************************************80
%
%% SPLINE_CUBIC_VAL evaluates a piecewise cubic spline at a point.
%
%  Discussion:
%
%    SPLINE_CUBIC_SET must have already been called to define the
%    values of YPP.
%
%    For any point T in the interval T(IVAL), T(IVAL+1), the form of
%    the spline is
%
%      SPL(T) = A
%             + B * ( T - T(IVAL) )
%             + C * ( T - T(IVAL) )**2
%             + D * ( T - T(IVAL) )**3
%
%    Here:
%      A = Y(IVAL)
%      B = ( Y(IVAL+1) - Y(IVAL) ) / ( T(IVAL+1) - T(IVAL) )
%        - ( YPP(IVAL+1) + 2 * YPP(IVAL) ) * ( T(IVAL+1) - T(IVAL) ) / 6
%      C = YPP(IVAL) / 2
%      D = ( YPP(IVAL+1) - YPP(IVAL) ) / ( 6 * ( T(IVAL+1) - T(IVAL) ) )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 February 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Carl de Boor,
%    A Practical Guide to Splines,
%    Springer Verlag, 1978.
%
%  Parameters:
%
%    Input, integer N, the number of data values.
%
%    Input, real T(N), the knot values.
%
%    Input, real Y(N), the data values at the knots.
%
%    Input, real YPP(N), the second derivatives of the spline at the knots.
%
%    Input, real TVAL, a point, typically between T(1) and T(N), at
%    which the spline is to be evalulated.  If TVAL lies outside
%    this range, extrapolation is used.
%
%    Output, real YVAL, YPVAL, YPPVAL, the value of the spline, and
%    its first two derivatives at TVAL.
%

%
%  Determine the interval [T(LEFT), T(RIGHT)] that contains TVAL.
%  Values below T(1) or above T(N) use extrapolation.
%
  [ left, right ] = r8vec_bracket ( n, t, tval );
%
%  Evaluate the polynomial.
%
  dt = tval - t(left);
  h = t(right) - t(left);

  yval = y(left) ...
       + dt * ( ( y(right) - y(left) ) / h ...
              - ( ypp(right) / 6.0 + ypp(left) / 3.0 ) * h ...
       + dt * ( 0.5 * ypp(left) ...
       + dt * ( ( ypp(right) - ypp(left) ) / ( 6.0 * h ) ) ) );

  ypval = ( y(right) - y(left) ) / h ...
       - ( ypp(right) / 6.0 + ypp(left) / 3.0 ) * h ...
       + dt * ( ypp(left) ...
       + dt * ( 0.5 * ( ypp(right) - ypp(left) ) / h ) );

  yppval = ypp(left) + dt * ( ypp(right) - ypp(left) ) / h;

  return
end

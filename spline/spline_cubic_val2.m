function [ yval, ypval, yppval, left_out ] = spline_cubic_val2 ( ...
  n, t, y, ypp, left, tval )

%*****************************************************************************80
%
%% SPLINE_CUBIC_VAL2 evaluates a piecewise cubic spline at a point.
%
%  Discussion:
%
%    This routine is a modification of SPLINE_CUBIC_VAL; it allows the
%    user to speed up the code by suggesting the appropriate T interval
%    to search first.
%
%    SPLINE_CUBIC_SET must have already been called to define the
%    values of YPP.
%
%    In the LEFT interval, let RIGHT = LEFT+1.  The form of the spline is
%
%      SPL(T) =
%          A
%        + B * ( T - T(LEFT) )
%        + C * ( T - T(LEFT) )**2
%        + D * ( T - T(LEFT) )**3
%
%    Here:
%      A = Y(LEFT)
%      B = ( Y(RIGHT) - Y(LEFT) ) / ( T(RIGHT) - T(LEFT) )
%        - ( YPP(RIGHT) + 2 * YPP(LEFT) ) * ( T(RIGHT) - T(LEFT) ) / 6
%      C = YPP(LEFT) / 2
%      D = ( YPP(RIGHT) - YPP(LEFT) ) / ( 6 * ( T(RIGHT) - T(LEFT) ) )
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
%  Reference:
%
%    Carl de Boor,
%    A Practical Guide to Splines,
%    Springer Verlag, 1978.
%
%  Parameters:
%
%    Input, integer N, the number of knots.
%
%    Input, real T(N), the knot values.
%
%    Input, real Y(N), the data values at the knots.
%
%    Input, real YPP(N), the second derivatives of the spline at
%    the knots.
%
%    Input, integer LEFT, the suggested T interval to search.
%    LEFT should be between 1 and N-1.  If LEFT is not in this range,
%    then its value will be ignored.
%
%    Input, real TVAL, a point, typically between T(1) and T(N), at
%    which the spline is to be evalulated.  If TVAL lies outside
%    this range, extrapolation is used.
%
%    Output, real YVAL, YPVAL, YPPVAL, the value of the spline, and
%    its first two derivatives at TVAL.
%
%    Output, integer LEFT_OUT, the actual interval in which TVAL lies.
%
  left_out = left;
%
%  Determine the interval [T(LEFT), T(RIGHT)] that contains TVAL.
%
%  What you want from R8VEC_BRACKET3 is that TVAL is to be computed
%  by the data in interval {T(LEFT), T(RIGHT)].
%
  left_out = r8vec_bracket3 ( n, t, tval, left_out );
  right = left_out + 1;
%
%  In the interval LEFT_OUT, the polynomial is in terms of a normalized
%  coordinate  ( DT / H ) between 0 and 1.
%
  dt = tval - t(left_out);
  h = t(right) - t(left_out);

  yval = y(left_out) + dt * ( ( y(right) - y(left_out) ) / h ...
              - ( ypp(right) / 6.0 + ypp(left_out) / 3.0 ) * h ...
       + dt * ( 0.5 * ypp(left_out) ...
       + dt * ( ( ypp(right) - ypp(left_out) ) / ( 6.0 * h ) ) ) );

  ypval = ( y(right) - y(left_out) ) / h ...
      - ( ypp(right) / 6.0 + ypp(left_out) / 3.0 ) * h ...
      + dt * ( ypp(left_out) ...
      + dt * ( 0.5 * ( ypp(right) - ypp(left_out) ) / h ) );

  yppval = ypp(left_out) + dt * ( ypp(right) - ypp(left_out) ) / h;

  return
end

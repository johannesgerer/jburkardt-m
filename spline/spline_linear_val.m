function [ yval, ypval ] = spline_linear_val ( ndata, tdata, ydata, tval )

%*****************************************************************************80
%
%% SPLINE_LINEAR_VAL evaluates a piecewise linear spline at a point.
%
%  Discussion:
%
%    Because of the extremely simple form of the linear spline,
%    the raw data points ( TDATA(I), YDATA(I)) can be used directly to
%    evaluate the spline at any point.  No processing of the data
%    is required.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 January 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NDATA, the number of data points defining the spline.
%
%    Input, real TDATA(NDATA), YDATA(NDATA), the values of the independent
%    and dependent variables at the data points.  The values of TDATA should
%    be distinct and increasing.
%
%    Input, real TVAL, the point at which the spline is to be evaluated.
%
%    Output, real YVAL, YPVAL, the value of the spline and its first
%    derivative dYdT at TVAL.  YPVAL is not reliable if TVAL is exactly
%    equal to TDATA(I) for some I.
%

%
%  Find the interval [ TDATA(LEFT), TDATA(RIGHT) ] that contains, or is
%  nearest to, TVAL.
%
  [ left, right ] = r8vec_bracket ( ndata, tdata, tval );
%
%  Now evaluate the piecewise linear function.
%
  ypval = ( ydata(right) - ydata(left) ) / ( tdata(right) - tdata(left) );

  yval = ydata(left) +  ( tval - tdata(left) ) * ypval;

  return
end

function yval = spline_constant_val ( ndata, tdata, ydata, tval )

%*****************************************************************************80
%
%% SPLINE_CONSTANT_VAL evaluates a piecewise constant spline at a point.
%
%  Discussion:
%
%    NDATA-1 points TDATA define NDATA intervals, with the first
%    and last being semi-infinite.
%
%    The value of the spline anywhere in interval I is YDATA(I).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 February 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NDATA, the number of data points defining the spline.
%
%    Input, real TDATA(NDATA-1), the breakpoints.  The values of TDATA should
%    be distinct and increasing.
%
%    Input, real YDATA(NDATA), the values of the spline in the intervals
%    defined by the breakpoints.
%
%    Input, real TVAL, the point at which the spline is to be evaluated.
%
%    Output, real YVAL, the value of the spline at TVAL.
%
  for i = 1 : ndata-1
    if ( tval <= tdata(i) )
      yval = ydata(i);
      return
    end 
  end

  yval = ydata(ndata);

  return
end

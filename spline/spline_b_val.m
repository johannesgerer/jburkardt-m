function yval = spline_b_val ( ndata, tdata, ydata, tval )

%*****************************************************************************80
%
%% SPLINE_B_VAL evaluates a cubic B spline approximant.
%
%  Discussion:
%
%    The cubic B spline will approximate the data, but is not
%    designed to interpolate it.
%
%    In effect, two "phantom" data values are appended to the data,
%    so that the spline will interpolate the first and last data values.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 August 2005
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
%    Input, integer NDATA, the number of data values.
%
%    Input, real TDATA(NDATA), the abscissas of the data.
%
%    Input, real YDATA(NDATA), the data values.
%
%    Input, real TVAL, a point at which the spline is to be evaluated.
%
%    Output, real YVAL, the value of the function at TVAL.
%
 
%
%  Find the nearest interval [ TDATA(LEFT), TDATA(RIGHT) ] to TVAL.
%
  [ left, right ] = r8vec_bracket ( ndata, tdata, tval );
%
%  Evaluate the 5 nonzero B spline basis functions in the interval,
%  weighted by their corresponding data values.
%
  u = ( tval - tdata(left) ) / ( tdata(right) - tdata(left) );
  yval = 0.0;
%
%  B function associated with node LEFT - 1, (or "phantom node"),
%  evaluated in its 4th interval.
%
  bval = ( ( (     - 1.0   ...
               * u + 3.0 ) ...
               * u - 3.0 ) ...
               * u + 1.0 ) / 6.0;

  if ( 0 < left-1 )
    yval = yval + ydata(left-1) * bval;
  else
    yval = yval + ( 2.0 * ydata(1) - ydata(2) ) * bval;
  end
%
%  B function associated with node LEFT,
%  evaluated in its third interval.
%
  bval = ( ( (       3.0   ...
               * u - 6.0 ) ...
               * u + 0.0 ) ...
               * u + 4.0 ) / 6.0;

  yval = yval + ydata(left) * bval;
%
%  B function associated with node RIGHT,
%  evaluated in its second interval.
%
  bval = ( ( (     - 3.0   ...
               * u + 3.0 ) ...
               * u + 3.0 ) ...
               * u + 1.0 ) / 6.0;

  yval = yval + ydata(right) * bval;
%
%  B function associated with node RIGHT+1, (or "phantom node"),
%  evaluated in its first interval.
%
  bval = u^3 / 6.0;

  if ( right+1 <= ndata )
    yval = yval + ydata(right+1) * bval;
  else
    yval = yval + ( 2.0 * ydata(ndata) - ydata(ndata-1) ) * bval;
  end

  return
end

function yval = spline_beta_val ( beta1, beta2, ndata, tdata, ydata, tval )

%*****************************************************************************80
%
%% SPLINE_BETA_VAL evaluates a cubic beta spline approximant.
%
%  Discussion:
%
%    The cubic beta spline will approximate the data, but is not
%    designed to interpolate it.
%
%    If BETA1 = 1 and BETA2 = 0, the cubic beta spline will be the
%    same as the cubic B spline approximant.
%
%    With BETA1 = 1 and BETA2 large, the beta spline becomes more like
%    a linear spline.
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
%    11 February 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real BETA1, the skew or bias parameter.
%    BETA1 = 1 for no skew or bias.
%
%    Input, real BETA2, the tension parameter.
%    BETA2 = 0 for no tension.
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
%  Evaluate the 5 nonzero beta spline basis functions in the interval,
%  weighted by their corresponding data values.
%
  u = ( tval - tdata(left) ) / ( tdata(right) - tdata(left) );

  delta = ( ( 2.0E+00   ...
    * beta1 + 4.0E+00 ) ...
    * beta1 + 4.0E+00 ) ...
    * beta1 + 2.0E+00 + beta2;

  yval = 0.0E+00;
%
%  Beta function associated with node LEFT - 1, (or "phantom node"),
%  evaluated in its 4th interval.
%
  bval = 2.0E+00 * ( beta1 * ( 1.0E+00 - u ) )^3  / delta;

  if ( 0 < left-1 )
    yval = yval + ydata(left-1) * bval;
  else
    yval = yval + ( 2.0E+00 * ydata(1) - ydata(2) ) * bval;
  end
%
%  Beta function associated with node LEFT,
%  evaluated in its third interval.
%
  a = beta2 + ( 4.0E+00 + 4.0E+00 * beta1 ) * beta1;

  b = - 6.0E+00 * beta1 * ( 1.0E+00 - beta1 ) * ( 1.0E+00 + beta1 );

  c = ( (     - 6.0E+00   ...
      * beta1 - 6.0E+00 ) ...
      * beta1 + 0.0E+00 ) ...
      * beta1 - 3.0E+00 * beta2;

  d = ( (     + 2.0E+00   ...
      * beta1 + 2.0E+00 ) ...
      * beta1 + 2.0E+00 ) ...
      * beta1 + 2.0E+00 * beta2;

  bval = ( a + u * ( b + u * ( c + u * d ) ) ) / delta;

  yval = yval + ydata(left) * bval;
%
%  Beta function associated with node RIGHT,
%  evaluated in its second interval.
%
  a = 2.0E+00;

  b = 6.0E+00 * beta1;

  c = 3.0E+00 * beta2 + 6.0E+00 * beta1 * beta1;

  d = - 2.0E+00 * ( 1.0E+00 + beta2 + beta1 + beta1 * beta1 );

  bval = ( a + u * ( b + u * ( c + u * d ) ) ) / delta;

  yval = yval + ydata(right) * bval;
%
%  Beta function associated with node RIGHT+1, (or "phantom node"),
%  evaluated in its first interval.
%
  bval = 2.0E+00 * u^3 / delta;

  if ( right+1 <= ndata )
    yval = yval + ydata(right+1) * bval;
  else
    yval = yval + ( 2.0E+00 * ydata(ndata) - ydata(ndata-1) ) * bval;
  end

  return
end

function [ yval, ypval ] = spline_quadratic_val ( ndata, tdata, ydata, tval )

%*****************************************************************************80
%
%% SPLINE_QUADRATIC_VAL evaluates a piecewise quadratic spline at a point.
%
%  Discussion:
%
%    Because of the simple form of a piecewise quadratic spline,
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
%    10 February 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, int NDATA, the number of data points defining the spline.
%    NDATA should be odd.
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
  if ( mod ( ndata, 2 ) == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SPLINE_QUADRATIC_VAL - Fatal error!\n' );
    fprintf ( 1, '  NDATA must be odd.\n' );
    error ( 'SPLINE_QUADRATIC_VAL - Fatal error!' );
  end
%
%  Find the interval [ TDATA(LEFT), TDATA(RIGHT) ] that contains, or is
%  nearest to, TVAL.
%
  [ left, right ] = r8vec_bracket ( ndata, tdata, tval );
%
%  Force LEFT to be odd.
%
  if ( mod ( left, 2 ) == 0 )
    left = left - 1;
  end
%
%  Copy out the three abscissas.
%
  t1 = tdata(left);
  t2 = tdata(left+1);
  t3 = tdata(left+2);

  if ( t2 <= t1 | t3 <= t2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SPLINE_QUADRATIC_VAL - Fatal error!\n' );
    fprintf ( 1, '  T2 <= T1 or T3 <= T2.\n' );
    error ( 'SPLINE_QUADRATIC_VAL - Fatal error!' );
  end
%
%  Construct and evaluate a parabolic interpolant for the data
%  in each dimension.
%
  y1 = ydata(left);
  y2 = ydata(left+1);
  y3 = ydata(left+2);

  dif1 = ( y2 - y1 ) / ( t2 - t1 );

  dif2 = ( ( y3 - y1 ) / ( t3 - t1 ) ...
       - ( y2 - y1 ) / ( t2 - t1 ) ) / ( t3 - t2 );

  yval = y1 + ( tval - t1 ) * ( dif1 + ( tval - t2 ) * dif2 );
  ypval = dif1 + dif2 * ( 2.0E+00 * tval - t1 - t2 );

  return
end

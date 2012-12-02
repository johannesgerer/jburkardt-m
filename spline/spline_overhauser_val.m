function yval = spline_overhauser_val ( ndim, ndata, tdata, ydata, tval )

%*****************************************************************************80
%
%% SPLINE_OVERHAUSER_VAL evaluates an Overhauser spline.
%
%  Discussion:
%
%    Over the first and last intervals, the Overhauser spline is a
%    quadratic.  In the intermediate intervals, it is a piecewise cubic.
%    The Overhauser spline is also known as the Catmull-Rom spline.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%   13 February 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    JA Brewer and DC Anderson,
%    Visual Interaction with Overhauser Curves and Surfaces,
%    SIGGRAPH 77,
%    Proceedings of the 4th Annual Conference on Computer Graphics
%    and Interactive Techniques,
%    ASME, July 1977, pages 132-137.
%    
%    E Catmull, R Rom,
%    A Class of Local Interpolating Splines,
%    in Computer Aided Geometric Design,
%    edited by R Barnhill and R Reisenfeld,
%    Academic Press, 1974, pages 317-326.
%
%    David Rogers, Alan Adams,
%    Mathematical Elements of Computer Graphics,
%    McGraw Hill, 1990, Second Edition, pages 278-289.
%
%  Parameters:
%
%    Input, integer NDIM, the dimension of a single data point.
%    NDIM must be at least 1.
%
%    Input, integer NDATA, the number of data points.
%    NDATA must be at least 3.
%
%    Input, real TDATA(NDATA), the abscissas of the data points.  The
%    values in TDATA must be in strictly ascending order.
%
%    Input, real YDATA(NDIM,NDATA), the data points corresponding to
%    the abscissas.
%
%    Input, real TVAL, the abscissa value at which the spline
%    is to be evaluated.  Normally, TDATA(1) <= TVAL <= T(NDATA), and
%    the data will be interpolated.  For TVAL outside this range,
%    extrapolation will be used.
%
%    Output, real YVAL(NDIM), the value of the spline at TVAL.
%

%
%  Check.
%
  order = r8vec_order_type ( ndata, tdata );

  if ( order ~= 2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SPLINE_OVERHAUSER_VAL - Fatal error!\n' );
    fprintf ( 1, '  The data abscissas are not strictly ascending.\n' );
    error ( 'SPLINE_OVERHAUSER_VAL - Fatal error!' );
  end

  if ( ndata < 3 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SPLINE_OVERHAUSER_VAL - Fatal error!\n' );
    fprintf ( 1, '  NDATA < 3.\n' );
    error ( 'SPLINE_OVERHAUSER_VAL - Fatal error!' );
  end

  if ( ndim < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SPLINE_OVERHAUSER_VAL - Fatal error!\n' );
    fprintf ( 1, '  NDIM < 1.\n' );
    error ( 'SPLINE_OVERHAUSER_VAL - Fatal error!' );
  end
%
%  Locate the abscissa interval T(LEFT), T(LEFT+1) nearest to or
%  containing TVAL.
%
  [ left, right ] = r8vec_bracket ( ndata, tdata, tval );
%
%  Evaluate the "left hand" quadratic defined at T(LEFT-1), T(LEFT), T(RIGHT).
%
  if ( 0 < left - 1 )
    yl = parabola_val2 ( ndim, ndata, tdata, ydata, left-1, tval );
  end
%
%  Evaluate the "right hand" quadratic defined at T(LEFT), T(RIGHT), T(RIGHT+1).
%
  if ( right + 1 <= ndata )
    yr = parabola_val2 ( ndim, ndata, tdata, ydata, left, tval );
  end
%
%  Average the quadratics.
%
  yval = zeros ( ndim, 1 );

  if ( left == 1 )

    yval(1:ndim,1) = yr(1:ndim);

  elseif ( right < ndata )

    yval(1:ndim,1) =  ( ( tdata(right) - tval               ) * yl(1:ndim)   ...
                      + (                tval - tdata(left) ) * yr(1:ndim) ) ... 
                      / ( tdata(right)        - tdata(left) );

  else

    yval(1:ndim,1) = yl(1:ndim);

  end

  return
end

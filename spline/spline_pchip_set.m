function d = spline_pchip_set ( n, x, f )

%*****************************************************************************80
%
%% SPLINE_PCHIP_SET sets derivatives for a piecewise cubic Hermite interpolant.
%
%  Discussion:
%
%    This routine computes what would normally be called a Hermite
%    interpolant.  However, the user is only required to supply function
%    values, not derivative values as well.  This routine computes
%    "suitable" derivative values, so that the resulting Hermite interpolant
%    has desirable shape and monotonicity properties.
%
%    The interpolant will have an extremum at each point where
%    monotonicity switches direction.
%
%    The resulting piecewise cubic Hermite function may be evaluated
%    by SPLINE_PCHIP_VAL.
%
%    This routine was originally called "PCHIM".
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
%    Original FORTRAN77 version by Fred Fritsch.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Fred Fritsch, Ralph Carlson,
%    Monotone Piecewise Cubic Interpolation,
%    SIAM Journal on Numerical Analysis,
%    Volume 17, Number 2, April 1980, pages 238-246.
%
%    Fred Fritsch, J Butland,
%    A Method for Constructing Local Monotone Piecewise Cubic Interpolants,
%    LLNL Preprint UCRL-87559, April 1982.
%
%  Parameters:
%
%    Input, integer N, the number of data points.  N must be at least 2.
%
%    Input, real X(N), the strictly increasing independent
%    variable values.
%
%    Input, real F(N), dependent variable values to be interpolated.  This
%    routine is designed for monotonic data, but it will work for any F-array.
%    It will force extrema at points where monotonicity switches direction.
%
%    Output, real D(N), the derivative values at the
%    data points.  If the data are monotonic, these values will determine
%    a monotone cubic Hermite function.
%

%
%  Check the arguments.
%
  if ( n < 2 )
    ierr = -1;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SPLINE_PCHIP_SET - Fatal error!\n' );
    fprintf ( 1, '  Number of data points less than 2.\n' );
    error ( 'SPLINE_PCHIP_SET - Fatal error!' );
  end

  for i = 2 : n
    if ( x(i) <= x(i-1) )
      ierr = -3;
      fprintf ( 1, '\n' );
      fprintf ( 1, 'SPLINE_PCHIP_SET - Fatal error!\n' );
      fprintf ( 1, '  X array not strictly increasing.\n' );
      error ( 'SPLINE_PCHIP_SET - Fatal error!' );
    end
  end

  ierr = 0;
  nless1 = n - 1;
  h1 = x(2) - x(1);
  del1 = ( f(2) - f(1) ) / h1;
  dsave = del1;
%
%  Special case N=2, use linear interpolation.
%
  if ( n == 2 )
    d(1) = del1;
    d(n) = del1;
    return
  end
%
%  Normal case, 3 <= N.
%
  h2 = x(3) - x(2);
  del2 = ( f(3) - f(2) ) / h2;
%
%  Set D(1) via non-centered three point formula, adjusted to be
%  shape preserving.
%
  hsum = h1 + h2;
  w1 = ( h1 + hsum ) / hsum;
  w2 = -h1 / hsum;
  d(1) = w1 * del1 + w2 * del2;

  if ( pchst ( d(1), del1 ) <= 0.0 )

    d(1) = 0.0
%
%  Need do this check only if monotonicity switches.
%
  elseif ( pchst ( del1, del2 ) < 0.0 )

     dmax = 3.0 * del1;

     if ( abs ( dmax ) < abs ( d(1) ) )
       d(1) = dmax;
     end

  end
%
%  Loop through interior points.
%
  for i = 2 : nless1

    if ( 2 < i )
      h1 = h2;
      h2 = x(i+1) - x(i);
      hsum = h1 + h2;
      del1 = del2;
      del2 = ( f(i+1) - f(i) ) / h2;
    end
%
%  Set D(I)=0 unless data are strictly monotonic.
%
    d(i) = 0.0;

    temp = pchst ( del1, del2 );

    if ( temp < 0.0 )

      ierr = ierr + 1;
      dsave = del2;
%
%  Count number of changes in direction of monotonicity.
%
    elseif ( temp == 0.0 )

      if ( del2 ~= 0.0D+00 )
        if ( pchst ( dsave, del2 ) < 0.0 )
          ierr = ierr + 1;
        end
        dsave = del2;
      end
%
%  Use Brodlie modification of Butland formula.
%
    else

      hsumt3 = 3.0 * hsum;
      w1 = ( hsum + h1 ) / hsumt3;
      w2 = ( hsum + h2 ) / hsumt3;
      dmax = max ( abs ( del1 ), abs ( del2 ) );
      dmin = min ( abs ( del1 ), abs ( del2 ) );
      drat1 = del1 / dmax;
      drat2 = del2 / dmax;
      d(i) = dmin / ( w1 * drat1 + w2 * drat2 );

    end

  end
%
%  Set D(N) via non-centered three point formula, adjusted to be
%  shape preserving.
%
  w1 = -h2 / hsum;
  w2 = ( h2 + hsum ) / hsum;
  d(n) = w1 * del1 + w2 * del2;

  if ( pchst ( d(n), del2 ) <= 0.0 )
    d(n) = 0.0;
  elseif ( pchst ( del1, del2 ) < 0.0 )
%
%  Need do this check only if monotonicity switches.
%
    dmax = 3.0 * del2;

    if ( abs ( dmax ) < abs ( d(n) ) )
      d(n) = dmax;
    end

  end

  return
end

function [ fe, next, ierr ] = chfev ( x1, x2, f1, f2, d1, d2, ne, xe )

%*****************************************************************************80
%
%% CHFEV evaluates a cubic polynomial given in Hermite form.
%
%  Discussion:
%
%    This routine evaluates a cubic polynomial given in Hermite form at an
%    array of points.  While designed for use by SPLINE_PCHIP_VAL, it may
%    be useful directly as an evaluator for a piecewise cubic
%    Hermite function in applications, such as graphing, where
%    the interval is known in advance.
%
%    The cubic polynomial is determined by function values
%    F1, F2 and derivatives D1, D2 on the interval [X1,X2].
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
%    David Kahaner, Cleve Moler, Steven Nash,
%    Numerical Methods and Software,
%    Prentice Hall, 1988.
%
%  Parameters:
%
%    Input, real X1, X2, the endpoints of the interval of
%    definition of the cubic.  X1 and X2 must be distinct.
%
%    Input, real F1, F2, the values of the function at X1 and
%    X2, respectively.
%
%    Input, real D1, D2, the derivative values at X1 and
%    X2, respectively.
%
%    Input, integer NE, the number of evaluation points.
%
%    Input, real XE(NE), the points at which the function is to
%    be evaluated.  If any of the XE are outside the interval
%    [X1,X2], a warning error is returned in NEXT.
%
%    Output, real FE(NE), the value of the cubic function
%    at the points XE.
%
%    Output, integer NEXT(2), indicates the number of extrapolation points:
%    NEXT(1) = number of evaluation points to the left of interval.
%    NEXT(2) = number of evaluation points to the right of interval.
%
%    Output, integer IERR, error flag.
%    0, no errors.
%    -1, NE < 1.
%    -2, X1 == X2.
%
  if ( ne < 1 )
    ierr = -1;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CHFEV - Fatal error!\n' );
    fprintf ( 1, '  Number of evaluation points is less than 1.\n' );
    fprintf ( 1, '  NE = %d\n', ne );
    error ( 'CHFEV - Fatal error!' )
  end

  h = x2 - x1;

  if ( h == 0.0 )
    ierr = -2;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CHFEV - Fatal error!\n' );
    fprintf ( 1, '  The interval [X1,X2] is of zero length.\n' );
    error ( 'CHFEV - Fatal error!' )
  end
%
%  Initialize.
%
  ierr = 0;
  next(1) = 0;
  next(2) = 0;
  xmi = min ( 0.0, h );
  xma = max ( 0.0, h );
%
%  Compute cubic coefficients expanded about X1.
%
  delta = ( f2 - f1 ) / h;
  del1 = ( d1 - delta ) / h;
  del2 = ( d2 - delta ) / h;
  c2 = -( del1 + del1 + del2 );
  c3 = ( del1 + del2 ) / h;
%
%  Evaluation loop.
%
  for i = 1 : ne

    x = xe(i) - x1;
    fe(i) = f1 + x * ( d1 + x * ( c2 + x * c3 ) );
%
%  Count the extrapolation points.
%
    if ( x < xmi )
      next(1) = next(1) + 1
    end

    if ( xma < x )
      next(2) = next(2) + 1
    end

  end

  return
end

function [ xa, xb, fxa, fxb ] = brent ( fatol, step_max, prob, xatol, ...
  xrtol, xa, xb, fxa, fxb )

%*****************************************************************************80
%
%% BRENT implements the Brent bisection-based zero finder.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 May 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Richard Brent,
%    Algorithms for Minimization without Derivatives,
%    Prentice Hall, 1973.
%
%  Parameters:
%
%    Input, real FATOL, an absolute error tolerance for the
%    function value of the root.  If an approximate root X satisfies
%      ABS ( F ( X ) ) <= FATOL, then X will be accepted as the
%    root and the iteration will be terminated.
%
%    Input, integer STEP_MAX, the maximum number of steps allowed
%    for an iteration.
%
%    Input, integer PROB, the index of the function whose root is
%    to be sought.
%
%    Input, real XATOL, XRTOL, absolute and relative error
%    tolerances for the root.
%
%    Input/output, real XA, XB, two points at which the
%    function differs in sign.  On output, these values have been adjusted
%    to a smaller interval.
%
%    Input/output, real FXA, FXB, the value of the function
%    at XA and XB.
%

%
%  Initialization.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BRENT\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Step      XA            XB             F(XA)         F(XB)\n' );
  fprintf ( 1, '\n' );

  step_num = 0;

  fxa = p00_fx ( prob, xa );
  fxb = p00_fx ( prob, xb );
%
%  Check that f(ax) and f(bx) have different signs.
%
  if ( ( fxa < 0.0 && fxb < 0.0 ) || ...
       ( 0.0 < fxa && 0.0 < fxb ) )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'BRENT - Fatal error!\n' );
    fprintf ( 1, '  F(XA) and F(XB) have same sign.\n' );
    return

  end

  xc = xa;
  fxc = fxa;
  d = xb - xa;
  e = d;

  while ( 1 )

    fprintf ( 1, '  %4d  %14e  %14e  %12e  %12e\n', ...
      step_num, xb, xc, fxb, fxc );

    step_num = step_num + 1;

    if ( step_max < step_num )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Maximum number of steps taken.\n' );
      break
    end

    if ( abs ( fxc ) < abs ( fxb ) )
      xa = xb;
      xb = xc;
      xc = xa;
      fxa = fxb;
      fxb = fxc;
      fxc = fxa;
    end

    xtol = 2.0 * xrtol * abs ( xb ) + 0.5 * xatol;
%
%  XM is the halfwidth of the current change-of-sign interval.
%
    xm = 0.5 * ( xc - xb );

    if ( abs ( xm ) <= xtol )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Interval small enough for convergence.\n' );
      break
    end

    if ( abs ( fxb ) <= fatol )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Function small enough for convergence.\n' );
      break
    end
%
%  See if a bisection is forced.
%
    if ( abs ( e ) < xtol || abs ( fxa ) <= abs ( fxb ) )

      d = xm;
      e = d;

    else

      s = fxb / fxa;
%
%  Linear interpolation.
%
      if ( xa == xc )

        p = 2.0 * xm * s;
        q = 1.0 - s;
%
%  Inverse quadratic interpolation.
%
      else

        q = fxa / fxc;
        r = fxb / fxc;
        p = s * ( 2.0 * xm * q * ( q - r ) - ( xb - xa ) * ( r - 1.0 ) );
        q = ( q - 1.0 ) * ( r - 1.0 ) * ( s - 1.0 );

      end

      if ( 0.0 < p )
        q = - q;
      else
        p = - p;
      end

      s = e;
      e = d;

      if ( 3.0 * xm * q - abs ( xtol * q ) <= 2.0 * p || ...
           abs ( 0.5 * s * q ) <= p )
        d = xm;
        e = d;
      else
        d = p / q;
      end

    end
%
%  Save in XA, FXA the previous values of XB, FXB.
%
    xa = xb;
    fxa = fxb;
%
%  Compute the new value of XB, and evaluate the function there.
%
    if ( xtol < abs ( d ) )
      xb = xb + d;
    elseif ( 0.0 < xm )
      xb = xb + xtol;
    elseif ( xm <= 0.0 )
      xb = xb - xtol;
    end

    fxb = p00_fx ( prob, xb );
%
%  If the new FXB has the same sign as FXC, then replace XC by XA.
%
    if ( ( 0.0 < fxb && 0.0 < fxc ) || ...
         ( fxb < 0.0 && fxc < 0.0 ) )
      xc = xa;
      fxc = fxa;
      d = xb - xa;
      e = d;
    end

  end

  return
end

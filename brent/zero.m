function value = zero ( a, b, machep, t, f )

%*****************************************************************************80
%
%% ZERO seeks the root of a function F(X) in an interval [A,B].
%
%  Discussion:
%
%    The interval [A,B] must be a change of sign interval for F.
%    That is, F(A) and F(B) must be of opposite signs.  Then
%    assuming that F is continuous implies the existence of at least
%    one value C between A and B for which F(C) = 0.
%
%    The location of the zero is determined to within an accuracy
%    of 6 * MACHEPS * abs ( C ) + 2 * T.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 April 2008
%
%  Author:
%
%    Original FORTRAN77 version by Richard Brent
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    Richard Brent,
%    Algorithms for Minimization Without Derivatives,
%    Dover, 2002,
%    ISBN: 0-486-41998-3,
%    LC: QA402.5.B74.
%
%  Parameters:
%
%    Input, real A, B, the endpoints of the change of sign interval.
%
%    Input, real MACHEP, an estimate for the relative machine
%    precision.
%
%    Input, real T, a positive error tolerance.
%
%    Input, real value = F ( x ), the name of a user-supplied
%    function which evaluates the function whose zero is being sought.
%
%    Output, real VALUE, the estimated value of a zero of
%    the function F.
%

%
%  Make local copies of A and B.
%
  sa = a;
  sb = b;
  fa = f ( sa );
  fb = f ( sb );

  c = sa;
  fc = fa;
  e = sb - sa;
  d = e;

  while ( 1 )

    if ( abs ( fc ) < abs ( fb ) )

      sa = sb;
      sb = c;
      c = sa;
      fa = fb;
      fb = fc;
      fc = fa;

    end

    tol = 2.0 * machep * abs ( sb ) + t;
    m = 0.5 * ( c - sb );

    if ( abs ( m ) <= tol | fb == 0.0 )
      break
    end

    if ( abs ( e ) < tol | abs ( fa ) <= abs ( fb ) )

      e = m;
      d = e;

    else

      s = fb / fa;

      if ( sa == c )

        p = 2.0 * m * s;
        q = 1.0 - s;

      else

        q = fa / fc;
        r = fb / fc;
        p = s * ( 2.0 * m * a * ( q - r ) - ( sb - sa ) * ( r - 1.0 ) );
        q = ( q - 1.0 ) * ( r - 1.0 ) * ( s - 1.0 );

      end

      if ( 0.0 < p )
        q = - q;
      else
        p = - p;
      end

      s = e;
      e = d;

      if ( 2.0 * p < 3.0 * m * q - abs ( tol * q ) & p < abs ( 0.5 * s * q ) )
        d = p / q;
      else
        e = m;
        d = e;
      end

    end

    sa = sb;
    fa = fb;

    if ( tol < abs ( d ) )
      sb = sb + d;
    elseif ( 0.0 < m )
      sb = sb + tol;
    else
      sb = sb - tol;
    end

    fb = f ( sb );

    if ( ( 0.0 < fb & 0.0 < fc ) | ( fb <= 0.0 & fc <= 0.0 ) )
      c = sa;
      fc = fa;
      e = sb - sa;
      d = e;
    end

  end

  value = sb;

  return
end

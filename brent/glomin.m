function [ x, fx ] = glomin ( a, b, c, m, machep, e, t, f )

%*****************************************************************************80
%
%% GLOMIN seeks a global minimum of a function F(X) in an interval [A,B].
%
%  Discussion:
%
%    This function assumes that F(X) is twice continuously differentiable
%    over [A,B] and that F''(X) <= M for all X in [A,B].
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 April 2008
%
%  Author:
%
%    Original FORTRAN77 version by Richard Brent.
%    MATLAB version by John Burkardt.
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
%    Input, real A, B, the endpoints of the interval.
%    It must be the case that A < B.
%
%    Input, real C, an initial guess for the global
%    minimizer.  If no good guess is known, C = A or B is acceptable.
%
%    Input, real M, the bound on the second derivative.
%
%    Input, real MACHEP, an estimate for the relative machine
%    precision.
%
%    Input, real E, a positive tolerance, a bound for the
%    absolute error in the evaluation of F(X) for any X in [A,B].
%
%    Input, real T, a positive error tolerance.
%
%    Input, function value = F ( x ), the name of a user-supplied
%    function whose global minimum is being sought.
%
%    Output, real X, the estimated value of the abscissa
%    for which F attains its global minimum value in [A,B].
%
%    Output, real FX, the value F(X).
%
  a0 = b;
  x = a0;
  a2 = a;
  y0 = f ( b );
  yb = y0;
  y2 = f ( a );
  y = y2;

  if ( y0 < y )
    y = y0;
  else
    x = a;
  end

  if ( m <= 0.0 | b <= a )
    fx = y;
    return
  end

  m2 = 0.5 * ( 1.0 + 16.0 * machep ) * m;

  if ( c <= a | b <= c )
    sc = 0.5 * ( a + b );
  else
    sc = c;
  end

  y1 = f ( sc );
  k = 3;
  d0 = a2 - sc;
  h = 9.0 / 11.0;

  if ( y1 < y )
    x = sc;
    y = y1;
  end

  while ( 1 )

    d1 = a2 - a0;
    d2 = sc - a0;
    z2 = b - a2;
    z0 = y2 - y1;
    z1 = y2 - y0;
    r = d1 * d1 * z0 - d0 * d0 * z1;
    p = r;
    qs = 2.0 * ( d0 * z1 - d1 * z0 );
    q = qs;

    if ( k < 1000000 | y2 <= y )

      while ( 1 )

        if ( q * ( r * ( yb - y2 ) + z2 * q * ( ( y2 - y ) + t ) ) < ...
          z2 * m2 * r * ( z2 * q - r ) )
          a3 = a2 + r / q;
          y3 = f ( a3 );

          if ( y3 < y )
            x = a3;
            y = y3;
          end
        end

        k = mod ( 1611 * k, 1048576 );
        q = 1.0;
        r = ( b - a ) * 0.00001 * k;

        if ( z2 <= r )
          break
        end

      end

    else

      k = mod ( 1611 * k, 1048576 );
      q = 1.0;
      r = ( b - a ) * 0.00001 * k;

      while ( r < z2 )

        if ( q * ( r * ( yb - y2 ) + z2 * q * ( ( y2 - y ) + t ) ) < ...
          z2 * m2 * r * ( z2 * q - r ) )
          a3 = a2 + r / q;
          y3 = f ( a3 );

          if ( y3 < y )
            x = a3;
            y = y3;
          end
        end

        k = mod ( 1611 * k, 1048576 );
        q = 1.0;
        r = ( b - a ) * 0.00001 * k;

      end

    end

    r = m2 * d0 * d1 * d2;
    s = sqrt ( ( ( y2 - y ) + t ) / m2 );
    h = 0.5 * ( 1.0 + h );
    p = h * ( p + 2.0 * r * s );
    q = q + 0.5 * qs;
    r = - 0.5 * ( d0 + ( z0 + 2.01 * e ) / ( d0 * m2 ) );

    if ( r < s | d0 < 0.0 )
      r = a2 + s;
    else
      r = a2 + r;
    end

    if ( 0.0 < p * q )
      a3 = a2 + p / q;
    else
      a3 = r;
    end

    while ( 1 )

      a3 = max ( a3, r );

      if ( b <= a3 )
        a3 = b;
        y3 = yb;
      else
        y3 = f ( a3 );
      end

      if ( y3 < y )
        x = a3;
        y = y3;
      end

      d0 = a3 - a2;

      if ( a3 <= r )
        break
      end

      p = 2.0 * ( y2 - y3 ) / ( m * d0 );

      if ( ( 1.0 + 9.0 * machep ) * d0 <= abs ( p ) )
        break
      end

      if ( 0.5 * m2 * ( d0 * d0 + p * p ) <= ...
        ( y2 - y ) + ( y3 - y ) + 2.0 * t )
        break
      end

      a3 = 0.5 * ( a2 + a3 );
      h = 0.9 * h;

    end

    if ( b <= a3 )
      break
    end

    a0 = sc;
    sc = a2;
    a2 = a3;
    y0 = y1;
    y1 = y2;
    y2 = y3;

  end

  fx = y;
 
  return
end

function [ x, fx ] = local_min ( a, b, epsi, t, f, x )

%*****************************************************************************80
%
%% LOCAL_MIN seeks a local minimum of a function F(X) in an interval [A,B].
%
%  Discussion:
%
%    The method used is a combination of golden section search and
%    successive parabolic interpolation.  Convergence is never much slower
%    than that for a Fibonacci search.  If F has a continuous second
%    derivative which is positive at the minimum (which is not at A or
%    B), then convergence is superlinear, and usually of the order of
%    about 1.324....
%
%    The values EPSI and T define a tolerance TOL = EPSI * abs ( X ) + T.
%    F is never evaluated at two points closer than TOL.
%
%    If F is a unimodal function and the computed values of F are always
%    unimodal when separated by at least SQEPS * abs ( X ) + (T/3), then
%    LOCAL_MIN approximates the abscissa of the global minimum of F on the
%    interval [A,B] with an error less than 3*SQEPS*abs(LOCAL_MIN)+T.
%
%    If F is not unimodal, then LOCAL_MIN may approximate a local, but
%    perhaps non-global, minimum to the same accuracy.
%
%    Thanks to Jonathan Eggleston for pointing out a correction to the 
%    golden section step, 01 July 2013.
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
%
%    Input, real EPSI, a positive relative error tolerance.
%    EPSI should be no smaller than twice the relative machine precision,
%    and preferably not much less than the square root of the relative
%    machine precision.
%
%    Input, real T, a positive absolute error tolerance.
%
%    Input, function value = F ( x ), the name of a user-supplied
%    function whose local minimum is being sought.
%
%    Output, real X, the estimated value of an abscissa
%    for which F attains a local minimum value in [A,B].
%
%    Output, real FX, the value F(X).
%

%
%  C is the square of the inverse of the golden ratio.
%
  c = 0.5 * ( 3.0 - sqrt ( 5.0 ) );

  sa = a;
  sb = b;
  x = sa + c * ( b - a );
  w = x;
  v = w;
  e = 0.0;
  fx = f ( x );
  fw = fx;
  fv = fw;

  while ( 1 )

    m = 0.5 * ( sa + sb );
    tol = epsi * abs ( x ) + t;
    t2 = 2.0 * tol;
%
%  Check the stopping criterion.
%
    if ( abs ( x - m ) <= t2 - 0.5 * ( sb - sa ) )
      break
    end
%
%  Fit a parabola.
%
    r = 0.0;
    q = r;
    p = q;

    if ( tol < abs ( e ) )

      r = ( x - w ) * ( fx - fv );
      q = ( x - v ) * ( fx - fw );
      p = ( x - v ) * q - ( x - w ) * r;
      q = 2.0 * ( q - r );

      if ( 0.0 < q )
        p = - p;
      end

      q = abs ( q );

      r = e;
      e = d;

    end

    if ( abs ( p ) < abs ( 0.5 * q * r ) & ...
         q * ( sa - x ) < p & ...
         p < q * ( sb - x ) )
%
%  Take the parabolic interpolation step.
%
      d = p / q;
      u = x + d;
%
%  F must not be evaluated too close to A or B.
%
      if ( ( u - sa ) < t2 | ( sb - u ) < t2 )

        if ( x < m )
          d = tol;
        else
          d = - tol;
        end

      end
%
%  A golden-section step.
%
    else

      if ( x < m )
        e = sb - x;
      else
        e = sa - x;
      end

      d = c * e;

    end
%
%  F must not be evaluated too close to X.
%
    if ( tol <= abs ( d ) )
      u = x + d;
    elseif ( 0.0 < d )
      u = x + tol;
    else
      u = x - tol;
    end

    fu = f ( u );
%
%  Update A, B, V, W, and X.
%
    if ( fu <= fx )

      if ( u < x )
        sb = x;
      else
        sa = x;
      end

      v = w;
      fv = fw;
      w = x;
      fw = fx;
      x = u;
      fx = fu;

    else

      if ( u < x )
        sa = u;
      else
        sb = u;
      end

      if ( fu <= fw | w == x )
        v = w;
        fv = fw;
        w = u;
        fw = fu;
      elseif ( fu <= fv | v == x | v == w )
        v = u;
        fv = fu;
      end

    end

  end

  return
end

function [ fmin, a, b ] = p00_fmin ( a, b, problem, tol )

%*****************************************************************************80
%
%% P00_FMIN seeks a minimizer of a scalar function of a scalar variable.
%
%  Discussion:
%
%    FMIN seeks an approximation to the point where F attains a minimum on
%    the interval (A,B).
%
%    The method used is a combination of golden section search and
%    successive parabolic interpolation.  Convergence is never much
%    slower than that for a Fibonacci search.  If F has a continuous
%    second derivative which is positive at the minimum (which is not
%    at A or B), then convergence is superlinear, and usually of the
%    order of about 1.324....
%
%    The function F is never evaluated at two points closer together
%    than EPS * ABS ( FMIN ) + (TOL/3), where EPS is approximately the
%    square root of the relative machine precision.  If F is a unimodal
%    function and the computed values of F are always unimodal when
%    separated by at least EPS * ABS ( XSTAR ) + (TOL/3), then FMIN
%    approximates the abcissa of the global minimum of F on the
%    interval [A, B] with an error less than 3 * EPS * ABS ( FMIN ) + TOL.
%    If F is not unimodal, then FMIN may approximate a local, but
%    perhaps non-global, minimum to the same accuracy.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 February 2009
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
%    David Kahaner, Cleve Moler, Steven Nash,
%    Numerical Methods and Software,
%    Prentice Hall, 1988.
%
%  Parameters
%
%    Input, real A, B, the left and right endpoints of the initial interval.  
%
%    Input, integer PROBLEM, the index of a problem.
%
%    Input, real TOL, the desired length of the interval of
%    uncertainty of the final result.  TOL must not be negative.
%
%    Output, real FMIN, the abcissa approximating the
%    minimizer of f.
%
%    Output, real A, B, the lower and upper bounds for the minimizer.
%
  c = 0.5 * ( 3.0 - sqrt ( 5.0 ) );
%
%  C is the squared inverse of the golden ratio.
%
%  EPSILON is the square root of the relative machine precision.
%
  epsilon = sqrt ( eps );
%
%  Initialization.
%
  v = a + c * ( b - a );
  w = v;
  x = v;
  e = 0.0;
  fx = p00_f ( problem, x );
  fv = fx;
  fw = fx;
%
%  The main loop starts here.
%
  while ( 1 )

    midpoint = 0.5 * ( a + b );
    tol1 = epsilon * abs ( x ) + tol / 3.0;
    tol2 = 2.0 * tol1;
%
%  Check the stopping criterion.
%
    if ( abs ( x - midpoint ) <= ( tol2 - 0.5 * ( b - a ) ) )
      break
    end
%
%  Is golden-section necessary?
%
    if ( abs ( e ) <= tol1 )
      if ( midpoint <= x )
        e = a - x;
      else
        e = b - x;
      end

      d = c * e;
%
%  Consider fitting a parabola.
%
    else

      r = ( x - w ) * ( fx - fv );
      q = ( x - v ) * ( fx - fw );
      p = ( x - v ) * q - ( x - w ) * r;
      q = 2.0 * ( q - r );
      if ( 0.0 < q )
        p = -p;
      end
      q = abs ( q );
      r = e;
      e = d;
%
%  Choose a golden-section step if the parabola is not advised.
%
      if ( ...
        ( abs ( 0.5 * q * r ) <= abs ( p ) ) | ...
        ( p <= q * ( a - x ) ) | ...
        ( q * ( b - x ) <= p ) )

        if ( midpoint <= x )
          e = a - x;
        else
          e = b - x;
        end

        d = c * e;
%
%  Choose a parabolic interpolation step.
%
      else

        d = p / q;
        u = x + d;

        if ( ( u - a ) < tol2 )
          d = abs ( tol1 ) * r8_sign ( midpoint - x );
        end

        if ( ( b - u ) < tol2 )
          d = abs ( tol1 ) * r8_sign ( midpoint - x );
        end

     end

   end
%
%  F must not be evaluated too close to X.
%
    if ( tol1 <= abs ( d ) )
      u = x + d;
    end

    if ( abs ( d ) < tol1 )
      u = x + abs ( tol1 ) * r8_sign ( d );
    end

    fu = p00_f ( problem, u );
%
%  Update the data.
%
    if ( fu <= fx )

      if ( x <= u )
        a = x;
      else
        b = x;
      end

      v = w;
      fv = fw;
      w = x;
      fw = fx;
      x = u;
      fx = fu;
      continue

    end

    if ( u < x )
      a = u;
    else
      b = u;
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

  fmin = x;

  return
end

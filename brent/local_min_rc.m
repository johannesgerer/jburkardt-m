function [ arg, status, a, b ] = local_min_rc ( a, b, status, value )

%*****************************************************************************80
%
%% LOCAL_MIN_RC seeks a minimizer of a scalar function of a scalar variable.
%
%  Discussion:
%
%    This routine seeks an approximation to the point where a function
%    F attains a minimum on the interval (A,B).
%
%    The method used is a combination of golden section search and
%    successive parabolic interpolation.  Convergence is never much
%    slower than that for a Fibonacci search.  If F has a continuous
%    second derivative which is positive at the minimum (which is not
%    at A or B), then convergence is superlinear, and usually of the
%    order of about 1.324...
%
%    The routine is a revised version of the Brent local minimization 
%    algorithm, using reverse communication.
%
%    It is worth stating explicitly that this routine will NOT be
%    able to detect a minimizer that occurs at either initial endpoint
%    A or B.  If this is a concern to the user, then the user must
%    either ensure that the initial interval is larger, or to check
%    the function value at the returned minimizer against the values
%    at either endpoint.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Richard Brent,
%    Algorithms for Minimization Without Derivatives,
%    Dover, 2002,
%    ISBN: 0-486-41998-3,
%    LC: QA402.5.B74.
%
%    David Kahaner, Cleve Moler, Steven Nash,
%    Numerical Methods and Software,
%    Prentice Hall, 1989,
%    ISBN: 0-13-627258-4,
%    LC: TA345.K34.
%
%  Parameters
%
%    Input, real A, B, the lower and upper bounds for an interval containing 
%    the minimizer.  It is required that A < B.
%
%    Input, integer STATUS, used to communicate between the user and the routine.  
%    The user only sets STATUS to zero on the first  call, to indicate that this
%    is a startup call.  On each subsequent call, the input value of STATUS
%    should be its output value from the previous call.
%
%    Input, real VALUE, the function value at ARG, as requested
%    by the routine on the previous call.
%
%    Output, real ARG, the currently estimate for the minimizer.  On return 
%    with STATUS positive, the user is requested to evaluate the function at ARG, 
%    and return the value in VALUE.  On return with STATUS zero, ARG is the routine's
%    estimate for the function minimizer.
%
%    Output, integer STATUS.  The routine returns STATUS positive to request 
%    that the function be evaluated at ARG, or returns STATUS as 0, to indicate 
%    that the iteration is complete and that ARG is the estimated minimizer.
%
%    Output, real A, B, the lower and upper bounds for an interval containing 
%    the minimizer.
%
%
%  Local parameters:
%
%    C is the squared inverse of the golden ratio.
%
%    EPS_SQRT is the square root of the relative machine precision.
%
  persistent arg_save
  persistent c
  persistent d
  persistent e
  persistent eps_sqrt
  persistent fu
  persistent fv
  persistent fw
  persistent fx
  persistent midpoint
  persistent p
  persistent q
  persistent r
  persistent tol
  persistent tol1
  persistent tol2
  persistent u
  persistent v
  persistent w
  persistent x
%
%  STATUS (INPUT) = 0, startup.
%
  if ( status == 0 )

    if ( b <= a )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'LOCAL_MIN_RC - Fatal error!\n' );
      fprintf ( 1, '  A < B is required, but\n' );
      fprintf ( 1, '  A = %f\n', a );
      fprintf ( 1, '  B = %f\n', b );
      status = -1;
      error ( 'LOCAL_MIN_RC - Fatal error!' )
    end

    c = 0.5 * ( 3.0 - sqrt ( 5.0 ) );

    eps_sqrt = sqrt ( eps );
    tol = eps;

    v = a + c * ( b - a );
    w = v;
    x = v;
    e = 0.0;

    status = 1;
    arg = x;
    arg_save = arg;

    return
%
%  STATUS (INPUT) = 1, return with initial function value of FX.
%
  elseif ( status == 1 )

    fx = value;
    fv = fx;
    fw = fx;
%
%  STATUS (INPUT) = 2 or more, update the data.
%
  elseif ( 2 <= status )

    fu = value;

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

    else

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

  end
%
%  Take the next step.
%
  midpoint = 0.5 * ( a + b );
  tol1 = eps_sqrt * abs ( x ) + tol / 3.0;
  tol2 = 2.0 * tol1;
%
%  If the stopping criterion is satisfied, we can exit.
%
  if ( abs ( x - midpoint ) <= ( tol2 - 0.5 * ( b - a ) ) )
    status = 0;
    arg = arg_save;
    return
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
      p = - p;
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
        d = tol1 * r8_sign ( midpoint - x );
      end

      if ( ( b - u ) < tol2 )
        d = tol1 * r8_sign ( midpoint - x );
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
    u = x + tol1 * r8_sign ( d );
  end
%
%  Request value of F(U).
%
  arg = u;
  arg_save = arg;
  status = status + 1;

  return
end

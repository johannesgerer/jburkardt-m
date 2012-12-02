function [ arg, status ] = zero_rc ( a, b, t, value, status )

%*****************************************************************************80
%
%% ZERO_RC seeks the root of a function F(X) using reverse communication.
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
%    The routine is a revised version of the Brent zero finder
%    algorithm, using reverse communication.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 October 2008
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
%  Parameters:
%
%    Input, real A, B, the endpoints of the change of sign interval.
%
%    Input, real T, a positive error tolerance.
%
%    Input, real VALUE, the function value at ARG, as requested
%    by the routine on the previous call.
%
%    Input, integer STATUS, used to communicate between the user and the routine.  
%    The user only sets STATUS to zero on the first call, to indicate that this 
%    is a startup call.  Thereafter, the input value should be the output value
%    from the previous call.
%
%    Output, real ARG, the currently considered point.  The user
%    does not need to initialize this value.  On return with STATUS positive,
%    the user is requested to evaluate the function at ARG, and return
%    the value in VALUE.  On return with STATUS zero, ARG is the routine's
%    estimate for the function's zero.
%
%    Output, integer STATUS.  The routine returns STATUS
%    positive to request that the function be evaluated at ARG, or returns
%    STATUS as 0, to indicate that the iteration is complete and that
%    ARG is the estimated zero
%
  persistent c;
  persistent d;
  persistent e;
  persistent fa;
  persistent fb;
  persistent fc;
  persistent machep;
  persistent sa;
  persistent sb;
%
%  Input STATUS = 0.
%  Initialize, request F(A).
%
  if ( status == 0 )

    machep = eps;

    sa = a;
    sb = b;
    e = sb - sa;
    d = e;

    status = 1;
    arg = a;
    return
%
%  Input STATUS = 1.
%  Receive F(A), request F(B).
%
  elseif ( status == 1 )

    fa = value;

    status = 2;
    arg = sb;
    return
%
%  Input STATUS = 2
%  Receive F(B).
%
  elseif ( status == 2 )

    fb = value;

    if ( 0.0 < fa * fb )
      status = -1;
      return
    end

    c = sa;
    fc = fa;

  else

    fb = value;

    if ( ( 0.0 < fb & 0.0 < fc ) | ( fb <= 0.0 & fc <= 0.0 ) )
      c = sa;
      fc = fa;
      e = sb - sa;
      d = e;
    end

  end
%
%  Compute the next point at which a function value is requested.
%
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
    status = 0;
    arg = sb;
    return
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

  arg = sb;
  status = status + 1;

  return
end

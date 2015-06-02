function [ xnew, ferr, xerr, q ] = xnew ( x, fx, q )

%*****************************************************************************80
%
%% xnew solves a single nonlinear equation using reverse communication.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 January 2013
%
%  Author:
%
%    Original FORTRAN77 version by Gaston Gonnet.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Gaston Gonnet,
%    On the Structure of Zero Finders,
%    BIT Numerical Mathematics,
%    Volume 17, Number 2, June 1977, pages 170-183.
%
%  Parameters:
%
%    Input, real X, an estimate for the root.  On the first
%    call, this must be a value chosen by the user.  Thereafter, it may
%    be a value chosen by the user, or the value of ROOT returned on the
%    previous call to the function.
%
%    Input, real FX, the value of the function at X.
%
%    Input, real Q(9), storage needed by the function.
%    Before the first call, the user must set Q(1) to 0.
%
%    Output, real XNEW, an improved estimate for the root.
%
%    Output, real FERR, the smallest value of F encountered.
%
%    Output, real XERR, the width of the change-in-sign interval,
%    if one was encountered.
%
%    Output, real Q(9), storage needed by the function.
%

%
%  If we found an exact zero, there is nothing more to do.
%
  if ( fx == 0.0 )
    ferr = 0.0;
    xerr = 0.0;
    xnew = x;
    return
  end

  ferr = abs ( fx );
%
%  If this is the first time, initialize, estimate the first root, and exit.
%
  if ( q(1) == 0.0 )
    q(1) = fx;
    q(2) = x;
    q(3:9) = 0.0;
    xnew = x + fx;
    xerr = Inf;
    return
  end
%
%  This is not the first call.
%
  q(9) = q(9) + 1.0;
%
%  Check for too many iterations.
%
  if ( 80.0 < q(9) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'xnew - Fatal error!\n' );
    fprintf ( 1, '  Number of iterations = %d\n', int ( q(9) ) );
    error ( 'xnew - Fatal error!' );
  end
%
%  Check for a repeated X value.
%
  if ( ( 2.0 <= q(9) && x == q(4) ) || x == q(2) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'xnew - Fatal error!\n' );
    fprintf ( 1, '  Value of X has been input before.\n' );
    error ( 'xnew - Fatal error!' );
  end
%
%  Push X -> A -> B -> C
%
  for i = 6 : -1 : 3
    q(i) = q(i-2);
  end
  q(1) = fx;
  q(2) = x;
%
%  If we have a change-in-sign interval, store the opposite value.
%
  if ( sign ( q(1) ) ~= sign ( q(3) ) )
    q(7) = q(3);
    q(8) = q(4);
  end
%
%  Calculate XERR.
%
  if ( q(7) ~= 0.0 )
    xerr = abs ( q(8) - q(2) );
  else
    xerr = Inf;
  end
%
%  If more than 30 iterations, and we have change-in-sign interval, bisect.
%
  if ( 30.0 < q(9) && q(7) ~= 0.0 )
    xnew = q(2) + ( q(8) - q(2) ) / 2.0;
    return
  end

  v = ( q(3) - q(1) ) / ( q(4) - q(2) );
%
%  If 3 or more points, try Muller.
%
  if ( q(5) ~= 0.0 )
    u = ( q(5) - q(3) ) / ( q(6) - q(4) );
    w = q(4) - q(2);
    z = ( q(6) - q(2) ) / w;
    r = ( z + 1.0 ) * v - u;

    if ( r ~= 0.0 )
      p = 2.0 * z * q(1) / r;
      d = 2.0 * p / ( w * r ) * ( v - u );
      if ( -1.0 <= d )
        xnew = q(2) - p / ( 1.0 + sqrt ( 1.0 + d ) );
        if ( q(7) == 0.0 || ...
             ( q(2) < xnew && xnew < q(8) ) || ...
             ( q(8) < xnew && xnew < q(2) ) )
          return
        end
      end
    end
  end
%
%  Try the secant step.
%
  if ( q(1) ~= q(3) || q(7) == 0.0 )
    if ( q(1) == q(3) )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'xnew - Fatal error!\n' );
      fprintf ( 1, '  Cannot apply any method.\n' );
      error ( 'xnew - Fatal error!' );
    end
    decr = q(1) / v;
    if ( abs ( decr ) * 4.6E+18 < abs ( q(2) ) )
      decr = 1.74E-18 * abs ( q(2) ) * sign ( decr );
    end
    xnew = q(2) - decr;
    if ( q(7) == 0.0 || ...
        ( q(2) < xnew && xnew < q(8) ) || ...
        ( q(8) < xnew && xnew < q(2) ) )
      return
    end
  end
%
%  Apply bisection.
%
  xnew = q(2) + ( q(8) - q(2) ) / 2.0;

  return
end

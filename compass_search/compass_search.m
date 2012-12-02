function [ x, fx, k ] = compass_search ( function_handle, m, x, delta_tol, ...
  delta, k_max )

%*****************************************************************************80
%
%% COMPASS_SEARCH carries out a direct search minimization algorithm.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 January 2012
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Tamara Kolda, Robert Michael Lewis, Virginia Torczon,
%    Optimization by Direct Search: New Perspectives on Some Classical and Modern Methods,
%    SIAM Review,
%    Volume 45, Number 3, 2003, pages 385-482. 
%
%  Parameters:
%
%    Input, function handle FUNCTION_HANDLE ( M, X ), a handle for the function
%    to be minimized.
%
%    Input, integer M, the number of variables.
%
%    Input, real X(M), a starting estimate for the minimizer.
%
%    Input, real DELTA_TOL, the smallest step size that is allowed.
%
%    Input, real DELTA, the starting stepsize.  
%
%    Input, integer K_MAX, the maximum number of steps allowed.
%
%    Output, real X(M), the estimated minimizer.
%
%    Output, real FX, the function value at X.
%
%    Output, integer K, the number of steps taken.
%
  k = 0;
  x = x(:);
  fx = function_handle ( m, x );

  if ( delta_tol <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'COMPASS_SEARCH - Fatal error!\n' );
    fprintf ( 1, '  DELTA_TOL <= 0.0.\n' );
    error ( 'COMPASS_SEARCH - Fatal error!' );
  end

  if ( delta <= delta_tol )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'COMPASS_SEARCH - Fatal error!\n' );
    fprintf ( 1, '  DELTA < DELTA_TOL.\n' );
    error ( 'COMPASS_SEARCH - Fatal error!' );
  end

  while ( k < k_max )

    k = k + 1;
%
%  For each coordinate direction I, seek a lower function value
%  by increasing or decreasing X(I) by DELTA.
%
    decrease = 0;
    s = + 1.0;
    i = 1;

    for ii = 1 : 2 * m

      xd = x;
      xd(i) = xd(i) + s * delta;
      fxd = function_handle ( m, xd );
%
%  As soon as a decrease is noticed, accept the new point.
%
      if ( fxd < fx )
        x = xd;
        fx = fxd;
        decrease = 1;
        break;
      end

      s = - s;
      if ( s == + 1.0 )
        i = i + 1;
      end

    end
%
%  If no decrease occurred, reduce DELTA.
%
    if ( ~ decrease )
      delta = delta / 2.0;
      if ( delta < delta_tol )
        break;
      end
    end

  end

  return
end

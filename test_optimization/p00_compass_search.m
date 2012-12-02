function [ x, fx, k ] = p00_compass_search ( problem, m, x0, delta_tol, ...
  delta_init, k_max )

%*****************************************************************************80
%
%% P00_COMPASS_SEARCH carries out a direct search minimization algorithm.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 February 2012
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Tamara Kolda, Robert Michael Lewis, Virginia Torczon,
%    Optimization by Direct Search: New Perspectives on Some Classical
%    and Modern Methods,
%    SIAM Review,
%    Volume 45, Number 3, 2003, pages 385-482.
%
%  Parameters:
%
%    Input, integer PROBLEM, the problem number.
%
%    Input, integer M, the number of variables.
%
%    Input, real X0(M), a starting estimate for the minimizer.
%
%    Input, real DELTA_TOL, the smallest step size that is allowed.
%
%    Input, real DELTA_INIT, the starting stepsize.
%
%    Input, integer K_MAX, the maximum number of steps allowed.
%
%    Output, real X(M), the estimated minimizer.
%
%    Output, real FX, the function value at X.
%
%    Output, integer K, the number of steps taken.
%
  n = 1;
  k = 0;
  x(1:m,1) = x0(1:m,1);
  fx = p00_f ( problem, m, n, x );

  if ( delta_tol <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_COMPASS_SEARCH - Fatal error!\n' );
    fprintf ( 1, '  DELTA_TOL <= 0.0.\n' );
    fprintf ( 1, '  DELTA_TOL = %g\n', delta_tol );
    error ( 'P00_COMPASS_SEARCH - Fatal error!' );
  end

  if ( delta_init <= delta_tol )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_COMPASS_SEARCH - Fatal error!\n' );
    fprintf ( 1, '  DELTA_INIT < DELTA_TOL.\n' );
    fprintf ( 1, '  DELTA_INIT = %g\n', delta_init );
    fprintf ( 1, '  DELTA_TOL = %g\n', delta_tol );
    error ( 'P00_COMPASS_SEARCH - Fatal error!' );
  end

  delta = delta_init;

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
      xd(i,1) = xd(i,1) + s * delta;
      fxd = p00_f ( problem, m, n, xd );
%
%  As soon as a decrease is noticed, accept the new point.
%
      if ( fxd < fx )
        x = xd;
        fx = fxd;
        decrease = 1;
        break
      end

      s = - s;
      if ( s == + 1.0 )
        i = i + 1;
      end

    end
%
%  If no decrease occurred, reduce DELTA.
%
    if ( ~decrease )
      delta = delta / 2.0;
      if ( delta < delta_tol )
        break
      end
    end

  end

  return
end

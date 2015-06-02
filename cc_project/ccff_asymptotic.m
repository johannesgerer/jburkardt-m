function ccff_asymptotic ( n_min, n_inc, n_max, f, f_integral )

%*****************************************************************************80
%
%% CCFF_ASYMPTOTIC computes asymptotic errors for the Legendre integral.
%
%  Discussion:
%
%    The Legendre integral being approximated is:
%      integral ( -1 <= x <= +1 ) f(x) dx
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 May 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N_MIN, N_INC, N_MAX, the minimum, increment, and maximum
%    for the number of points in the rule.
%
%    Input, function pointer F(x), returns the value of the integrand
%    at the N points X.
%
%    Input, real F_INTEGRAL, the exact value of the integral.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N  |Quad error|\n' );
  fprintf ( 1, '\n' );
  for n = n_min : n_inc : n_max
    [ x, w ] = ccff ( n );
    fx = f ( x );
    q = w' * fx;
    e = abs ( f_integral - q );
    fprintf ( 1, '  %4d  %8.2e\n', n, e );
  end

  return
end

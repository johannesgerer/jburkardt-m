function value = beta_noncentral_cdf ( a, b, lambda, x, error_max )

%*****************************************************************************80
%
%% BETA_NONCENTRAL_CDF evaluates the noncentral Beta CDF.
%
%  Discussion:
%
%    The reference mistakenly phrases the opposite of the correct
%    stopping criterion, that is, it says:
%
%      "stop when PSUM < 1 - ERROR"
%
%    but this must be:
%
%      "stop when 1 - ERROR < PSUM."
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 January 2008
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Harry Posten,
%    An Effective Algorithm for the Noncentral Beta Distribution Function,
%    The American Statistician,
%    Volume 47, Number 2, May 1993, pages 129-131.
%
%  Parameters:
%
%    Input, real A, B, the shape parameters.
%
%    Input, real LAMBDA, the noncentrality parameter.
%
%    Input, real X, the argument of the function.
%
%    Input, real ERROR_MAX, the error control.
%
%    Output, real VALUE, the value of the noncentral Beta CDF.
%
  i = 0;
  pi = exp ( - lambda / 2.0 );

  beta_log = alogam ( a ) ...
           + alogam ( b ) ...
           - alogam ( a + b );

  [ bi, ifault ] = betain ( x, a, b, beta_log );

  si = exp ( ...
      a * log ( x ) ...
    + b * log ( 1.0 - x ) ...
    - beta_log ...
    - log ( a ) );

  p_sum = pi;
  pb_sum = pi * bi;

  while ( p_sum < 1.0 - error_max )

    pj = pi;
    bj = bi;
    sj = si;

    i = i + 1;
    pi = 0.5 * lambda * pj / i;
    bi = bj - sj;
    si = x * ( a + b + i - 1 ) * sj / ( a + i );

    p_sum = p_sum + pi;
    pb_sum = pb_sum + pi * bi;

  end

  value = pb_sum;

  return
end

function value = ep1_lag_monomial_integral ( expon )

%*****************************************************************************80
%
%% EP1_LAG_MONOMIAL_INTEGRAL: integral of monomial with Laguerre weight on EP1.
%
%  Discussion:
%
%    EP1 is the interval [0,+oo) with exponential or Laguerre weight function:
%
%      w(x) = exp ( - x )
%
%    value = integral ( 0 <= x < oo ) x^expon exp ( - x ) dx
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 January 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer EXPON, the exponent.
%    0 <= EXPON.
%
%    Output, real VALUE, the value of the integral.
%
  value = r8_factorial ( expon );

  return
end

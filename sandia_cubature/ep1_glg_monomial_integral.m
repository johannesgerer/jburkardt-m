function exact = ep1_glg_monomial_integral ( expon, alpha )

%*****************************************************************************80
%
%% EP1_GLG_MONOMIAL_INTEGRAL: integral of monomial with GLG weight on EP1.
%
%  Discussion:
%
%    EP1_GLG is the interval [0,+oo) with generalized Laguerre weight function:
%
%      w(alpha;x) = x^alpha exp ( - x )
%
%    value = integral ( 0 <= x < +oo ) x^expon x^alpha exp ( - x ) dx
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 January 2010
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
%    Input, real ALPHA, the exponent of X in the weight function.
%    -1.0 < ALPHA.
%
%    Output, real EXACT, the value of the integral.
%
  arg = alpha + expon + 1;

  exact = gamma ( arg );

  return
end

function value = epn_glg_monomial_integral ( n, expon, alpha )

%*****************************************************************************80
%
%% EPN_GLG_MONOMIAL_INTEGRAL: integral of monomial with GLG weight on EPN.
%
%  Discussion:
%
%    EPN_GLG is the N-dimensional positive space [0,+oo)^N with generalized
%    Laguerre weight function:
%
%      w(alpha;x) = product ( 1 <= i <= n ) x(i)^alpha exp ( - x(i) )
%
%    value = integral ( EPN )
%      product ( 1 <= i <= n ) x(I)^expon(i) x(i)^alpha exp ( - x(i) ) dx(i)
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
%    Input, integer N, the spatial dimension.
%
%    Input, integer EXPON(N), the exponents.
%
%    Input, real ALPHA, the exponent of X in the weight function.
%    -1.0 < ALPHA.
%
%    Output, real VALUE, the value of the integral.
%
  value = 1.0;
  for i = 1 : n
    value2 = ep1_glg_monomial_integral ( expon(i), alpha );
    value = value * value2;
  end

  return
end

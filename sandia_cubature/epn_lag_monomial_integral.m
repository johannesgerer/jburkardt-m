function value = epn_lag_monomial_integral ( n, expon )

%*****************************************************************************80
%
%% EPN_LAG_MONOMIAL_INTEGRAL: integral of monomial with Laguerre weight on EPN.
%
%  Discussion:
%
%    EPN is the N-dimensional positive space [0,+oo)^N with exponential
%    or Laguerre weight function:
%
%      w(x(1:n)) = exp ( - sum ( x(1:n) ) )
%
%    value = integral ( EPN )
%      product ( 1 <= i <= n ) x(I)^expon(i) exp ( -x(i) ) dx(i)
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
%    Input, integer N, the spatial dimension.
%
%    Input, integer EXPON(N), the exponents.
%
%    Output, real VALUE, the value of the integral.
%
  value = 1.0;
  for i = 1 : n
    value2 = ep1_lag_monomial_integral ( expon(i) );
    value = value * value2;
  end

  return
end

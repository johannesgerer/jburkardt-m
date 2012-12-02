function value = cn_jac_monomial_integral ( n, alpha, beta, expon )

%*****************************************************************************80
%
%% CN_JAC_MONOMIAL_INTEGRAL: integral of a monomial with Jacobi weight over CN.
%
%  Discussion:
%
%    value = integral ( CN )
%      product ( 1 <= i <= n ) x(I)^expon(i) (1-x(i))^alpha (1+x(i))^beta dx(i)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 January 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the spatial dimension.
%
%    Input, real ALPHA, the exponent of (1-X) in the weight factor.
%
%    Input, real BETA, the exponent of (1+X) in the weight factor.
%
%    Input, integer EXPON(N), the exponents.
%
%    Output, real VALUE, the value of the integral.
%
  value = 1.0;
  for i = 1 : n
    value2 = c1_jac_monomial_integral ( alpha, beta, expon(i) );
    value = value * value2;
  end

  return
end

function value = cn_leg_monomial_integral ( n, expon )

%*****************************************************************************80
%
%% CN_LEG_MONOMIAL_INTEGRAL: integral of monomial with Legendre weight on CN.
%
%  Discussion:
%
%    CN_LEG is the cube [-1,+1]^N with the Legendre weight function
%
%      w(x) = 1.
%
%    value = integral ( CN ) product ( 1 <= i <= n ) x(I)^expon(i) dx(i)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 February 2010
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
    value2 = c1_leg_monomial_integral ( expon(i) );
    value = value * value2;
  end

  return
end

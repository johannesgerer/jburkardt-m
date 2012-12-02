function value = cn_geg_monomial_integral ( n, alpha, expon )

%*****************************************************************************80
%
%% CN_GEG_MONOMIAL_INTEGRAL: integral of monomial with Gegenbauer weight on CN.
%
%  Discussion:
%
%    CN_GEG is the cube [-1,+1]^N with the Gegenbauer weight function
%
%      w(alpha;x) = product ( 1 <= i <= n ) (1-x(i)^2)^alpha.
%
%    with -1.0 < alpha.
%
%    value = integral ( CN )
%      product ( 1 <= i <= n ) x(I)^expon(i) (1-x(i)^2)^alpha dx(i)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 January 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the spatial dimension.
%
%    Input, real ALPHA, the exponent of (1-X).
%    -1.0 < ALPHA.
%
%    Input, integer EXPON(N), the exponents.
%
%    Output, real VALUE, the value of the integral.
%
  if ( alpha <= -1.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CN_GEG_MONOMIAL_INTEGRAL - Fatal error!\n' );
    fprintf ( 1, '  ALPHA <= -1.0\n' );
    error ( 'CN_GEG_MONOMIAL_INTEGRAL - Fatal error!' );
  end

  value = 1.0;
  for i = 1 : n
    value2 = c1_geg_monomial_integral ( alpha, expon(i) );
    value = value * value2;
  end

  return

end

function [ o, x, w ] = cn_jac_02_xiu ( n, alpha, beta )

%*****************************************************************************80
%
%% CN_JAC_02_XIU implements the Xiu rule for region CN_JAC.
%
%  Discussion:
%
%    The rule has order
%
%      O = N + 1.
%
%    The rule has precision P = 2.
%
%    CN is the cube [-1,+1]^N with the Jacobi (beta) weight function
%
%      w(alpha,beta;x) = product ( 1 <= i <= n ) (1-x(i))^beta (1+x(i))^alpha.
%
%    with -1 < alpha, -1 < beta.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 March 2010
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Dongbin Xiu,
%    Numerical integration formulas of degree two,
%    Applied Numerical Mathematics,
%    Volume 58, 2008, pages 1515-1520.
%
%  Parameters:
%
%    Input, integer N, the spatial dimension.
%
%    Input, real ALPHA, BETA, the parameters.
%    -1.0 < ALPHA, -1.0 < BETA.
%
%    Output, integer O, the order.
%
%    Output, real X(N,O), the abscissas.
%
%    Output, real W(O), the weights.
%
  if ( alpha <= -1.0 )
    fprint ( 1, '\n' );
    fprint ( 1, 'CN_JAC_02_XIU - Fatal error!\n' );
    fprint ( 1, '  ALPHA <= -1.0\n' );
    error ( 'CN_JAC_02_XIU - Fatal error!' );
  end

  if ( beta <= -1.0 )
    fprint ( 1, '\n' );
    fprint ( 1, 'CN_JAC_02_XIU - Fatal error!\n' );
    fprint ( 1, '  BETA <= -1.0\n' );
    error ( 'CN_JAC_02_XIU - Fatal error!' );
  end

  o = n + 1;

  x = zeros ( n, o );
  w = zeros ( o, 1 );

  for j = 1 : o

    i = 0;
    for r = 1 : floor ( n / 2 )
      arg = 2 * r * ( j - 1 ) * pi / ( n + 1 );
      i = i + 1;
      x(i,j) = sqrt ( 2.0 ) * cos ( arg );
      i = i + 1;
      x(i,j) = sqrt ( 2.0 ) * sin ( arg );
    end

    if ( i < n )
      i = i + 1;
      x(i,j) = r8_mop ( j - 1 );
    end

  end

  gamma0 = ( alpha + beta + 2.0 ) / 2.0;
  delta0 = ( alpha - beta ) / 2.0;
  c1 = 2.0 * ( alpha + 1.0 ) * ( beta + 1.0 ) / ( alpha + beta + 3.0 ) ...
    / ( alpha + beta + 2.0 );

  x(1:n,1:o) = ( sqrt ( gamma0 * c1 ) * x(1:n,1:o) - delta0 ) / gamma0;

  expon = 0;
  volume_1d = c1_jac_monomial_integral ( alpha, beta, expon );
  volume = volume_1d ^ n;

  w(1:o) = volume / o;

  return
end

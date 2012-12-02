function [ o, x, w ] = cn_jac_01_1 ( n, alpha, beta )

%*****************************************************************************80
%
%% CN_JAC_01_1 implements a precision 1 rule for region CN_JAC.
%
%  Discussion:
%
%    The rule has order O = 1.
%
%    The rule has precision P = 1.
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
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CN_JAC_01_1 - Fatal error!\n' );
    fprintf ( 1, '  ALPHA <= -1.0\n' );
    error ( 'CN_JAC_01_1 - Fatal error!' );
  end

  if ( beta <= -1.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CN_JAC_01_1 - Fatal error!\n' );
    fprintf ( 1, '  BETA <= -1.0\n' );
    error ( 'CN_JAC_01_1 - Fatal error!' );
  end

  o = 1;

  expon = 0;
  value1 = c1_jac_monomial_integral ( alpha, beta, expon );
  volume = value1 ^ n;

  expon = 1;
  value2 = c1_jac_monomial_integral ( alpha, beta, expon );

  x = zeros ( n, o );
  w = zeros ( o, 1 );

  k = 0;
%
%  1 point.
%
  k = k + 1;
  x(1:n,k) = value2 / value1;
  w(k) = volume;

  return
end

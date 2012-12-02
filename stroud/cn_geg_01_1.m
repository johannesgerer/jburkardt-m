function [ o, x, w ] = cn_geg_01_1 ( n, alpha )

%*****************************************************************************80
%
%% CN_GEG_01_1 implements a precision 1 rule for region CN_GEG.
%
%  Discussion:
%
%    The rule has order O = 1.
%
%    The rule has precision P = 1.
%
%    CN_GEG is the cube [-1,+1]^N with the Gegenbauer weight function
%
%      w(alpha;x) = product ( 1 <= i <= n ) (1-x(i)^2)^alpha.
%
%    with -1.0 < alpha.
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
%    Input, real ALPHA, the parameter.
%    -1.0 < ALPHA.
%
%    Input, integer O, the order.
%
%    Output, real X(N,O), the abscissas.
%
%    Output, real W(O), the weights.
%
  if ( alpha <= -1.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CN_GEG_01_1 - Fatal error!\n' );
    fprintf ( 1, '  ALPHA <= -1.0\n' );
    error ( 'CN_GEG_01_1 - Fatal error!' );
  end

  o = 1;
  x = zeros ( n, o );
  w = zeros ( o, 1 );

  expon = 0;
  value1 = c1_geg_monomial_integral ( alpha, expon );
  volume = value1 ^ n;

  expon = 1;
  value2 = c1_geg_monomial_integral ( alpha, expon );

  k = 0;
%
%  1 point.
%
  k = k + 1;
  x(1:n,k) = value2 / value1;
  w(k) = volume;

  return
end

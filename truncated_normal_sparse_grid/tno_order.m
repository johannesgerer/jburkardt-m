function n = tno_order ( l )

%*****************************************************************************80
%
%% TNO_ORDER: order of a Truncated Normal Odd (TNO) quadrature rule.
%
%  Discussion:
%
%    The rule is defined on (a,b).
%
%    The integral to approximate:
%
%      I(f) = Integral ( a < x < b ) f(x) rho(x;mu;sigma) dx
%
%    where A, B, MU and SIGMA are parameters.
%
%    The quadrature rule:
%
%      Q(f) = Sum ( 1 <= i <= n ) w(i) * f ( x(i) )
%
%    The input value L requests a rule of precision P at least 2*L-1.
%
%    This function returns a rule whose order N is odd and just 
%    matches the precision constraint.
%
%     L  2*L-1   N  P
%    --  -----  -- --
%     1      1   1  1
%     2      3   3  5
%     3      5   3  5
%     4      7   5  9
%     5      9   5  9
%     6     11   7 13
%     7     13   7 13
%     8     15   9 17
%     9     17   9 17
%    10     19  11 21
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 February 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer L, the level of the rule.
%    1 <= L.
%
%    Output, integer N, the appropriate order.
%
  if ( l < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TNO_ORDER - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of L = %d\n', l );
    error ( 'TNO_ORDER - Fatal error!' );
  end

  n = 2 * ( floor ( l / 2 ) ) + 1;

  return
end

function [ x, w ] = tno ( l )

%*****************************************************************************80
%
%% TNO computes a Truncated Normal Odd (TNO) quadrature rule.
%
%  Discussion:
%
%    The rule is defined on (a,b).
%
%    The integral to approximate:
%
%      I(f) = Integral ( a < x < b ) f(x) rho(x;mu;sigma) dx
%
%    where A, B, MU and SIGMA are parameters and rho() is the
%    truncated normal weight function.
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
%    11     21  11 21
%    12     23  13 25
%    13     25  13 25
%    14     27  15 29
%    15     29  15 29
%    16     31  17 33
%    17     33  17 33
%    18     35  19 37
%    19     37  19 37
%    20     39  21 41
%    21     41  21 41
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 February 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer L, the level of the rule.
%    1 <= L <= 21.
%
%    Output, real X(N,1), the abscissas.
%
%    Output, real W(N,1), the weights.
%
  if ( l < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TNO - Fatal error!\n' );
    fprintf ( 1, '  The value of L must be at least 1.\n' );
    fprintf ( 1, '  Input value of L = %d\n', l );
    error ( 'TNO - Fatal error!' );
  end

  if ( 21 < l ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TNO - Fatal error!\n' );
    fprintf ( 1, '  The value of L must be no more than 21.\n' );
    fprintf ( 1, '  Input value of L = %d\n', l );
    error ( 'TNO - Fatal error!' );
  end
%
%  Find the order N that satisfies the precision requirement.
%
  n = tno_order ( l );
%
%  Compute the points and weights.
%
  [ x, w ] = tn ( n );

  return
end

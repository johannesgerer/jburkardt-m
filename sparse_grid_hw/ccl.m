function [ x, w ] = ccl ( l )

%*****************************************************************************80
%
%% CCL computes a Clenshaw Curtis Linear (CCL) quadrature rule.
%
%  Discussion:
%
%    Our convention is that the abscissas are numbered from left to right.
%
%    The rule is defined on [0,1].
%
%    The integral to approximate:
%
%      Integral ( 0 <= X <= 1 ) F(X) dX
%
%    The quadrature rule:
%
%      Sum ( 1 <= I <= N ) W(I) * F ( X(I) )
%
%    The input value L requests a rule of precision at least 2*L-1.
%
%    This function returns a rule whose order N just matches the precision
%    constraint.
%
%     L  2*L-1   N
%    --  -----  --
%     1      1   1
%     2      3   3
%     3      5   5
%     4      7   7
%     5      9   9
%     6     11  11
%     7     13  13
%     8     15  15
%     9     17  17
%    10     19  19
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
%    1 <= L.
%
%    Output, real X(N,1), the abscissas.
%
%    Output, real W(N,1), the weights.
%
  if ( l < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CCL - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of L = %d\n', l );
    error ( 'CCL - Fatal error!' );
  end
%
%  Find the order N that satisfies the precision requirement.
%
  n = ccl_order ( l );
%
%  Compute the points and weights.
%
  [ x, w ] = cc ( n );

  return
end

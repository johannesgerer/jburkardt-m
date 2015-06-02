function n = ccl_order ( l )

%*****************************************************************************80
%
%% CCL_ORDER computes the order of a "linear growth" Clenshaw Curtis quadrature rule.
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
%    This function selects for level L the Clenshaw-Curtis rule that
%    exactly matches the precision requirement.  This means we do not
%    guarantee nesting from one level to the next.
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
%    19 February 2014
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
    fprintf ( 1, 'CCL_ORDER - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of L = %d\n', l );
    error ( 'CCL_ORDER - Fatal error!' );
  end

  n = 2 * l - 1;

  return
end

function n = ccs_order ( l )

%*****************************************************************************80
%
%% CCS_ORDER computes the order of a "slow growth" Clenshaw Curtis quadrature rule.
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
%    In order to preserve nestedness, this function returns the order
%    of a rule which is the smallest value of the form 1+2^E which
%    is greater than or equal to 2*L-1.
%
%     L  2*L-1   N
%    --  -----  --
%     1      1   1
%     2      3   3
%     3      5   5
%     4      7   9
%     5      9   9
%     6     11  17
%     7     13  17
%     8     15  17
%     9     17  17
%    10     19  33
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 May 2012
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
    fprintf ( 1, 'CCS_ORDER - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of L = %d\n', l );
    error ( 'CCS_ORDER - Fatal error!' );
  end
%
%  Find the order N that satisfies the precision requirement.
%
  if ( l == 1 )
    n = 1;
  else
    n = 3;
    while ( n < 2 * l - 1 )
      n = 2 * n - 1;
    end
  end

  return
end

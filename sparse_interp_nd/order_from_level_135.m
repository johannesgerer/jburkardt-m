function n = order_from_level_135 ( l )

%*****************************************************************************80
%
%% ORDER_FROM_LEVEL_135 evaluates the 135 level-to-order relationship.
%
%  Discussion:
%
%    Clenshaw Curtis rules, and some others, often use the following
%    scheme:
%
%    L: 0  1  2  3   4   5
%    N: 1  3  5  9  17  33 ... 2^L+1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 July 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer L, the level, which should be 0 or greater.
%
%    Output, integer N, the order.
%
  if ( l < 0 )
    error ( 'ORDER_FROM_LEVEL_135 - Illegal input value of L!' )
  elseif ( l == 0 )
    n = 1;
  else
    n = ( 2 ^ l ) + 1;
  end

  return
end

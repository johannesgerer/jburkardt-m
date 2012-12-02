function [ change_num, change, done] = change_next ( total, ...
  coin_num, coin_value, change_num, change, done  )

%*****************************************************************************80
%
%% CHANGE_NEXT computes the next set of change for a given sum.
%
%  Examples:
%
%    Total = 17
%    COIN_NUM = 3
%    COIN_VALUE = (/ 1, 5, 10 /)
%
%
%        #  CHANGE              COIN_VALUE(CHANGE)
%
%    1   4  3 2 1 1             10 5 1 1
%    2   8  3 1 1 1 1 1 1 1     10 1 1 1 1 1 1 1
%    3   5  2 2 2 1 1            5 5 5 1 1
%    4   9  2 2 1 1 1 1 1 1 1    5 5 1 1 1 1 1 1 1
%    5  13  2 1 1 1 1 1 1 1 1 1  5 1 1 1 1 1 1 1 1 1
%           1 1 1                1 1 1
%    6  17  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1 1
%           1 1 1 1 1 1 1        1 1 1 1 1 1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer TOTAL, the total for which change is to be made.
%
%    Input, integer COIN_NUM, the number of types of coins.
%
%    Input, integer COIN_VALUE(COIN_NUM), the value of each coin.
%    The values should be in ascending order.
%
%    Input, integer CHANGE_NUM, the output value of CHANGE_NUM
%    from the previous call.  This value is not needed on a startup call.
%
%    Input, integer CHANGE(CHANGE_NUM), the output value of CHANGE
%    from the previous call.  This value is not needed on a startup call.
%
%    Input, logical DONE.  The user sets DONE = TRUE on the
%    first call to tell the routine this is the beginning of a computation.
%    Thereafter, DONE should be set to the output value of DONE from]
%    the previous call.
%
%    Output, integer CHANGE_NUM, the number of coins given in change
%    for the next set of change.
%
%    Output, integer CHANGE(CHANGE_NUM), the indices of the coins
%    used in this set of change.
%
%    Output, logical DONE, is FALSE until the last possible set of change
%    has been made.
%
  if ( done )
%
%  Make sure the coin values are sorted.
%
    if ( ~i4vec_ascends ( coin_num, coin_value ) )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'CHANGE_NEXT - Fatal error!\n' );
      fprintf ( 1, '  The array COIN_VALUE is not in ascending order.\n' );
      error ( 'CHANGE_NEXT - Fatal error!' );
    end
%
%  Start with the greedy change.
%
    [ change_num, change ] = change_greedy ( total, coin_num, coin_value );
%
%  In a few cases, like change for 4 cents, we're done after the first call.
%
    if ( change_num == total )
      done = 1;
    else
      done = 0;
    end

    return

  else
%
%  Find the last location in the input change which is NOT a penny.
%
    last = 0;

    for i = change_num : -1 : 1
      if ( change(i) ~= 1 )
        last = i;
        break
      end
    end
%
%  If that location is still 0, an error was made.
%
    if ( last == 0 )
      done = 1;
      return
    end
%
%  Sum the entries from that point to the end.
%
    total2 = sum ( coin_value ( change(last:change_num) ) );
%
%  Make greedy change for the partial sum using coins smaller than that one.
%
    coin_num2 = change(last) - 1;

    [ change_num2, change2 ] = change_greedy ( total2, coin_num2, coin_value );
    change(last:last+change_num2-1) = change2(1:change_num2);

    change_num = ( last - 1 ) + change_num2;

  end

  return
end

function [ change_num, change ] = change_greedy ( total, coin_num, coin_value )

%*****************************************************************************80
%
%% CHANGE_GREEDY makes change for a given total using the biggest coins first.
%
%  Discussion:
%
%    The algorithm is simply to use as many of the largest coin first,
%    then the next largest, and so on.
%
%    It is assumed that there is always a coin of value 1.  The
%    algorithm will otherwise fail!
%
%  Example:
%
%    Total = 17
%    COIN_NUM = 3
%    COIN_VALUE = (/ 1, 5, 10 /)
%
%
%    #  CHANGE              COIN_VALUE(CHANGE)
%
%    4  3 2 1 1             10 5 1 1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 June 2004
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
%    The values should be in ascending order, and if they are not,
%    they will be sorted.
%
%    Output, integer CHANGE_NUM, the number of coins given in change.
%
%    Output, integer CHANGE(TOTAL), the indices of the coins will be
%    in entries 1 through CHANGE_NUM.
%
  change_num = 0;
%
%  Find the largest coin smaller than the total.
%
  j = coin_num;

  while ( 0 < j )
    if ( coin_value(j) <= total )
      break
    end
    j = j - 1;
  end

  if ( j <= 0 )
    return;
  end
%
%  Subtract the current coin from the total.
%  Once that coin is too big, use the next coin.
%
  total_copy = total;

  while ( 0 < total_copy )

    if ( coin_value(j) <= total_copy )

      total_copy = total_copy - coin_value(j);
      change_num = change_num + 1;
      change(change_num) = j;

    else

      j = j - 1;
      if ( j <= 0 )
        break
      end

    end

  end

  return
end

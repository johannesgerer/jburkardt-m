function a = change_making_list ( coin_num, coin_value, target )

%*****************************************************************************80
%
%% CHANGE_MAKING_LIST solves the change making problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 August 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer COIN_NUM, the number of coin denomiations.
%
%    Input, integer COIN_VALUE(COIN_NUM), the value of each coin.
%    These values should be positive integers.
%
%    Input, integer TARGET, the desired sum.
%
%    Output, integer A(1:TARGET), A(T) lists the smallest number of coins
%    needed to form the sum T, or "Inf" if it is not possible to form
%    this sum.
%
  a(1:target+1) = Inf;
%
%  If T is the value of a coin, then A(T) is 1.
%
  for i = 1 : coin_num
    j = coin_value(i);
    a(j+1) = 1;
  end
%
%  To compute A(T) in general, consider getting there by adding
%  one coin of value V, and looking at A(T-V).
%
  for j = 1 : target
    for i = 1 : coin_num
      if ( 0 <= j - coin_value(i) )
        a(j+1) = min ( a(j+1), a(j-coin_value(i)+1) + 1 ); 
      end
    end
  end
%
%  Drop the value A(1) which was essentially A(0).
%
  a = a(2:target+1);

  return
end

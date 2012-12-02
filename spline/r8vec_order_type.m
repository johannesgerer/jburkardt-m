function order = r8vec_order_type ( n, a )

%*****************************************************************************80
%
%% R8VEC_ORDER_TYPE finds if an R8VEC is (non)strictly ascending/descending.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 January 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries of the array.
%
%    Input, real A(N), the array to be checked.
%
%    Output, integer ORDER, order indicator:
%    -1, no discernable order;
%    0, all entries are equal;
%    1, ascending order;
%    2, strictly ascending order;
%    3, descending order;
%    4, strictly descending order.
%

%
%  Search for the first value not equal to A(1).
%
  i = 1;

  while ( 1 )

    i = i + 1;

    if ( n < i )
      order = 0;
      return;
    end

    if ( a(1) < a(i) )

      if ( i == 2 )
        order = 2;
      else
        order = 1;
      end

      break;

    elseif ( a(i) < a(1) )

      if ( i == 2 )
        order = 4;
      else
        order = 3;
      end

      break;

    end

  end
%
%  Now we have a "direction".  Examine subsequent entries.
%
  while ( 1 )

    i = i + 1;
    if ( n < i )
      break;
    end

    if ( order == 1 )

      if ( a(i) < a(i-1) )
        order = -1;
        break;
      end

    elseif ( order == 2 )

      if ( a(i) < a(i-1) )
        order = -1;
        break;
      elseif ( a(i) == a(i-1) )
        order = 1;
      end

    elseif ( order == 3 )

      if ( a(i-1) < a(i) )
        order = -1;
        break;
      end

    elseif ( order == 4 )

      if ( a(i-1) < a(i) )
        order = -1;
        break;
      elseif ( a(i) == a(i-1) )
        order = 3;
      end

    end

  end

  return
end

function order = r82row_order_type ( n, a )

%*****************************************************************************80
%
%% R82ROW_ORDER_TYPE finds if an R82ROW is (non)strictly ascending/descending.
%
%  Discussion:
%
%    An R82ROW is a (2,N) array of R8's.
%
%    The dictionary or lexicographic ordering is used.
%
%    (X1,Y1) < (X2,Y2)  <=>  X1 < X2 or ( X1 = X2 and Y1 < Y2).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 October 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries of the array.
%
%    Input, real A(2,N), the array to be checked.
%
%    Output, integer ORDER, order indicator:
%    -1, no discernable order;
%    0, all entries are equal;
%    1, ascending order;
%    2, strictly ascending order;
%    3, descending order;
%    4, strictly descending order.
%
  dim_num = 2;
%
%  Search for the first value not equal to A(1,1).
%
  i = 1;

  while ( 1 )

    i = i + 1;

    if ( n < i )
      order = 0;
      return
    end

    if ( ...
         a(1,1) <  a(1,i) || ...
       ( a(1,1) == a(1,i) && a(2,1) < a(2,i) ) )

      if ( i == 2 )
        order = 2;
      else
        order = 1;
      end

      break

    elseif ( ...
        a(1,i) <  a(1,1) || ...
      ( a(1,i) == a(1,1) && a(2,i) < a(2,1) ) ) 

      if ( i == 2 )
        order = 4;
      else
        order = 3;
      end

      break

    end

  end
%
%  Now we have a "direction".  Examine subsequent entries.
%
  while ( 1 )

    i = i + 1;
    if ( n < i )
      break
    end

    if ( order == 1 )

      if ( ...
          a(1,i) <  a(1,i-1) || ...
        ( a(1,i) == a(1,i-1) && a(2,i) < a(2,i-1) ) )
        order = -1;
        break
      end

    elseif ( order == 2 )

      if ( ...
          a(1,i) <  a(1,i-1) || ...
        ( a(1,i) == a(1,i-1) && a(2,i) < a(2,i-1) ) )
        order = -1;
        break
      elseif ( ...
         a(1,i) == a(1,i-1) && a(2,i) == a(2,i-1) )
        order = 1;
      end

    elseif ( order == 3 )

      if ( ...
          a(1,i-1) <  a(1,i) || ...
        ( a(1,i-1) == a(1,i) && a(2,i-1) < a(2,i) ) )
        order = -1;
        break
      end

    elseif ( order == 4 )

      if ( ...
          a(1,i-1) <  a(1,i) || ...
        ( a(1,i-1) == a(1,i) && a(2,i-1) < a(2,i) ) )
        order = -1;
        break
      elseif ( a(1,i) == a(1,i-1) && a(2,i) == a(2,i-1) )
        order = 3;
      end

    end

  end

  return
end

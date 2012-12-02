function [ row, col ] = i4col_find_pair_wrap ( m, n, a, item1, item2 )

%*****************************************************************************80
%
%% I4COL_FIND_PAIR_WRAP wrap searches a table by columns for a pair of items.
%
%  Discussion:
%
%    The items (ITEM1, ITEM2) must occur consecutively.
%    However, wrapping is allowed, that is, if ITEM1 occurs
%    in the last row, and ITEM2 "follows" it in the first row
%    of the same column, a match is declared. 
%
%    If the pair of items is not found, then ROW = COL = -1.  
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 August 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns
%    in the table.
%
%    Input, integer A(M,N), the table to search.
%
%    Input, integer ITEM1, ITEM2, the values to search for.
%
%    Output, integer ROW, COL, the row and column indices
%    of the first occurrence of the value ITEM1 followed immediately
%    by ITEM2.
%
  for j = 1 : n
    for i = 1 : m

      if ( a(i,j) == item1 )

        i2 = i + 1;

        if ( m < i2 )
          i2 = 1;
        end

        if ( a(i2,j) == item2 )
          row = i;
          col = j;
          return
        end

      end

    end
  end

  row = -1;
  col = -1;

  return
end

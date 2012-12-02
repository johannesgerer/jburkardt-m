function [ row, col ] = i4row_find_pair_wrap ( m, n, a, item1, item2 )

%*****************************************************************************80
%
%% I4ROW_FIND_PAIR_WRAP searches rows of an I4ROW for a pair of items.
%
%  Discussion:
%
%    The items must occur consecutively, with ITEM1 occurring
%    first.  However, wrapping is allowed.  That is, if ITEM1
%    occurs in the last column, and ITEM2 in the first, this
%    is also regarded as a match.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 June 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns.
%
%    Input, integer A(M,N), the table to search.
%
%    Input, integer ITEM1, ITEM2, the values to search for.
%
%    Output, integer ROW, COL, the row and column indices
%    of the first occurrence of the value ITEM1 followed immediately
%    by ITEM2.  The search is conducted by rows.  If the pair of
%    items is not found, then ROW = COL = -1.  If COL = N,
%    the ITEM1 occurs in column N and ITEM2 occurs in column 1.
%
  for i = 1 : m
    for j = 1 : n

      if ( a(i,j) == item1 )

        if ( j < n )
          jp1 = j + 1;
        else
          jp1 = 1;
        end

        if ( a(i,jp1) == item2 )
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

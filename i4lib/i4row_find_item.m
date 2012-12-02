function [ row, col ] = i4row_find_item ( m, n, a, item )

%*****************************************************************************80
%
%% I4ROW_FIND_ITEM searches the rows of an I4ROW for a given value.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 May 2005
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
%    Input, integer ITEM, the value to search for.
%
%    Output, integer ROW, COL, the row and column indices
%    of the first occurrence of the value ITEM.  The search
%    is conducted by rows.  If the item is not found, then
%    ROW = COL = -1.
%
  for i = 1 : m
    for j = 1 : n
      if ( a(i,j) == item )
        row = i;
        col = j;
        return
      end
    end
  end

  row = -1;
  col = -1;

  return
end

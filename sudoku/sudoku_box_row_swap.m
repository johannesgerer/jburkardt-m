function s = sudoku_box_row_swap ( box_row1, box_row2, s )

%*****************************************************************************80
%
%% SUDOKU_BOX_ROW_SWAP swaps two box rows.
%
%  Discussion:
%
%    Two box rows of a Sudoku may be shifted without changing the basic
%    structure.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 February 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer BOX_ROW1, BOX_ROW2, the box rows to be swapped,
%    between 1 and 3.
%
%    Input, integer S(9,9), the Sudoku to be shuffled.
%
%    Output, integer S(9,9), the shuffled Sudoku.
%
  if ( 1 <= box_row1 & box_row1 <= 3 )
    if ( 1 <= box_row2 & box_row2 <= 3 )

      i1 = 3 * ( box_row1 - 1 ) + 1;
      i2 = i1 + 2;

      i3 = 3 * ( box_row2 - 1 ) + 1;
      i4 = i3 + 2;

      t(1:3,  1:9) = s(i1:i2,1:9);
      s(i1:i2,1:9) = s(i3:i4,1:9);
      s(i3:i4,1:9) = t(1 : 3,1:9);

    end
  end

  return
end

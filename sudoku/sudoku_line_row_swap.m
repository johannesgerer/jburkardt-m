function s = sudoku_line_row_swap ( box_row, line_row1, line_row2, s )

%*****************************************************************************80
%
%% SUDOKU_LINE_ROW_SWAP swaps two horizontal lines that share the same box row.
%
%  Discussion:
%
%    Two rows of a Sudoku may be shifted without changing the basic
%    structure, as long as the rows are in the same box row.
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
%    Input, integer BOX_ROW, the index of the box row, between 1 and 3.
%
%    Input, integer LINE_ROW1, LINE_ROW2, the indices of the two rows
%    which are to be interchanged.  These should be between 1 and 3.
%
%    Input, integer S(9,9), the Sudoku to be shuffled.
%
%    Output, integer S(9,9), the shuffled Sudoku.
%
  if ( 1 <= box_row & box_row <= 3 )
    if ( 1 <= line_row1 & line_row1 <= 3 )
      if ( 1 <= line_row2 & line_row2 <= 3 )

        i1 = 3 * ( box_row - 1 ) + line_row1;
        i2 = 3 * ( box_row - 1 ) + line_row2;

        t(1, 1:9) = s(i1,1:9);
        s(i1,1:9) = s(i2,1:9);
        s(i2,1:9) = t(1, 1:9);

      end
    end
  end

  return
end

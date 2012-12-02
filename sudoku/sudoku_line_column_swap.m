function s = sudoku_line_column_swap ( box_column, line_column1, ...
  line_column2, s )

%*****************************************************************************80
%
%% SUDOKU_LINE_COL_SWAP swaps two vertical lines that share the same box column.
%
%  Discussion:
%
%    Two columns of a Sudoku may be shifted without changing the basic
%    structure, as long as the columns are in the same box column.
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
%    Input, integer BOX_COLUMN, the index of the box column, between 1 and 3.
%
%    Input, integer LINE_COLUMN1, LINE_COLUMN2, the indices of the two columns
%    which are to be interchanged.  These should be between 1 and 3.
%
%    Input, integer S(9,9), the Sudoku to be shuffled.
%
%    Output, integer S(9,9), the shuffled Sudoku.
%
  if ( 1 <= box_column & box_column <= 3 )
    if ( 1 <= line_column1 & line_column1 <= 3 )
      if ( 1 <= line_column2 & line_column2 <= 3 )

        j1 = 3 * ( box_column - 1 ) + line_column1;
        j2 = 3 * ( box_column - 1 ) + line_column2;

        t(1:9, 1) = s(1:9,j1);
        s(1:9,j1) = s(1:9,j2);
        s(1:9,j2) = t(1:9, 1);

      end
    end
  end

  return
end

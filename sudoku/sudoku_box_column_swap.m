function s = sudoku_box_column_swap ( box_column1, box_column2, s )

%*****************************************************************************80
%
%% SUDOKU_BOX_COLUMN_SWAP swaps two box columns.
%
%  Discussion:
%
%    Two box columns of a Sudoku may be shifted without changing the basic
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
%    Input, integer BOX_COLUMN1, BOX_COLUMN2, the box columns to be swapped,
%    between 1 and 3.
%
%    Input, integer S(9,9), the Sudoku to be shuffled.
%
%    Output, integer S(9,9), the shuffled Sudoku.
%
  if ( 1 <= box_column1 & box_column1 <= 3 )
    if ( 1 <= box_column2 & box_column2 <= 3 )

      j1 = 3 * ( box_column1 - 1 ) + 1;
      j2 = j1 + 2;

      j3 = 3 * ( box_column2 - 1 ) + 1;
      j4 = j3 + 2;

      t(1:9, 1: 3) = s(1:9,j1:j2);
      s(1:9,j1:j2) = s(1:9,j3:j4);
      s(1:9,j3:j4) = t(1:9,1 : 3);

    end
  end

  return
end

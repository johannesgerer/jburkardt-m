function sudoku_test03 ( )

%*****************************************************************************80
%
%% SUDOKU_TEST03 demonstrates SUDOKU_LINE_ROW_SWAP and SUDOKU_LINE_COLUMN_SWAP.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SUDOKU_TEST03:\n' );
  fprintf ( 1, '  SUDOKU_LINE_ROW_SWAP swaps two rows of a Sudoku;\n' );
  fprintf ( 1, '  the rows must be in the same "box row".\n' );
  fprintf ( 1, '  SUDOKU_LINE_COLUMN_SWAP swaps two columns of a Sudoku;\n' );
  fprintf ( 1, '  the columns must be in the same "box column".\n' );

  s = [ ...
       3,4,1,9,2,7,5,6,8; ...
       6,9,2,1,8,5,7,3,4; ...
       8,5,7,4,6,3,1,9,2; ...
       1,3,4,2,9,6,8,7,5; ...
       2,7,8,5,3,4,6,1,9; ...
       5,6,9,7,1,8,4,2,3; ...
       4,2,5,3,7,1,9,8,6; ...
       9,1,6,8,4,2,3,5,7; ...
       7,8,3,6,5,9,2,4,1];

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Here is the initial Sudoku puzzle:\n' );
  fprintf ( 1, '\n' );

  sudoku_print ( s );
  
  box_row = 3;
  line_row1 = 1;
  line_row2 = 2;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Our swap parameters are:\n' );
  fprintf ( 1, '    BOX_ROW = %d\n', box_row );
  fprintf ( 1, '    LINE_ROW1 = %d\n', line_row1' );
  fprintf ( 1, '    LINE_ROW2 = %d\n', line_row2' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  (In the third set of 3 rows, swap rows 1 and 2.)\n' );

  s = sudoku_line_row_swap ( box_row, line_row1, line_row2, s );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Here is the permuted Sudoku:\n' );
  fprintf ( 1, '\n' );

  sudoku_print ( s );

  box_column = 1;
  line_column1 = 2;
  line_column2 = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Our swap parameters are:\n' );
  fprintf ( 1, '    BOX_COLUMN = %d\n', box_column );
  fprintf ( 1, '    LINE_COLUMN1 = %d\n', line_column1' );
  fprintf ( 1, '    LINE_COLUMN2 = %d\n', line_column2' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  (In the first set of 3 columns, swap columns 2 and 3.)\n' );

  s = sudoku_line_column_swap ( box_column, line_column1, line_column2, s );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Here is the permuted Sudoku:\n' );
  fprintf ( 1, '\n' );

  sudoku_print ( s );

  return
end

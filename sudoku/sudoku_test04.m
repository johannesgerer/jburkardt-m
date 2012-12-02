function sudoku_test04 ( )

%*****************************************************************************80
%
%% SUDOKU_TEST04 demonstrates SUDOKU_BOX_ROW_SWAP and SUDOKU_BOX_COLUMN_SWAP.
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
  fprintf ( 1, 'SUDOKU_TEST04:\n' );
  fprintf ( 1, '  SUDOKU_BOX_ROW_SWAP swaps two rows of boxes in a Sudoku;\n' );
  fprintf ( 1, '  SUDOKU_BOX_COLUMN_SWAP swaps two columns of boxes in a Sudoku;\n' );

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
  
  box_row1 = 3;
  box_row2 = 1;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Our swap parameters are:\n' );
  fprintf ( 1, '    BOX_ROW1 = %d\n', box_row1 );
  fprintf ( 1, '    BOX_ROW2 = %d\n', box_row2' );

  s = sudoku_box_row_swap ( box_row1, box_row2, s );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Here is the permuted Sudoku:\n' );
  fprintf ( 1, '\n' );

  sudoku_print ( s );

  box_column1 = 1;
  box_column2 = 2;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Our swap parameters are:\n' );
  fprintf ( 1, '    BOX_COLUMN1 = %d\n', box_column1 );
  fprintf ( 1, '    BOX_COLUMN2 = %d\n', box_column2' );
  fprintf ( 1, '\n' );

  s = sudoku_box_column_swap ( box_column1, box_column2, s );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Here is the permuted Sudoku:\n' );
  fprintf ( 1, '\n' );

  sudoku_print ( s );

  return
end

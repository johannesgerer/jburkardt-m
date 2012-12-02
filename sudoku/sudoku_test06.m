function sudoku_test06 ( )

%*****************************************************************************80
%
%% SUDOKU_TEST06 demonstrates SUDOKU_ROTATE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 February 2006
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SUDOKU_TEST06:\n' );
  fprintf ( 1, '  SUDOKU_ROTATE rotates a Sudoku by 90 degrees;\n' );

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
  
  s = sudoku_rotate ( s );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Here is the rotated Sudoku:\n' );
  fprintf ( 1, '\n' );

  sudoku_print ( s );

  s = sudoku_rotate ( s );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Here is the rotated Sudoku:\n' );
  fprintf ( 1, '\n' );

  sudoku_print ( s );

  s = sudoku_rotate ( s );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Here is the rotated Sudoku:\n' );
  fprintf ( 1, '\n' );

  sudoku_print ( s );

  return
end

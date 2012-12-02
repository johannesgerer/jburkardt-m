function sudoku_test01 ( )

%*****************************************************************************80
%
%% SUDOKU_TEST01 tests SUDOKU_SOLVE.
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
  fprintf ( 1, 'SUDOKU_TEST01:\n' );
  fprintf ( 1, '  SUDOKU_SOLVE solves a Sudoku puzzle.\n' );

  M = [ ...
       0,0,1,9,0,0,0,0,8; ...
       6,0,0,0,8,5,0,3,0; ...
       0,0,7,0,6,0,1,0,0; ...
       0,3,4,0,9,0,0,0,0; ...
       0,0,0,5,0,4,0,0,0; ...
       0,0,0,0,1,0,4,2,0; ...
       0,0,5,0,7,0,9,0,0; ...
       0,1,0,8,4,0,0,0,7; ...
       7,0,0,0,0,9,2,0,0];

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Here is the initial Sudoku puzzle:\n' );
  fprintf ( 1, '\n' );

  sudoku_print ( M );
  
  S = sudoku_solve ( M );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Here is the Sudoku solution:\n' );
  fprintf ( 1, '\n' );

  sudoku_print ( S );

  return
end

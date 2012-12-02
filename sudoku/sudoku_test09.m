function sudoku_test09 ( )

%*****************************************************************************80
%
%% SUDOKU_TEST09 tests SUDOKU_CHOICE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 October 2006
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SUDOKU_TEST09:\n' );
  fprintf ( 1, '  SUDOKU_CHOICE_PRINT prints choices in a Sudoku puzzle.\n' );
%
%  This puzzle has several single choice entries.
%
  s = [ ...
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
  fprintf ( 1, '  Here is the Sudoku puzzle:\n' );
  fprintf ( 1, '\n' );

  sudoku_print ( s );
  
  sudoku_choice_print ( s );

  s = [ ...
       0,3,2,0,6,9,1,7,4;...
       6,0,1,0,0,0,0,5,0;...
       7,0,4,1,0,0,0,6,0;...
       1,0,9,6,5,7,4,3,0;...
       0,0,7,3,0,0,9,0,6;...
       3,4,6,9,8,2,7,1,5;...
       0,7,0,0,0,8,6,0,0;...
       0,6,0,0,0,0,0,0,0;...
       2,1,8,4,3,6,5,9,7];
%
%  This puzzle has no single choice entries.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Here is the Sudoku puzzle:\n' );
  fprintf ( 1, '\n' );

  sudoku_print ( s );
  
  sudoku_choice_print ( s );

  return
end

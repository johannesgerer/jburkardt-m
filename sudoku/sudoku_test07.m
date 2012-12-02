function sudoku_test07 ( )

%*****************************************************************************80
%
%% SUDOKU_TEST07 demonstrates SUDOKU_REFLECT.
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
  fprintf ( 1, 'SUDOKU_TEST07:\n' );
  fprintf ( 1, '  SUDOKU_REFLECT reflects a Sudoku across a line of symmetry;\n' );

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
  
  t = sudoku_reflect ( s, 0 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Reflected across the 0 degree line:\n' );
  fprintf ( 1, '\n' );

  sudoku_print ( t );

  t = sudoku_reflect ( s, 45 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Reflected across the 45 degree line:\n' );
  fprintf ( 1, '\n' );

  sudoku_print ( t );

  t = sudoku_reflect ( s, 90 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Reflected across the 90 degree line:\n' );
  fprintf ( 1, '\n' );

  sudoku_print ( t );

  t = sudoku_reflect ( s, 135 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Reflected across the 135 degree line:\n' );
  fprintf ( 1, '\n' );

  sudoku_print ( t );

  return
end

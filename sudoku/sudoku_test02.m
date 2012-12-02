function sudoku_test02 ( )

%*****************************************************************************80
%
%% SUDOKU_TEST02 demonstrates SUDOKU_DIGIT_PERMUTE.
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
  fprintf ( 1, 'SUDOKU_TEST02:\n' );
  fprintf ( 1, '  SUDOKU_DIGIT_PERMUTE permutes the digits\n' );
  fprintf ( 1, '  of a Sudoku puzzle.\n' );

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
  fprintf ( 1, '  Here is the initial Sudoku puzzle:\n' );
  fprintf ( 1, '\n' );

  sudoku_print ( s );
  
  permutation = [ 2, 3, 4, 5, 6, 7, 8, 9, 1 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Here is the permutation:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Original  Permuted\n' );
  fprintf ( 1, '\n' );
  for i = 1 : 9
    fprintf ( 1, '  %8d  %8d\n', i, permutation(i) );
  end

  s = sudoku_digit_permute ( permutation, s );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Here is the permuted Sudoku:\n' );
  fprintf ( 1, '\n' );

  sudoku_print ( s );

  return
end

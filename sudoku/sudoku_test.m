function sudoku_test ( )

%*****************************************************************************80
%
%% SUDOKU_TEST tests the SUDOKU library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 October 2007
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SUDOKU_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the SUDOKU library.\n' );

  sudoku_test01 ( );
  sudoku_test02 ( );
  sudoku_test03 ( );
  sudoku_test04 ( );
  sudoku_test05 ( );
  sudoku_test06 ( );
  sudoku_test07 ( );
  sudoku_test08 ( );
  sudoku_test09 ( );
  sudoku_test10 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SUDOKU_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

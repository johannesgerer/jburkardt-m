function sudoku_print ( S )

%*****************************************************************************80
%
%% SUDOKU_PRINT prints a partial or filled-in Sudoku puzzle.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer S(9,9) contains the Sudoku puzzle.  Each
%    0 entry is interpreted as an empty cell.  Otherwise, it
%    is assumed that an entry is an integer between 1 and 9.
%
  i = 0;
  fprintf ( 1, '  +---------+---------+---------+\n' );
  for i3 = 1 : 3
    for i2 = 1 : 3
      i = i + 1;
      j = 0;
      fprintf ( 1, '  |' );
      for j3 = 1 : 3
        for j2 = 1 : 3
          j = j + 1;
          if ( S(i,j) == 0 )
            fprintf ( 1, ' _ ' );
          else
            fprintf ( 1, ' %d ', S(i,j) );
          end
        end
        fprintf ( 1, '|' );
      end
      fprintf ( 1, '\n' );
    end
    fprintf ( 1, '  +---------+---------+---------+\n' );
  end

  return
end

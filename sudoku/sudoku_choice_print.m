function sudoku_choice_print ( s )

%*****************************************************************************80
%
%% SUDOKU_CHOICE_PRINT prints the choices remaining in a Sudoku puzzle.
%
%  Discussion:
%
%    The Sudoku puzzle S is presumed to contain a 9 by 9 grid
%    with completed entries having values between 1 and 9, and
%    undetermined entries having the value 0.
%
%    For each undetermined entry, this routine finds the number of
%    digits that could be placed there without immediately violating
%    the Sudoku rule that that digit cannot already occur in the same
%    row, column or box.
%
%    Entries where the number of choices is exactly 1 would be immediately
%    filled in by any solver who assumed that the puzzle was solvable.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 November 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer S(9,9), the Sudoku.
%

%
%  FREE(I,J,K) is 1 if S(I,J) is unknown, and free to equal K.
%
  free(1:9,1:9,1:9) = 1;
%
%  Wipe out FREE for cases where S(I,J) is known.
%
  for i = 1 : 9
    for j = 1 : 9
      if ( s(i,j) ~= 0 )
        free(i,j,1:9) = 0;
      end
    end
  end
%
%  March over rows of boxes, rows in a box, columns of boxes, 
%  columns in a box, and if an entry of S is known, remove that
%  possibility from the FREE value of all entries that share a
%  row, column or box with this entry.
%
  i = 0;
  for i1 = 1 : 3
    for i2 = 1 : 3
      i = i + 1;
      j = 0;
      for j1 = 1 : 3
        for j2 = 1 : 3
          j = j + 1;
          t = s(i,j);
          if ( t ~= 0 )
            free(i,1:9,t) = 0;
            free(1:9,j,t) = 0;
            free(3*(i1-1)+1:3*i1,3*(j1-1)+1:3*j1,t) = 0;
          end
        end
      end
    end
  end
%
%  Print out the possibilities.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Possibilities\n' );
  fprintf ( 1, '\n' );

  fprintf ( 1, '|' );
  for i = 1 : 38
    fprintf ( 1, '-' );
  end
  fprintf ( 1, '|' );
  fprintf ( 1, '\n' );

  for i1 = 1 : 3
    for i2 = 1 : 3
      for i3 = 1 : 3

        fprintf ( 1, '|' );
        
        for j1 = 1 : 3
          for j2 = 1 : 3
            for j3 = 1 : 3
              f = free(3*(i1-1)+i2,3*(j1-1)+j2,3*(i3-1)+j3);
              if ( f == 0 )
                fprintf ( 1, '.' );
              else
                fprintf ( 1, '%d', 3*(i3-1)+j3 );
              end
            end
            fprintf ( 1, ' ' );
          end
          fprintf ( 1, '|' );
        end

        fprintf ( 1, '\n' );

      end
      
      fprintf ( 1, '|' );
      for i = 1 : 38
        fprintf ( 1, ' ' );
      end
      fprintf ( 1, '|' );
      fprintf ( 1, '\n' );
            
    end
    
    fprintf ( 1, '|' );
    for i = 1 : 38
      fprintf ( 1, '-' );
    end
    fprintf ( 1, '|' );
    fprintf ( 1, '\n' );

  end

  return
end


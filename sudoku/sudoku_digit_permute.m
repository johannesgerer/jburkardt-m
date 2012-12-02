function s = sudoku_digit_permute ( permutation, s )

%*****************************************************************************80
%
%% SUDOKU_DIGIT_PERMUTE permutes the digits of a Sudoku.
%
%  Discussion:
%
%    The digits of a Sudoku may be permuted without changing
%    it basic structure.
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
%  Parameters:
%
%    Input, integer PERMUTATION(9), a permutation of the digits 1 to 9.
%
%    Input, integer S(9,9), the Sudoku to be shuffled.
%
%    Output, integer S(9,9), the shuffled Sudoku.
%
  for i = 1 : 9
    for j = 1 : 9
      if ( 1 <= s(i,j) & s(i,j) <= 9 )
        s(i,j) = permutation ( s(i,j) );
      end
    end
  end 

  return
end

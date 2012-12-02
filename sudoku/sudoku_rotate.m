function s = sudoku_rotate ( s )

%*****************************************************************************80
%
%% SUDOKU_ROTATE rotates the Sudoko by 90 degrees.
%
%  Discussion:
%
%    The Sudoku S is transformed to the Sudoku T by
%
%      T(i,j) = S(j,i)
%
%    This transformation preserves the Sudoku property.
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
%  Parameters:
%
%    Input, integer S(9,9), the Sudoku to be transposed.
%
%    Output, integer S(9,9), the transposed Sudoku.
%
  for j = 1 : 9
    for i = 1 : 9
      t(i,j) = s(j,10-i);
    end
  end

  s = t;

  return
end

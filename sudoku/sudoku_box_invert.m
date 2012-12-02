function s = sudoku_box_invert ( s )

%*****************************************************************************80
%
%% SUDOKU_BOX_INVERT inverts the Sudoku boxes through the center box.
%
%  Discussion:
%
%    In terms of boxes, the transformation takes the Sudoku
%
%      A  B  C
%      D  E  F
%      G  H  I
%
%    to
%
%      I  H  G
%      F  E  D
%      C  B  A
%
%    which still has the "Sudoku" property.
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
%    Input, integer S(9,9), the Sudoku to be box-inverted.
%
%    Output, integer S(9,9), the box_inverted Sudoku.
%
  t(1:3,1:3) = s(1:3,1:3);
  s(1:3,1:3) = s(7:9,7:9);
  s(7:9,7:9) = t(1:3,1:3);

  t(1:3,1:3) = s(1:3,4:6);
  s(1:3,4:6) = s(7:9,4:6);
  s(7:9,4:6) = t(1:3,1:3);

  t(1:3,1:3) = s(1:3,7:9);
  s(1:3,7:9) = s(7:9,1:3);
  s(7:9,1:3) = t(1:3,1:3);

  t(1:3,1:3) = s(4:6,1:3);
  s(4:6,1:3) = s(4:6,7:9);
  s(4:6,7:9) = t(1:3,1:3);

  return
end

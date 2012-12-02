function s = sudoku_reflect ( s, angle )

%*****************************************************************************80
%
%% SUDOKU_REFLECT reflects the Sudoku across a line of symmetry.
%
%  Discussion:
%
%    The Sudoku S is transformed by reflection.  A line of symmetry
%    is drawn through the center entry, that is S(5,5).  The line
%    of symmetry is either at 0, 45, 90, or 135 degrees.  Then
%    this line is used to pairwise reflect entries.
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
%    Input, integer ANGLE, the angle of reflection, which must be
%    0, 45, 90 or 135.
%
%    Output, integer S(9,9), the transposed Sudoku.
%
  if ( angle == 0 )
    t(9:-1:1,1:9) = s(1:9,1:9);
  elseif ( angle == 45 )
    t(9:-1:1,9:-1:1) = s(1:9,1:9);
    t = t';
  elseif ( angle == 90 )
    t(1:9,9:-1:1) = s(1:9,1:9);
  elseif ( angle == 135 )
    t = s';
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SUDOKU_REFLECT - Fatal error!\n' );
    fprintf ( 1, '  Legal angles are 0, 45, 90, 135.\n' );
    fprintf ( 1, '  The input angle was %d\n', angle );
    error ( 'SUDOKU_REFLECT - Fatal error!' );
  end

  s = t;

  return
end

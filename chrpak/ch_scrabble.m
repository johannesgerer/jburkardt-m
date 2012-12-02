function ch = ch_scrabble ( tile )

%*****************************************************************************80
%
%% CH_SCRABBLE returns the character on a given Scrabble tile.
%
%  Discussion:
%
%    The tiles are numbered 1 to 100, and are labeled 'A' through 'Z',
%    plus two blanks.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 February 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer TILE, the index of the desired Scrabble tile.
%
%    Output, character CH, the character on the given tile.
%
  scrabble = [ ...
    'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'B', ...
    'B', 'C', 'C', 'D', 'D', 'D', 'D', 'E', 'E', 'E', ...
    'E', 'E', 'E', 'E', 'E', 'E', 'E', 'E', 'E', 'F', ...
    'F', 'G', 'G', 'G', 'H', 'H', 'I', 'I', 'I', 'I', ...
    'I', 'I', 'I', 'I', 'I', 'J', 'K', 'L', 'L', 'L', ...
    'L', 'M', 'M', 'N', 'N', 'N', 'N', 'N', 'N', 'O', ...
    'O', 'O', 'O', 'O', 'O', 'O', 'O', 'P', 'P', 'Q', ...
    'R', 'R', 'R', 'R', 'R', 'R', 'S', 'S', 'S', 'S', ...
    'T', 'T', 'T', 'T', 'T', 'T', 'U', 'U', 'U', 'U', ...
    'V', 'V', 'W', 'W', 'X', 'X', 'Y', 'Z', ' ', ' ' ];

  if ( 1 <= tile && tile <= 100 )
    ch = scrabble(tile);
  else
    ch = '?';
  end

  return
end

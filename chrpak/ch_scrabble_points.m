function scrabble_points = ch_scrabble_points ( ch )

%*****************************************************************************80
%
%% CH_SCRABBLE_POINTS returns the Scrabble point value of a character.
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
%    Input, character CH, the character.
%
%    Output, integer SCRABBLE_POINTS, the point value of the character.
%
  points = [ ...
     1,  3,  3,  2,  1, ...
     4,  2,  4,  1,  8, ...
     5,  1,  3,  1,  1, ...
     3, 10,  1,  1,  1, ...
     1,  4,  4,  8,  4, ...
    10,  0 ];
%
%  Convert character to a Scrabble character index.
%
  ic = ch_to_scrabble ( ch );

  if ( 1 <= ic && ic <= 27 )
    scrabble_points = points(ic);
  else
    scrabble_points = 0;
  end

  return
end

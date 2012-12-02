function scrabble_frequency = ch_scrabble_frequency ( ch )

%*****************************************************************************80
%
%% CH_SCRABBLE_FREQUENCY returns the Scrabble frequency of a character.
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
%    Output, integer SCRABBLE_FREQUENCY, the frequency of the character.
%
  frequency = [ ...
     9,  2,  2,  4, 12, ...
     2,  3,  2,  9,  1, ...
     1,  4,  2,  6,  8, ...
     2,  1,  6,  4,  6, ...
     4,  2,  2,  1,  2, ...
     1,  2 ];
%
%  Convert character to a Scrabble character index.
%
  ic = ch_to_scrabble ( ch );

  if ( 1 <= ic && ic <= 27 )
    scrabble_frequency = frequency(ic);
  else
    scrabble_frequency = 0;
  end

  return
end

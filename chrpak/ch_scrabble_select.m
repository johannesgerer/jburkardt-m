function [ ch, seed ] = ch_scrabble_select ( seed )

%*****************************************************************************80
%
%% CH_SCRABBLE_SELECT selects a character with the Scrabble probability.
%
%  Discussion:
%
%    There are 100 Scrabble tiles, including two blanks.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 April 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, character CH_SCRABBLE_SELECT, the character on a randomly
%    chosen Scrabble tile.
%
%    Output, integer SEED, an updated seed for the random number generator.
%

%
%  Choose a tile between 1 and 100.
%
  [ tile, seed ] = i4_uniform ( 1, 100, seed );
%
%  Retrieve the character on that tile.
%
  ch_scrabble_select = ch_scrabble ( tile );

  return
end

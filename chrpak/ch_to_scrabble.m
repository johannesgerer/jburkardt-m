function scrabble = ch_to_scrabble ( ch )

%*****************************************************************************80
%
%% CH_TO_SCRABBLE returns the Scrabble index of a character.
%
%  Discussion:
%
%    'A' through 'Z' have indices 1 through 26, and blank is index 27.
%    Case is ignored.  All other characters return index -1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 January 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character CH, the character.
%
%    Output, integer SCRABBLE, the Scrabble index of the character.
%
  if ( ch == ' ' )
    scrabble = 27;
    return
  end

  ch = ch_cap ( ch );
  ic = a_to_i4 ( ch );

  if ( 1 <= ic && ic <= 26 )
    scrabble = ic;
  else
    scrabble = -1;
  end

  return
end

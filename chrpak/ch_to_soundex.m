function soundex = ch_to_soundex ( ch )

%*****************************************************************************80
%
%% CH_TO_SOUNDEX converts an ASCII character to a Soundex character.
%
%  Discussion:
%
%    The soundex code is used to replace words by a code of up to four
%    digits.  Similar sounding words will often have identical soundex
%    codes.  
%
%    Soundex  Letters
%    -------  ---------------
%       0     A E I O U Y H W
%       1     B B P V
%       2     C G J K Q S X Z
%       3     D T
%       4     L
%       5     M N
%       6     R
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 March 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character CH, the ASCII character.
%
%    Output, character SOUNDEX, the Soundex character, which is
%    '0', '1', '2', '3', '4', '5', '6', or ' '.
%
  ic = ichar ( ch );
  isoundex = ic_to_isoundex ( ic );

  if ( isoundex == -1 )
    soundex = ' ';
  else
    soundex = isoundex;
  end

  return
end

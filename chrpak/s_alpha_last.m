function iloc = s_alpha_last ( s )

%*****************************************************************************80
%
%% S_ALPHA_LAST returns the location of the last alphabetic character.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 January 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S, the string to be searched.
%
%    Output, integer ILOC, the location of the last alphabetic
%    character in the string.  If there are no alphabetic
%    characters, ILOC is returned as -1.
%
  s_len = s_len_trim ( s );

  for i = s_len : -1 : 1
    if ( ch_is_alpha ( s(i) ) )
      iloc = i;
      return
    end
  end

  iloc = -1;

  return
end

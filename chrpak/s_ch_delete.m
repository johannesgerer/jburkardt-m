function s = s_ch_delete ( s, ch )

%*****************************************************************************80
%
%% S_CH_DELETE removes all occurrences of a character from a string.
%
%  Discussion:
%
%    Each time the given character is found in the string, the characters
%    to the right of the string are shifted over one position.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 November 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input/output, string S, the string to be transformed.
%
%    Input, character CH, the character to be removed.
%
  s_length = length ( s );

  put = 1;

  for get = 1 : s_length

    if ( s(get) == ch )

    elseif ( put == get )
      put = put + 1;
    else
      s(put) = s(get);
      put = put + 1;
    end

  end

  s(put:s_length) = ' ';

  return
end

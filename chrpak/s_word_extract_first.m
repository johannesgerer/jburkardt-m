function [ w, s ] = s_word_extract_first ( s )

%*****************************************************************************80
%
%% S_WORD_EXTRACT_FIRST extracts the first word from a string.
%
%  Discussion:
%
%    A "word" is a string of characters terminated by a blank or
%    the end of the string.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 January 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S, the string..
%
%    Output, string W, the leading word of the string.
%
%    Output, string S, the first word of the input string has been removed, 
%    and the remaining string has been shifted left.
%
  w = ' ';

  s_len = s_len_trim ( s );

  if ( s_len < 1 )
    return
  end
%
%  Find the first nonblank.
%
  get1 = 0;

  while ( 1 )

    get1 = get1 + 1;

    if ( s_len < get1 )
      return
    end

    if ( s(get1) ~= ' ' )
      break
    end

  end
%
%  Look for the last contiguous nonblank.
%
  get2 = get1;

  while ( 1 )

    if ( s_len <= get2 )
      break
    end

    if ( s(get2+1) == ' ' )
      break
    end

    get2 = get2 + 1;

  end
%
%  Copy the word.
%
  w = s(get1:get2);
%
%  Shift the string.
%
  s(1:get2) = ' ';
  s = s_adjustl ( s(get2+1:s_len) );

  return
end

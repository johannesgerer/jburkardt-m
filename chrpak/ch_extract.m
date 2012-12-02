function [ ch, s ] = ch_extract ( s )

%*****************************************************************************80
%
%% CH_EXTRACT extracts the next nonblank character from a string.
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
%    Input, string S, the string. 
%
%    Output, character CH, the leading character of the string.
%
%    Output, string S, the input string, after the first 
%    nonblank character has been removed, and the string 
%    shifted left.
%
  s_len = s_len_trim ( s );
  ch = ' ';

  get = 1;

  while ( get <= s_len )

    if ( s(get) ~= ' ' )
      ch = s(get);
      if ( get < s_len )
        s = s(get+1:);
      else
        s = [];
      end
      break
    end

    get = get + 1;

  end

  return
end

function index_last = ch_index_last ( s, ch )

%*****************************************************************************80
%
%% CH_INDEX_LAST is the last occurrence of a character in a string.
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
%    Input, string S, the string to be searched.
%
%    Input, character CH, the character to be searched for.
%
%    Output, integer INDEX_LAST, the location of the last occurrence of 
%    the character in the string, or -1 if it does not occur.
%
  index_last = -1;
  s_len = s_len_trim ( s );

  do i = s_len : -1 : 1

    if ( s(i) == ch )
      index_last = i;
      return
    end

  end

  return
end

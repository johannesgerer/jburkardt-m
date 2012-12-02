function value = ch_index ( s, c )

%*****************************************************************************80
%
%% CH_INDEX is the first occurrence of a character in a string.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 May 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S, the string to be searched.
%
%    Input, character C, the character to be searched for.
%
%    Output, integer VALUE, the location of the first occurrence of C 
%    in the string, or 0 if C does not occur.
%
  value = 0;

  for i = 1 : length ( s )

    if ( s(i:i) == c )
      value = i;
      return
    end

  end

  return
end

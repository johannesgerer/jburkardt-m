function s = s_replace_ch ( s, c1, c2 )

%*****************************************************************************80
%
%% S_REPLACE_CH replaces all occurrences of one character by another.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 January 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input/output, character S(*), the string.
%
%    Input, character C1, C2, the character to be replaced, and the
%    replacement character.
%
  for i = 1 : length ( s )
    if ( s(i) == c1 )
      s(i) = c2;
    end
  end

  return
end

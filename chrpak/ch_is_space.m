function value = ch_is_space ( ch )

%*****************************************************************************80
%
%% CH_IS_SPACE is TRUE if a character is a whitespace character.
%
%  Discussion:
%
%    Instead of CHAR, we now use the ACHAR function, which
%    guarantees the ASCII collating sequence.
%
%    A whitespace character is a space, a form feed, a newline,
%    a carriage return, a tab, or a vertical tab.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 June 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character CH, a character to check.
%
%    Output, logical CH_IS_SPACE is TRUE if the character is a whitespace
%    character.
%
  if ( ch == ' ' )
    ch_is_space = 1;
  elseif ( ch == '\f' )
    ch_is_space = 1;
  elseif ( ch == '\n' )
    ch_is_space = 1;
  elseif ( ch == '\r' )
    ch_is_space = 1;
  elseif ( ch == '\t' )
    ch_is_space = 1;
  elseif ( ch == '\v' )
    ch_is_space = 1;
  else
    ch_is_space = 0;
  end

  return
end

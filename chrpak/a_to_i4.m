function value = a_to_i4 ( ch )

%*****************************************************************************80
%
%% A_TO_I4 returns the index of an alphabetic character.
%
%  Example:
%
%    CH  A_TO_I4
%
%    'A'   1
%    'B'   2
%    ...   
%    'Z'  26
%    'a'  27
%    'b'  28
%    ...
%    'z'  52
%    '$'   0
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 February 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character CH, a character.
%
%    Output, integer VALUE, is the alphabetic index of the character,
%    between 1 and 26 if the character is a capital letter,
%    between 27 and 52 if it is lower case, and 0 otherwise.
%
  if ( 'A' <= ch && ch <= 'Z' )
    value = ch - 'A' + 1;
  elseif ( 'a' <= ch && ch <= 'z' )
    value = ch  - 'a' + 27;
  else
    value = 0;
  end

  return
end

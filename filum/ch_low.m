function c2 = ch_low ( c )

%*****************************************************************************80
%
%% CH_LOW lowercases a single character.
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
%    Input, character C, the character to lowercase.
%
%    Output, character C2, the lowercased character.
%
  if ( 'A' <= c && c <= 'Z' )
    c2 = c + 'a' - 'A';
  else
    c2 = c;
  end

  return
end

function c = ch_low ( c )

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
%    23 April 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character C, the character to lowercase.
%
%    Output, character C, the lowercased character.
%
  if ( 'A' <= c && c <= 'Z' )
    c = c + 'a' - 'A';
    c = char ( c );
  end

  return
end

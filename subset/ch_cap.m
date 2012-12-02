function c2 = ch_cap ( c )

%*****************************************************************************80
%
%% CH_CAP capitalizes a single character.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 November 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character C, the character to capitalize.
%
%    Output, character C2, the capitalized character.
%
  if ( 'a' <= c & c <= 'z' )
    c2 = c + 'A' - 'a';
  else
    c2 = c;
  end

  return
end

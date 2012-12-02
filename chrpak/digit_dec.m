function c = digit_dec ( c )

%*****************************************************************************80
%
% DIGIT_DEC decrements a digit.
%
%  Discussion:
%
%    0 goes to 9, 1 goes to 0 and so on.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 June 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character C, a character.
%
%    Output, character C, the decremented character.
%
  if ( '1' <= c && c <= '9' )
    c = char ( double ( c ) - 1 );
  elseif ( c == '0' )
    c = '9';
  end

  return
end

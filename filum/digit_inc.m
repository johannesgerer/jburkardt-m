function c = digit_inc ( c )

%*****************************************************************************80
%
% DIGIT_INC increments a digit.
%
%  Discussion:
%
%    0 goes to 1, 1 goes to 2 and so on, but 9 goes back to 0.
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
%    Input, character C, a character.
%
%    Output, character C, the incremented character.
%
  if ( '0' <= c && c < '9' )
    c = char ( 1 + double ( c ) );
  elseif ( c == '9' )
    c = '0';
  end

  return
end

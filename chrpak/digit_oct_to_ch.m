function ch = digit_oct_to_ch ( i )

%*****************************************************************************80
%
%% DIGIT_OCT_TO_CH returns the character representation of an octal digit.
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
%    Input, integer I, the integer, between 0 and 7.
%
%    Output, character CH, the octal representation of the integer.
%
  if ( 0 <= i && i <= 7 )
    ch = char ( '0' + i );
  else
    ch = '?';
  end

  return
end

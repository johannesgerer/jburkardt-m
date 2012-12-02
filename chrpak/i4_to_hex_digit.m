function ch = i4_to_hex_digit ( i )

%*****************************************************************************80
%
%% I4_TO_HEX_DIGIT converts a (small) I4 to a hexadecimal digit.
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
%    Input, integer I, the integer, between 0 and 15.
%
%    Output, character CH, the hexadecimal representation of the integer.
%
  if ( 0 <= i && i <= 9 )
    ch = '0' + i;
  elseif ( 10 <= i && i <= 15 )
    ch = 'A' + i - 10;
  else
    ch = '?';
  end

  return
end

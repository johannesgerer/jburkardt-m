function binary_digits = hex_to_binary_digits ( hex_digit )

%*****************************************************************************80
%
%% HEX_TO_BINARY_DIGITS converts a hexadecimal digit to 4 binary digits.
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
%    Input, character HEX_DIGIT, the hexadecimal digit.
%
%    Output, string BINARY_DIGITS, the binary digits.
%
  if ( hex_digit == '0' )
    binary_digits = '0000';
  elseif ( hex_digit == '1' )
    binary_digits = '0001';
  elseif ( hex_digit == '2' )
    binary_digits = '0010';
  elseif ( hex_digit == '3' )
    binary_digits = '0011';
  elseif ( hex_digit == '4' )
    binary_digits = '0100';
  elseif ( hex_digit == '5' )
    binary_digits = '0101';
  elseif ( hex_digit == '6' )
    binary_digits = '0110';
  elseif ( hex_digit == '7' )
    binary_digits = '0111';
  elseif ( hex_digit == '8' )
    binary_digits = '1000';
  elseif ( hex_digit == '9' )
    binary_digits = '1001';
  elseif ( hex_digit == 'A' || hex_digit == 'a' )
    binary_digits = '1010';
  elseif ( hex_digit == 'B' || hex_digit == 'b' )
    binary_digits = '1011';
  elseif ( hex_digit == 'C' || hex_digit == 'c' )
    binary_digits = '1100';
  elseif ( hex_digit == 'D' || hex_digit == 'd' )
    binary_digits = '1101';
  elseif ( hex_digit == 'E' || hex_digit == 'e' )
    binary_digits = '1110';
  elseif ( hex_digit == 'F' || hex_digit == 'f' )
    binary_digits = '1111';
  else
    binary_digits = '    '
  end

  return
end

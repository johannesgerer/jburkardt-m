function binary = hex_to_binary_string ( hex )

%*****************************************************************************80
%
%% HEX_TO_BINARY_STRING converts a hexadecimal string to a binary string.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 August 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string HEX, the hexadecimal string.
%
%    Output, string BINARY, the binary string.
%
  s_length = s_len_trim ( hex );

  j = 1;
  for i = 1 : s_length
    binary(j:j+3) = hex_to_binary_digit ( hex(i) );
    j = j + 4;
  end

  return
end

function value = hex_digit_to_i4 ( c )

%*****************************************************************************80
%
%% HEX_DIGIT_TO_I4 converts a hexadecimal digit to an I4.
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
%    Input, character C, the hexadecimal digit, '0'
%    through '9', or 'A' through 'F', or also 'a' through 'f'
%    are allowed.
%
%    Output, integer VALUE, the corresponding integer, or -1 if C was illegal.
%
  if ( '0' <= c && c <= '9' )
    value = c - '0';
  elseif ( 'a' <= c && c <= 'f' )
    value = 10 + c - 'a';
  elseif ( 'A' <= c && c <= 'F' )
    value = 10 + c - 'A';
  elseif ( c == ' ' )
    value = 0;
  else
    value = -1;
  end

  return
end

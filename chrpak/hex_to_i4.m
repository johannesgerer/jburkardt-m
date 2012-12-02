function i4 = hex_to_i4 ( hex )

%*****************************************************************************80
%
%% HEX_TO_I4 converts a hexadecimal string to its integer value.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 August 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string HEX, the string of hexadecimal digits.
%
%    Output, integer I4, the corresponding integer value.
%
  s_length = s_len_trim ( hex );
%
%  Determine if there is a plus or minus sign.
%
  isgn = 1;

  first = s_length + 1;

  for j = 1 : s_length

    if ( hex(j) == '-' )
      isgn = -1;
    elseif ( hex(j) == '+' )
      isgn = + 1;
    elseif ( hex(j) ~= ' ' )
      first = j;
      break;
    end

  end
%
%  Read the numeric portion of the string.
%
  i4 = 0;

  for j = first : s_length
    digit = hex_digit_to_i4 ( hex(j) );
    i4 = i4 * 16 + digit;
  end

  i4 = isgn * i4;

  return
end

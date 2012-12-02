function i4 = oct_to_i4 ( oct )

%*****************************************************************************80
%
%% OCT_TO_I4 converts an octal string to its integer value.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 June 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string OCT, the string of octal digits.
%
%    Output, integer I4, the corresponding integer value.
%
  s_length = s_len_trim ( oct );
%
%  Determine if there is a plus or minus sign.
%
  isgn = 1;

  first = s_length + 1;

  for j = 1 : s_length

    if ( oct(j) == '-' )
      isgn = -1;
    elseif ( oct(j) == '+' )
      isgn = + 1;
    elseif ( oct(j) ~= ' ' )
      first = j;
      break;
    end

  end
%
%  Read the numeric portion of the string.
%
  i4 = 0;

  for j = first : s_length
    digit = ch_to_digit_oct ( oct(j) );
    i4 = i4 * 8 + digit;
  end

  i4 = isgn * i4;

  return
end

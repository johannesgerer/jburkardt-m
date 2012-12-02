function digit = ch_to_digit_bin ( c )

%*****************************************************************************80
%
%% CH_TO_DIGIT_BIN returns the integer value of a binary digit.
%
%  Discussion:
%
%    This routine handles other traditional binary pairs of "digits"
%    besides '0' and '1'.
%
%  Example:
%
%     C   DIGIT
%    ---  -----
%    '0'    0
%    '1'    1
%    'T'    1
%    'F'    0
%    'Y'    1
%    'N'    0
%    '+'    1
%    '-'    0
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 Februry 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character C, the binary digit. 
%
%    Output, integer DIGIT, the corresponding integer value.  If C was
%    'illegal', then DIGIT is -1.
%
  if ( c == '0' || c == 'F' || c == 'f' || c == '-' || c == 'N' || c == 'n' )
    digit = 0;
  elseif ( c == '1' || c == 'T' || c == 't' || c == '+' || c == 'Y' || c == 'y' )
    digit = 1;
  else
    digit = -1;
  end

  return
end

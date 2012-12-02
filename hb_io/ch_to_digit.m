function digit = ch_to_digit ( c )

%*****************************************************************************80
%
%% CH_TO_DIGIT returns the integer value of a base 10 digit.
%
%  Example:
%
%     C   DIGIT
%    ---  -----
%    '0'    0
%    '1'    1
%    ...  ...
%    '9'    9
%    ' '    0
%    'X'   -1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 November 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character C, the decimal digit, '0' through '9' or blank
%    are legal.
%
%    Output, integer DIGIT, the corresponding integer value.  If C was
%    'illegal', then DIGIT is -1.
%
  if ( '0' <= c & c <= '9' )

    digit = c - '0';

  elseif ( c == ' ' )

    digit = 0;

  else

    digit = -1;

  end

  return
end

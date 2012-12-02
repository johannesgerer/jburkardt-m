function value = ch_to_digit_oct ( c )

%*****************************************************************************80
%
%% CH_TO_DIGIT_OCT returns the integer value of an octal digit.
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
%    Input, character C, the octal digit, '0' through '7'.
%
%    Output, integer VALUE, the corresponding integer value, or
%    -1 if C was illegal.
%
  if ( '0' <= c && c <= '7' )
    value = c - '0';
  elseif ( c == ' ' )
    value = 0;
  else
    value = -1;
  end

  return
end

function value = ch_is_digit ( c )

%*****************************************************************************80
%
% CH_IS_DIGIT returns TRUE if the character C is a digit.
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
%    Input, character C, a character.
%
%    Output, integer VALUE, is TRUE (1) if C is a digit, FALSE (0) otherwise.
%
  if ( '0' <= c && c <= '9' )
    value = 1;
  else
    value = 0;
  end

  return
end

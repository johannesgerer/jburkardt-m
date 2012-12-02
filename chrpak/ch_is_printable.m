function value = ch_is_printable ( ch )

%*****************************************************************************80
%
%% CH_IS_PRINTABLE determines if a character is printable.
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
%    Input, character CH, a character to check.
%
%    Output, logical VALUE is TRUE if C is a printable character.
%
  if ( 32 <= ch && ch <= 127 )
    value = 1;
  else
    value = 0;
  end

  return
end

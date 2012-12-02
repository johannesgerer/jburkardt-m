function value = ch_is_alpha ( c )

%*****************************************************************************80
%
%% CH_IS_ALPHA returns TRUE if C is an alphabetic character.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 May 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character C, a character to check.
%
%    Output, logical VALUE is TRUE if C is an alphabetic character.
%
  FALSE = 0;
  TRUE = 1;

  if ( ( 'a' <= c & c <= 'z' ) || ...
       ( 'A' <= c & c <= 'Z' ) )
    value = TRUE;
  else
    value = FALSE;
  end

  return
end

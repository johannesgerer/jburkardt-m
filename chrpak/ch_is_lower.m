function value = ch_is_lower ( c )

%*****************************************************************************80
%
%% CH_IS_LOWER returns TRUE if C is a lowercase alphabetic character.
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
%    Input, character C, a character to check.
%
%    Output, logical VALUE is TRUE if C is a lowercase alphabetic character.
%
  if ( 'a' <= c && c <= 'z' ) 
    value = 1;
  else
    value = 0;
  end

  return
end

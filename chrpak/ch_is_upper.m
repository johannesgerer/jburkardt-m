function value = ch_is_upper ( c )

%*****************************************************************************80
%
%% CH_IS_UPPER returns TRUE if C is a uppercase alphabetic character.
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
%    Output, logical VALUE is TRUE if C is an uppercase alphabetic character.
%
  if ( 'A' <= c && c <= 'Z' ) 
    value = 1;
  else
    value = 0;
  end

  return
end

function value = ch_is_control ( c )

%*****************************************************************************80
%
%% CH_IS_CONTROL is TRUE if C is a control character.
%
%  Discussion:
%
%    A "control character" has ASCII code <= 31 or 127 <= ASCII code.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 September 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character C, the character to be tested.
%
%    Output, logical VALUE, TRUE if C is a control character, and
%    FALSE otherwise.
%
  if ( c <= 31 || 127 <= c )
    value = 1;
  else
    value = 0;
  end

  return
end

function value = ch_is_control ( ch )

%*****************************************************************************80
%
%% CH_IS_CONTROL is TRUE if a character is a control character.
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
%    22 February 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character CH, the character to be tested.
%
%    Output, integer CH_IS_CONTROL, TRUE if the character is a control
%    character, and FALSE otherwise.
%
  if ( ch <= 31 || 127 <= ch )
    value = 1;
  else
    value = 0;
  end

  return
end

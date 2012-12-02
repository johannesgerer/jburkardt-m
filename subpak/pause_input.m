function s = pause_input ( )

%*****************************************************************************80
%
%% PAUSE_INPUT waits until an input character is entered.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, string S, the string that was entered.
%
  s = input ( 'Press RETURN or any character to continue.', 's' );

  return
end

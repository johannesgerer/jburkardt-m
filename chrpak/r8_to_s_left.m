function s = r8_to_s_left ( r )

%*****************************************************************************80
%
%% R8_TO_S_LEFT writes an R8 into a left justified character string.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 November 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real R, the number to be written into the string.
%
%    Output, string S, the string into which the number is to be written.
%
  s = sprintf ( '%f', r );

  return
end

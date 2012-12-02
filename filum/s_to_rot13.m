function s = s_to_rot13 ( s )

%*****************************************************************************80
%
%% S_TO_ROT13 "rotates" the alphabetical characters in a string by 13 positions.
%
%  Discussion:
%
%    Two applications of the routine will return the original string.
%
%  Example:
%
%    Input:                      Output:
%
%    abcdefghijklmnopqrstuvwxyz  nopqrstuvwxyzabcdefghijklm
%    Cher                        Pure
%    James Thurston Howell       Wnzrf Guhefgba Ubjryy
%    0123456789                  56789012345
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%   24 March 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S, a string to be "rotated".
%
%    Output, string S, the rotated string.
%
  s_length = length ( s );
 
  for i = 1 : s_length
    s(i) = ch_to_rot13 ( s(i) );
  end
 
  return
end

function s2 = s_adjustr ( s1 )

%*****************************************************************************80
%
%% S_ADJUSTR flushes a string right.
%
%  Example:
%
%    Input             Output
%    'Hello     '      '     Hello'
%    ' Hi there!  '    '   Hi there!'
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 March 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character S1, the string to be adjusted.
%
%    Output, character S2, the string, adjusted so that the
%    first nonblank character occurs in the last position.
%

%
%  Check the full length of the string.
%
  s1_length = length ( s1 );
%
%  Find the occurrence of the last nonblank.
%
  nonb = s_len_trim ( s1 );
%
%  Shift the string right.
%
  s2(1:s1_length-nonb) = ' ';
  s2(s1_length+1-nonb:s1_length) = s(1:nonb);

  return
end

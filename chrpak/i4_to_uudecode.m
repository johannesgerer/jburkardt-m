function uudecode = i4_to_uudecode ( i )

%*****************************************************************************80
%
%% I4_TO_UUDECODE returns the I-th character in the UUDECODE encoding.
%
%  Example:
%
%    I  UUDECODE
%
%    1  '`'
%    2  '!'
%    3  '"'
%   ..
%   64  '_'
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 March 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I, the index of the character.
%    1 <= I <= 64.
%
%    Output, character UUDECODE, the requested character.
%
  s = '`!"#$%&''()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_';

  if ( 1 <= i && i <= 64 )
    uudecode = s(i);
  else
    uudecode = ' ';
  end

  return
end

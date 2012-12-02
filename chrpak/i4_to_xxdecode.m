function xxdecode = i4_to_xxdecode ( i )

%*****************************************************************************80
%
%% I4_TO_XXDECODE returns the I-th character in the XXDECODE encoding.
%
%  Example:
%
%    I  I4_TO_UUDECODE
%
%    1  '+'
%    2  '-'
%    3  '0'
%   ..
%   64  'z'
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
%    Input, integer I, the index of the character.
%    1 <= I <= 64.
%
%    Output, character XXDECODE, the requested character.
%
  string = '+-0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';

  if ( 1 <= i && i <= 64 )
    xxdecode = string(i);
  else
    xxdecode = ' ';
  end

  return
end

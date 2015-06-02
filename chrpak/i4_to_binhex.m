function binhex = i4_to_binhex ( i )

%*****************************************************************************80
%
%% I4_TO_BINHEX returns the I-th character in the BINHEX encoding.
%
%  Example:
%
%    I  I4_TO_BINHEX
%
%    1  '!'
%    2  '"'
%    3  '#'
%   ..
%   64  'r'
%
%  Modified:
%
%    16 January 2013
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
%    Output, character BINHEX, the requested character.
%
  string = '!"#$%&''()*+,-012345689@ABCDEFGHIJKLMNPQRSTVWXYZ[`abcdefhijklmpqr';

  if ( 1 <= i && i <= 64 )
    binhex = string(i);
  else
    binhex = ' ';
  end

  return
end

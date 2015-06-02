function a = i4_to_a ( i )

%*****************************************************************************80
%
%% I4_TO_A returns the I-th alphabetic character.
%
%  Example:
%
%    I   A
%
%   -8  ' '
%    0  ' '
%    1  'A'
%    2  'B'
%   ..
%   26  'Z'
%   27  'a'
%   52  'z'
%   53  ' '
%   99  ' '
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
%    Input, integer I, the index of the letter to be returned.
%    0 is a space;
%    1 through 26 requests 'A' through 'Z', (ASCII 65:90);
%    27 through 52 requests 'a' through 'z', (ASCII 97:122);
%
%    Output, character A, the requested alphabetic letter.
%
  if ( i <= 0 )
    a = ' ';
  elseif ( 1 <= i && i <= 26 )
    a = char ( 'A' + i - 1 );
  elseif ( 27 <= i && i <= 52 )
    a = char ( 'a' + i - 27 );
  else
    a = ' ';
  end

  return
end

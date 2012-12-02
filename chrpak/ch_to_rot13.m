function value = ch_to_rot13 ( ch )

%*****************************************************************************80
%
%% CH_TO_ROT13 converts a character to its ROT13 equivalent.
%
%  Discussion:
%
%    Two applications of CH_TO_ROT13 to a character will return the original.!
%
%    As a further scrambling, digits are similarly rotated using
%    a "ROT5" scheme.
%
%  Example:
%
%    Input:  Output:
%
%    a       n
%    C       P
%    J       W
%    1       6
%    5       0
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 April 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character CH, the character to be converted.
%
%    Output, character VALUE, the ROT13 equivalent of the character.
%

%
%  [0:4] -> [5:9]
%
  if ( 48 <= ch && ch <= 52 )
    value = ch + 5;
%
%  [5:9] -> [0:4]
%
  elseif ( 53 <= ch && ch <= 57 )
    value = ch - 5;
%
%  [A:M] -> [N:Z]
%
  elseif ( 65 <= ch && ch <= 77 )
    value = ch + 13;
%
%  [N:Z] -> [A:M]
%
  elseif ( 78 <= ch && ch <= 90 )
    value = ch - 13;
%
%  [a:m] -> [n:z]
%
  elseif ( 97 <= ch && ch <= 109 )
    value = ch + 13;
%
%  [n:z] -> [a:m]
%
  elseif ( 110 <= ch && ch <= 122 )
    value = ch - 13;
  else
    value = ch;
  end
 
  value = char ( value );

  return
end

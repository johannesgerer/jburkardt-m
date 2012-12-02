function s = i4_to_hex ( i4 )

%*****************************************************************************80
%
% I4_TO_HEX produces the hexadecimal representation of an I4.
%
%  Example:
%
%        I4      S
%       ---     ---
%         0     '0'
%         9     '9'
%        10     'A'
%        15     'F'
%        16    '10'
%       100    '64'
%       -12    '-C'
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 August 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I4, the integer to be represented.
%
%    Output, string S, the hexadecimal representation.
%
  s = [];

  isgn = 1;

  if ( i4 < 0 )
    isgn = -1;
    i4 = -i4;
  end
%
%  Force I4 to be an integer.
%
  i4 = floor ( i4 );
%
%  Moving left, fill in the next digit of the string.
%
  while ( 1 )

    digit = mod ( i4, 16 );
    i4 = floor ( i4 / 16 );
    
    ch = i4_to_hex_digit ( digit );

    s = strcat ( ch, s );

    if ( i4 == 0 )
      break
    end

  end

  if ( isgn == -1 )
    s = strcat ( '-', s );
  end

  return
end

function s = i4_to_s_zero ( intval, s_len )

%*****************************************************************************80
%
%% I4_TO_S_ZERO converts an I4 to a string, with zero padding.
%
%  Discussion:
%
%    An I4 is an integer.
%
%  Example:
%
%    Assume that S is 6 characters long:
%
%    INTVAL  S
%
%         1  000001
%        -1  -00001
%         0  000000
%      1952  001952
%    123456  123456
%   1234567  ******  <-- Not enough room%
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
%    Input, integer INTVAL, an integer to be converted.
%
%    Input, integer S_LEN, the length of the string to be used.
%
%    Output, string S, the representation of the integer.
%    The integer will be right justified, and zero padded.
%    If there is not enough space, the string will be filled with stars.
%
  s = [];

  if ( s_len <= 0 ) 
    return
  end

  ilo = 1;
%
%  Make a copy of the integer.
%
  ival = intval;
%
%  Handle the negative sign.
%
  if ( ival < 0 )

    if ( s_len <= 1 )
      s(1) = '*';
      s = char ( s );
      return
    end

    ival = - ival;
    s(1) = '-';
    ilo = 2;

  end
%
%  Working from right to left, strip off the digits of the integer
%  and place them into S(ILO:S_LEN).
%
  ipos = s_len;

  while ( ival ~= 0 || ipos == s_len )

    idig = mod ( ival, 10 );
    ival = floor ( ival / 10 );

    if ( ipos < ilo )
      s(1:s_len) = '*';
      s = char ( s );
      return
    end

    c = digit_to_ch ( idig );

    s(ipos) = c;
    ipos = ipos - 1;

  end
%
%  Fill the empties with zeroes.
%
  s(ilo:ipos) = '0';
  s = char ( s );

  return
end

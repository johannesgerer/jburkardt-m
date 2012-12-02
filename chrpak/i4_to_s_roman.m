function s = i4_to_s_roman ( i )

%*****************************************************************************80
%
%% I4_TO_S_ROMAN converts an integer to a string of Roman numerals.
%
%  Example:
%
%         I  S
%
%        -2  -II <-- Not a Roman numeral
%        -1  -I  <-- Not a Roman numeral
%         0   0  <-- Not a Roman numeral
%         1   I
%         2   II
%         3   III
%         4   IV
%         5   V
%        10   X
%        20   XX
%        30   XXX
%        40   XL
%        50   L
%        60   LX
%        70   LXX
%        80   LXXX
%        90   XC
%       100   C
%       500   D
%      1000   M
%      4999   MMMMCMLXLIX
%
%  Discussion:
%
%    To generate numbers greater than 4999, the numeral 'V' had a bar
%    above it, representing a value of 5000, a barred 'X' represented
%    10,000 and so on.
%
%    In the subtractive representation of 4 by 'IV', 9 by 'IX' and so on,
%    'I' can only subtract from 'V' or 'X', 
%    'X' can only subtract from 'L' or 'C',
%    'C' can only subtract from 'D' or 'M'.
%    Under these rules, 1999 cannot be written IMM!
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 December 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I, an integer to be converted.  If the integer
%    has absolute value greater than 4999, the string '?' will be returned.
%    If the integer is 0, then the string '0' will be returned.  If
%    the integer is negative, then a minus sign will precede it, even
%    though this has nothing to do with Roman numerals.
%
%    Output, string S, the representation of the integer
%    as a Roman numeral.
%
  s = '';

  if ( 4999 < abs ( i ) )
    s = '?';
    s = char ( s );
    return
  end

  if ( i == 0 )
    s = '0';
    s = char ( s );
    return
  end

  if ( i <= 0 )
    s = '-';
    i = -i;
  end

  while ( 0 < i ) 

    if ( 1000 <= i )
      s = [ s 'M' ];
      i = i - 1000;
    elseif ( 900 <= i )
      s = [ s 'CM' ];
      i = i - 900;
    elseif ( 500 <= i )
      s = [ s 'D' ];
      i = i - 500;
    elseif ( 400 <= i )
      s = [ s 'CD' ];
      i = i - 400;
    elseif ( 100 <= i )
      s = [ s 'C' ];
      i = i - 100;
    elseif ( 90 <= i )
      s = [ s 'XC' ];
      i = i - 90;
    elseif ( 50 <= i )
      s = [ s 'L' ];
      i = i - 50;
    elseif ( 40 <= i )
      s = [ s 'XL' ];
      i = i - 40;
    elseif ( 10 <= i )
      s = [ s 'X' ];
      i = i - 10;
    elseif ( 9 <= i )
      s = [ s 'IX' ];
      i = i - 9;
    elseif ( 5 <= i )
      s = [ s 'V' ];
      i = i - 5;
    elseif ( 4 <= i )
      s = [ s 'IV' ];
      i = i - 4;
    else
      s = [ s 'I' ];
      i = i - 1;
    end

  end

  s = char ( s );

  return
end

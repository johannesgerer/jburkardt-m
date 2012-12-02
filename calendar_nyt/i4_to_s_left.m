function s = i4_to_s_left ( intval )

%*****************************************************************************80
%
%% I4_TO_S_LEFT converts an integer to a left-justified string.
%
%  Example:
%
%    INTVAL  S
%
%         1  1
%        -1  -1
%         0  0
%      1952  1952
%    123456  123456
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
%    Input, integer INTVAL, an integer to be converted.
%
%    Output, string S, the representation of the integer.
%    The integer will be left-justified.  
%
  s = [];
  ival = abs ( intval );
  digit_num = 0;
%
%  Find the last digit of IVAL, strip it off, and stick it into the string.
%
  while ( 1 )

    digit_i = mod ( ival, 10 );
    ival = floor ( ival / 10 );

    digit_c = digit_to_ch ( digit_i );

    digit_num = digit_num + 1;
    t(digit_num) = digit_c;

    if ( ival == 0 )
      break
    end

  end
%
%  Reverse the string.
%
  if ( intval < 0 )
    s(1) = '-';
    s(2:digit_num+1) = t(digit_num:-1:1);
  else
    s(1:digit_num) = t(digit_num:-1:1);
  end

  s = char ( s );

  return
end

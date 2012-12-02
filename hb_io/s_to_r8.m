function [ r, lchar, ierror ] = s_to_r8 ( s )

%*****************************************************************************80
%
%% S_TO_R8 reads an R8 from a string.
%
%  Discussion:
%
%    This routine will read as many characters as possible until it reaches
%    the end of the string, or encounters a character which cannot be
%    part of the real number.
%
%    Legal input is:
%
%       1 blanks,
%       2 '+' or '-' sign,
%       2.5 spaces
%       3 integer part,
%       4 decimal point,
%       5 fraction part,
%       6 'E' or 'e' or 'D' or 'd', exponent marker,
%       7 exponent sign,
%       8 exponent integer part,
%       9 exponent decimal point,
%      10 exponent fraction part,
%      11 blanks,
%      12 final comma or semicolon.
%
%    with most quantities optional.
%
%  Example:
%
%    S                 R
%
%    '1'               1.0
%    '     1   '       1.0
%    '1A'              1.0
%    '12,34,56'        12.0
%    '  34 7'          34.0
%    '-1E2ABCD'        -100.0
%    '-1X2ABCD'        -1.0
%    ' 2E-1'           0.2
%    '23.45'           23.45
%    '-4.2E+2'         -420.0
%    '17d2'            1700.0
%    '-14e-2'         -0.14
%    'e2'              100.0
%    '-12.73e-9.23'   -12.73 * 10.0**(-9.23)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 November 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S, the string containing the
%    data to be read.  Reading will begin at position 1 and
%    terminate at the end of the string, or when no more
%    characters can be read to form a legal real.  Blanks,
%    commas, or other nonnumeric data will, in particular,
%    cause the conversion to halt.
%
%    Output, real R, the value that was read from the string.
%
%    Output, integer LCHAR, the number of characters of S that were used to form R.
%
%    Output, integer IERROR, is 0 if no error occurred.
%
  s_length = s_len_trim ( s );
  ierror = 0;
  r = 0.0;
  lchar = -1;
  isgn = 1;
  rtop = 0.0;
  rbot = 1.0;
  jsgn = 1;
  jtop = 0;
  jbot = 1;
  ihave = 1;
  iterm = 0;

  while ( 1 )

    lchar = lchar + 1;
    c = s(lchar+1);
%
%  Blank character.
%
    if ( c == ' ' )

      if ( ihave == 2 )

      elseif ( ihave == 6 || ihave == 7 )
        iterm = 1;
      elseif ( 1 < ihave )
        ihave = 11;
      end
%
%  Comma.
%
    elseif ( c == ',' || c == ';' )

      if ( ihave ~= 1 )
        iterm = 1;
        ihave = 12;
        lchar = lchar + 1;
      end
%
%  Minus sign.
%
    elseif ( c == '-' )

      if ( ihave == 1 );
        ihave = 2;
        isgn = -1;
      elseif ( ihave == 6 )
        ihave = 7;
        jsgn = -1;
      else
        iterm = 1;
      end
%
%  Plus sign.
%
    elseif ( c == '+' )

      if ( ihave == 1 )
        ihave = 2;
      elseif ( ihave == 6 )
        ihave = 7;
      else
        iterm = 1;
      end
%
%  Decimal point.
%
    elseif ( c == '.' )

      if ( ihave < 4 )
        ihave = 4;
      elseif ( 6 <= ihave & ihave <= 8 )
        ihave = 9;
      else
        iterm = 1;
      end
%
%  Exponent marker.
%
    elseif ( ch_eqi ( c, 'E' ) || ch_eqi ( c, 'D' ) )

      if ( ihave < 6 )
        ihave = 6;
      else
        iterm = 1;
      end
%
%  Digit.
%
    elseif ( ihave < 11 & ch_is_digit ( c ) )

      if ( ihave <= 2 )
        ihave = 3;
      elseif ( ihave == 4 )
        ihave = 5;
      elseif ( ihave == 6 || ihave == 7 )
        ihave = 8;
      elseif ( ihave == 9 )
        ihave = 10;
      end

      d = ch_to_digit ( c );

      if ( ihave == 3 )
        rtop = 10.0 * rtop + d;
      elseif ( ihave == 5 )
        rtop = 10.0 * rtop + d;
        rbot = 10.0 * rbot;
      elseif ( ihave == 8 )
        jtop = 10 * jtop + d;
      elseif ( ihave == 10 )
        jtop = 10 * jtop + d;
        jbot = 10 * jbot;
      end
%
%  Anything else is regarded as a terminator.
%
    else
      iterm = 1;
    end
%
%  If we haven't seen a terminator, and we haven't examined the
%  entire string, go get the next character.
%
    if ( iterm == 1 || s_length <= lchar + 1 )
      break;
    end

  end
%
%  If we haven't seen a terminator, and we have examined the
%  entire string, then we're done, and LCHAR is equal to S_LENGTH.
%
  if ( iterm ~= 1 & lchar + 1 == s_length )
    lchar = s_length;
  end
%
%  Number seems to have terminated.  Have we got a legal number?
%  Not if we terminated in states 1, 2, 6 or 7!
%
  if ( ihave == 1 || ihave == 2 || ihave == 6 || ihave == 7 )
    ierror = ihave;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'S_TO_R8 - Fatal error!\n' );
    fprintf ( 1, '  IHAVE = %d\n', ihave );
    error ( 'S_TO_R8 - Fatal error!' );
  end
%
%  Number seems OK.  Form it.
%
  if ( jtop == 0 )
    rexp = 1.0;
  else

    if ( jbot == 1 )
      rexp = 10.0^( jsgn * jtop );
    else
      rexp = jsgn * jtop;
      rexp = rexp / jbot;
      rexp = 10.0^rexp;
    end

  end

  r = isgn * rexp * rtop / rbot;

  return
end

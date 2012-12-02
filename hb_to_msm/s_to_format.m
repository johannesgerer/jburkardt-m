function [ r, code, w, m ] = s_to_format ( s )

%*****************************************************************************80
%
%% S_TO_FORMAT reads a FORTRAN format from a string.
%
%  Discussion:
%
%    This routine will read as many characters as possible until it reaches
%    the end of the string, or encounters a character which cannot be
%    part of the format.  This routine is limited in its ability to
%    recognize FORTRAN formats.  In particular, we are only expecting
%    a single format specification, and cannot handle extra features
%    such as 'ES' and 'EN' codes, '5X' spacing, and so on.
%
%    Legal input is:
%
%       0 nothing
%       1 blanks
%       2 optional '('
%       3 blanks
%       4 optional repeat factor R
%       5 blanks
%       6 CODE ( 'A', 'B', 'E', 'F', 'G', 'I', 'L', 'O', 'Z', '*' )
%       7 blanks
%       8 width W
%       9 optional decimal point
%      10 optional mantissa M
%      11 blanks
%      12 optional ')'
%      13 blanks
%
%  Example:
%
%    S                 R   CODE   W    M
%
%    'I12              1   I      12   0
%    'E8.0'            1   E       8   0
%    'F10.5'           1   F      10   5
%    '2G14.6'          2   G      14   6
%    '*'               1   *      -1  -1
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
%    characters can be read.
%
%    Output, integer R, the repetition factor, which defaults to 1.
%
%    Output, character CODE, the format code.
%
%    Output, integer W, the field width.
%
%    Output, integer M, the mantissa width.
%
  LEFT = 1;
  RIGHT = -1;

  state = 0;
  paren_sum = 0;
  pos = 0;
  s_length = s_len_trim ( s );

  r = 0;
  w = 0;
  code = '?';
  m = 0;

  while ( pos < s_length )

    pos = pos + 1;
    c = s(pos);
%
%  BLANK character:
%
    if ( c == ' ' )

      if ( state == 4 )
        state = 5;
      elseif ( state == 6 )
        state = 7;
      elseif ( state == 10 )
        state = 11;
      elseif ( state == 12 )
        state = 13;
      end
%
%  LEFT PAREN
%
    elseif ( c == '(' )

      if ( state < 2 )
        paren_sum = paren_sum + LEFT;
      else
        state = -1;
        break;
      end
%
%  DIGIT (R, F, or W)
%
    elseif ( ch_is_digit ( c ) )

      if ( state <= 3 )
        state = 4;
        r = ch_to_digit ( c );
      elseif ( state == 4 )
        d = ch_to_digit ( c );
        r = 10 * r + d;
      elseif ( state == 6 | state == 7 )
        if ( code == '*' )
          state = -1;
          break;
        end
        state = 8;
        w = ch_to_digit ( c );
      elseif ( state == 8 )
        d = ch_to_digit ( c );
        w = 10 * w + d;
      elseif ( state == 9 )
        state = 10;
        m = ch_to_digit ( c );
      elseif ( state == 10 )
        d = ch_to_digit ( c );
        m = 10 * m + d;
      else
        state = -1;
        break;
      end
%
%  DECIMAL POINT
%
    elseif ( c == '.' )

      if ( state == 8 )
        state = 9;
      else
        state = -1;
        break;
      end
%
%  RIGHT PAREN
%
    elseif ( c == ')' )

      paren_sum = paren_sum + RIGHT;

      if ( paren_sum ~= 0 )
        state = -1;
        break;
      end

      if ( state == 6 & code == '*' )
        state = 12;
      elseif ( 6 <= state )
        state = 12;
      else
        state = -1;
        break;
      end
%
%  Code
%
    elseif ( ch_is_format_code ( c ) )

      if ( state < 6 )
        state = 6;
        code = c;
      else
        state = -1;
        break;
      end
%
%  Unexpected character
%
    else

      state = -1;
      break;

    end

  end

  if ( paren_sum ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'S_TO_FORMAT - Fatal error!\n' );
    fprintf ( 1, '  Parentheses mismatch.\n' );
    error ( 'S_TO_FORMAT - Fatal error!' );
  end

  if ( state < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'S_TO_FORMAT - Fatal error!\n' );
    fprintf ( 1, '  Parsing error.\n' );
    error ( 'S_TO_FORMAT - Fatal error!' );
  end

  if ( r == 0 )
    r = 1;
  end

  return
end

function ival = s_to_i4 ( s )

%*****************************************************************************80
%
%% S_TO_I4 reads an integer value from a string.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 January 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S, a string to be examined.
%
%    Output, integer IVAL, the integer value read from the string.
%
  ival = 0;

  s_len = length ( s );

  if ( s_len <= 0 )
    return
  end

  sgn = 1;
  state = 0;
  i = 0;

  while ( i < s_len )

    i = i + 1;
    c = s(i);

    if ( state == 0 )

      if ( c == ' ' )

      elseif ( c == '-' )
        state = 1;
        sgn = -1;
      elseif ( c == '+' )
        state = 1;
        sgn = +1;
      elseif ( '0' <= c && c <= '9' )
        state = 2;
        ival = c - '0';
      else
        fprintf ( '\n' );
        fprintf ( 'S_TO_I4 - Fatal error!\n' );
        fprintf ( '  Illegal character ''%c'' while in state %d.\n', c, state );
        fprintf ( '  Input string was "%s"\n', s );
        return;
      end
%
%  Have read the sign, now expecting the first digit.
%
    elseif ( state == 1 )

      if ( c == ' ' )

      elseif ( '0' <= c && c <= '9' )
        state = 2;
        ival = c - '0';
      else
        fprintf ( '\n' );
        fprintf ( 'S_TO_I4 - Fatal error!\n' );
        fprintf ( '  Illegal character ''%c'' while in state %d.\n', c, state );
        fprintf ( '  Input string was "%s"\n', s );
        return
      end
%
%  Have read at least one digit, expecting more.
%
    elseif ( state == 2 )

      if ( '0' <= c && c <= '9' )
        ival = 10 * ival + c - '0';
      else
        ival = sgn * ival;
        return;
      end

    end

  end
%
%  If we read all the characters in the string, see if we're OK.
%
  if ( state ~= 2 )
    fprintf ( '\n' );
    fprintf ( 'S_TO_I4 - Fatal error!\n' );
    fprintf ( '  Did not read enough information to define an integer!\n' );
    return;
  end

  ival = sgn * ival;

  return
end

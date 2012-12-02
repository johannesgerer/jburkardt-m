function i = binary_to_i4 ( s )

%*****************************************************************************80
%
%% BINARY_TO_I4 converts a binary representation into an integer value.
%
%  Example:
%
%        S        I
%
%      '101'      5  
%    '-1000'     -8 
%        '1'      1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 May 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S, the binary representation.
%
%    Output, integer I, the integer whose representation was input.
%
  nchar = s_len_trim ( s );
 
  i = 0;
  ichr = 1;
  istate = 0;
  isgn = 1;
 
  while ( ichr <= nchar )

    c = s(ichr);
%
%  Blank.
%
    if ( c == ' ' )
 
      if ( istate == 2 )
        istate = 3;
      end
%
%  Sign, + or -.
%
    elseif ( c == '-' )

      if ( istate == 0 )
        istate = 1;
        isgn = - 1;
      else
        istate = - 1;
      end

    elseif ( c == '+' )

      if ( istate == 0 )
        istate = 1;
      else
        istate = - 1;
      end
%
%  Digit, 0 or 1.
%
    elseif ( c == '1' )

      i = 2 * i;
      i = i + 1;
      istate = 2;

    elseif ( c == '0' )
 
      i = 2 * i;
      istate = 2;
%
%  Illegal or unknown sign.
%
    else

      fprintf ( 1, '\n' );
      fprintf ( 1, 'BINARY_TO_I4 - Serious error!\n' );
      fprintf ( 1, '  Illegal digit = "%c"\n', c );
      fprintf ( 1, '  Conversion halted prematurely!\n' );
      error ( 'BINARY_TO_I4 - Serious error!' );

    end

    if ( istate == -1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'BINARY_TO_I4 - Serious error!\n' );
      fprintf ( 1, '  Unable to decipher input!\n' );
      error ( 'BINARY_TO_I4 - Serious error!' );
    end

    if ( 3 <= istate )
      break;
    end

    ichr = ichr + 1;

  end
%
%  Apply the sign.
%
  i = isgn * i;

  return
end

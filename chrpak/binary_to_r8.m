function r = binary_to_r8 ( s )

%*****************************************************************************80
%
%% BINARY_TO_R8 converts a binary representation into a real value.
%
%  Example:
%
%        S                         R
%
%    -1010.11                   -10.75
%    0.011011                     0.4218750
%    0.01010101010101010101010    0.3333333
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
%    Input, string S, the binary representation.
%
%    Output, real R, the real number whose representation was input.
%
  nchar = s_len_trim ( s );
 
  intval = 0;
  ichr = 1;
  istate = 0;
  isgn = 1;
  r = 0.0E+00;
  power = 0;
 
  while ( ichr <= nchar )

    c = s(ichr);
%
%  Blank.
%
    if ( c == ' ' )
 
      if ( istate == 4 )
        istate = 5;
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
      endif
%
%  Digit, 0 or 1.
%
    elseif ( c == '1' )

      intval = 2 * intval + 1;

      if ( istate == 0 || istate == 1 )
        istate = 2;
      elseif ( istate == 3 )
        istate = 4;
      end

      if ( istate == 4 )
        power = power + 1;
      end

    elseif ( c == '0' )

      intval = 2 * intval;

      if ( istate == 0 || istate == 1 )
        istate = 2;
      elseif ( istate == 3 )
        istate = 4;
      end

      if ( istate == 4 )
        power = power + 1;
      end
%
%  Decimal point.
%
    elseif ( c == '.' )

      if ( istate <= 2 )
        istate = 3;
      else
        istate = - 1;
      end
%
%  Illegal or unknown sign.
%
    else

      fprintf ( 1, '\n' );
      fprintf ( 1, 'BINARY_TO_R - Serious error!\n' );
      fprintf ( 1, '  Illegal character = "%c"\n', c );
      fprintf ( 1, '  Conversion halted prematurely!\n' );
      error ( 'BINARY_TO_R - Serious error!' );

    end

    if ( istate == -1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'BINARY_TO_R - Serious error!\n' );
      fprintf ( 1, '  Unable to decipher input!\n' );
      error ( 'BINARY_TO_R - Serious error!' );
    end
 
    if ( 5 <= istate )
      break;
    end

    ichr = ichr + 1;

  end
%
%  Apply the sign and the scale factor.
%
  r = ( isgn * intval ) / ( 2.0^power );

  return
end

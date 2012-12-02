function value = base_to_i4 ( s, base )

%*****************************************************************************80
%
%% BASE_TO_I4 returns the value of an integer represented in some base.
%
%  Discussion:
%
%    BASE = 1 is allowed, in which case we allow the digits '1' and '0',
%    and we simply count the '1' digits for the result.
%
%    Negative bases between -16 and -2 are allowed.  
%
%    The base -1 is allowed, and essentially does a parity check on
%    a string of 1's.
%
%  Example:
%
%        Input      Output
%    -------------  ------
%         S   BASE       I
%    ------  -----  ------
%      '101'     2       5
%    '-1000'     3     -27
%      '100'     4      16
%   '111111'     2      63
%   '111111'    -2      21
%   '111111'     1       6
%   '111111'    -1       0
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
%    Input, string S, the string.  The elements of S are
%    blanks, a plus or minus sign, and digits.  Normally, the digits
%    are representations of integers between 0 and |BASE-1|.  In the
%    special case of base 1 or base -1, we allow both 0 and 1 as digits.
%
%    Input, integer BASE, the base in which the representation is given.  
%    Normally, 2 <= BASE <= 16.  However, there are two exceptions.
%
%    Output, integer VALUE, the integer.
%
  value = 0;
  s_length = s_len_trim ( s );
 
  if ( base == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'BASE_TO_I4 - Serious error!\n' );
    fprintf ( 1, '  The input base is zero.\n' );
    error ( 'BASE_TO_I4 - Serious error!' )
  end

  if ( 16 < abs ( base ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'BASE_TO_I4 - Serious error!\n' );
    fprintf ( 1, '  The input base is greater than 16!\n' );
    error ( 'BASE_TO_I4 - Serious error!' )
  end
 
  state = 0;
  isgn = 1 ;
  ichr = 1;

  while ( ichr <= s_length )

    ch = s(ichr);
%
%  Blank.
%
    if ( ch == ' ' )
 
      if ( state == 2 )
        break
      end
%
%  Sign, + or -.
%
    elseif ( ch == '-' )
 
      if ( state ~= 0 )
        break
      end

      state = 1;
      isgn = -1;
 
    elseif ( ch == '+' )
 
      if ( state ~= 0 )
        break
      end

      state = 1;

    else
%
%  Digit?
%
      digit = hex_digit_to_i4 ( ch );
 
      if ( abs ( base ) == 1 && ( digit == 0 || digit == 1 ) )

        value = base * value + digit;
        state = 2;
      
      elseif ( 0 <= digit && digit < abs ( base ) )

        value = base * value + digit;
        state = 2;

      else

        fprintf ( 1, '\n' );
        fprintf ( 1, 'BASE_TO_I4 - Serious error!\n' );
        fprintf ( 1, '  Illegal digit = "%c"\n', ch );
        fprintf ( 1, '  Conversion halted prematurely!\n' );
        error ( 'BASE_TO_I4 - Serious error!' )

      end

    end

    ichr = ichr + 1;

  end
%
%  Once we're done reading information, we expect to be in state 2.
%
  if ( state ~= 2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'BASE_TO_I4 - Serious error!\n' );
    fprintf ( 1, '  Unable to decipher input!\n' );
    error ( 'BASE_TO_I4 - Serious error!' )
  end
%
%  Account for the sign.
%
  value = isgn * value;
 
  return
end

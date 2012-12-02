function s = i4_to_base ( i4, base )

%*****************************************************************************80
%
%% I4_TO_BASE represents an integer in any base up to 16.
%
%  Example:
%
%      Input            Output
%    -------------    --------
%    INTVAL   BASE           S
%
%         5    -1   '101010101'
%         5     1       '11111'
%         5     2         '101'
%         5     3          '12'
%         5     4          '11'
%        -5     5         '-10'
%         5     6           '5'
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 April 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I4, the integer whose representation is desired.
%
%    Input, integer BASE, the base in which the representation is
%    given.  BASE must be greater than 0 and no greater than 16.
%
%    Output, string S, the string.
%
  s = [];
%
%  Check the base.
%
  if ( base < -1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4_TO_BASE - Serious error!\n' );
    fprintf ( 1, '  The input base is less than -1!\n' );
    return
  end

  if ( base == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4_TO_BASE - Serious error!\n' );
    fprintf ( 1, '  The input base is zero.\n' );
    return
  end

  if ( 16 < base )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4_TO_BASE - Serious error!\n' );
    fprintf ( 1, '  The input base is greater than 16!\n' );
    return
  end
%
%  Special treatment for base 1 and -1.
%
  if ( base == 1 )
    s = i4_to_unary ( i4 );
    return
  elseif ( base == -1 )
    s = i4_to_nunary ( i4 );
    return
  end
%
%  Do repeated mod's
%
  i4_copy = abs ( i4 );

  while ( 1 )

    digit = mod ( i4_copy, base );
    i4_copy = floor ( ( i4_copy - digit ) / base );

    c = i4_to_hex_digit ( digit );

    s = strcat ( c, s );

    if ( i4_copy == 0 )
      break
    end

  end
%
%  Take care of the minus sign.
%
  if ( i4 < 0 )
    s = strcat ( '-', s );
  end

  return
end

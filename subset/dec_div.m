function [ mantissa, exponent ] = dec_div ( mantissa1, exponent1, ...
  mantissa2, exponent2, dec_digit )

%*****************************************************************************80
%
%% DEC_DIV divides two decimal values.
%
%  Discussion:
%
%    A decimal value is represented by MANTISSA * 10**EXPONENT.
%
%    The routine computes
%
%      MANTISSA * 10**EXPONENT
%      = ( MANTISSA1 * 10**EXPONENT1 ) / ( MANTISSA2 * 10**EXPONENT2 )
%      = ( MANTISSA1 / MANTISSA2 ) * 10**( EXPONENT1 - EXPONENT2 )
%
%    while avoiding integer overflow.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 August 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer MANTISSA1, EXPONENT1, the numerator.
%
%    Input, integer MANTISSA2, EXPONENT2, the denominator.
%
%    Input, integer DEC_DIGIT, the number of decimal digits.
%
%    Output, integer MANTISSA, EXPONENT, the result.
%

%
%  First special case, top fraction is 0.
%
  if ( mantissa1 == 0 )
    mantissa = 0;
    exponent = 0;
    return
  end
%
%  First error, bottom of fraction is 0.
%
  if ( mantissa2 == 0 )
    mantissa = 0;
    exponent = 0;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'DEC_DIV - Fatal error!\n' );
    fprintf ( 1, '  Denominator is zero.\n' );
    error ( 'DEC_DIV - Fatal error!' );
  end
%
%  Second special case, result is 1.
%
  if ( mantissa1 == mantissa2 & exponent1 == exponent2 )
    mantissa = 1;
    exponent = 0;
    return
  end
%
%  Third special case, result is power of 10.
%
  if ( mantissa1 == mantissa2 )
    mantissa = 1;
    exponent = exponent1 - exponent2;
    return
  end
%
%  Fourth special case: MANTISSA1/MANTISSA2 is exact.
%
  if ( floor ( mantissa1 / mantissa2 ) * mantissa2 == mantissa1 )
    mantissa = floor ( mantissa1 / mantissa2 );
    exponent = exponent1 - exponent2;
    return
  end
%
%  General case.
%
  dval = mantissa1 / mantissa2;

  [ mantissa3, exponent3 ] = r8_to_dec ( dval, dec_digit );

  mantissa = mantissa3;
  exponent = exponent3 + exponent1 - exponent2;

  return
end

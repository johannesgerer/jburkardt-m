function [ mantissa, exponent ] = dec_mul ( mantissa1, exponent1, ...
  mantissa2, exponent2, dec_digit )

%*****************************************************************************80
%
%% DEC_MUL multiplies two decimals.
%
%  Discussion:
%
%    A decimal value is represented by MANTISSA * 10**EXPONENT.
%
%    The routine computes
%
%      MANTISSA * 10**EXPONENT 
%      = ( MANTISSA1 * 10**EXPONENT1) * (MANTISSA2 * 10**EXPONENT2)
%      = ( MANTISSA1 * MANTISSA2 ) * 10**( EXPONENT1 + EXPONENT2 )
%
%    while avoiding integer overflow.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer MANTISSA1, EXPONENT1, the first multiplier.
%
%    Input, integer MANTISSA2, EXPONENT2, the second multiplier.
%
%    Input, integer DEC_DIGIT, the number of decimal digits.
%
%    Output, integer MANTISSA, EXPONENT, the product.
%
  i_max = i4_huge ( );
%
%  The result is zero if either MANTISSA1 or MANTISSA2 is zero.
%
  if ( mantissa1 == 0 | mantissa2 == 0 )
    mantissa = 0;
    exponent = 0;
    return
  end
%
%  The result is simple if either MANTISSA1 or MANTISSA2 is one.
%
  if ( abs ( mantissa1 ) == 1 | abs ( mantissa2 ) == 1 )
    mantissa = mantissa1 * mantissa2;
    exponent = exponent1 + exponent2;
    return
  end

  temp = log ( abs ( mantissa1 ) ) + log ( abs ( mantissa2 ) );

  if ( temp < log ( i_max ) )

    mantissa = mantissa1 * mantissa2;
    exponent = exponent1 + exponent2;

  else

    dval = mantissa1 * mantissa2;

    [ mantissa3, exponent3 ] = r8_to_dec ( dval, dec_digit );

    mantissa = mantissa3;
    exponent = exponent3 + ( exponent1 + exponent2 );

  end

  [ mantissa, exponent ] = dec_round ( mantissa, exponent, dec_digit );

  return
end

function [ mantissa, exponent ] = dec_add ( mantissa1, exponent1, ...
  mantissa2, exponent2, dec_digit )

%*****************************************************************************80
%
%% DEC_ADD adds two decimal quantities.
%
%  Discussion:
%
%    A decimal value is represented by MANTISSA * 10**EXPONENT.
%
%    The routine computes
%
%      MANTISSA * 10**EXPONENT = 
%        MANTISSA1 * 10**EXPONENT1 
%      + MANTISSA2 * 10**EXPONENT2
%
%    while trying to avoid integer overflow.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer MANTISSA1, EXPONENT1, the first number to be added.
%
%    Input, integer MANTISSA2, EXPONENT2, the second number to be added.
%
%    Input, integer DEC_DIGIT, the number of decimal digits.
%
%    Output, integer MANTISSA, EXPONENT, the sum.
%
  if ( mantissa1 == 0 )
    mantissa = mantissa2;
    exponent = exponent2;
    return
  elseif ( mantissa2 == 0 )
    mantissa = mantissa1;
    exponent = exponent1;
    return
  elseif ( exponent1 == exponent2 )
    mantissa = mantissa1 + mantissa2;
    exponent = exponent1;
    [ mantissa, exponent ] = dec_round ( mantissa, exponent, dec_digit );
    return
  end
%
%  Line up the exponents.
%
  mantissa3 = mantissa1;
  mantissa4 = mantissa2;

  if ( exponent1 < exponent2 )
    mantissa4 = mantissa4 * 10^( exponent2 - exponent1 );
  elseif ( exponent2 < exponent1 )
    mantissa3 = mantissa3 * 10^( exponent1 - exponent2 );
  end
%
%  Add the coefficients.
%
  mantissa = mantissa3 + mantissa4;
  exponent = min ( exponent1, exponent2 );
%
%  Clean up the result.
%
  [ mantissa, exponent ] = dec_round ( mantissa, exponent, dec_digit );

  return
end

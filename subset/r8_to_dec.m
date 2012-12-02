function [ mantissa, exponent ] = r8_to_dec ( dval, dec_digit )

%*****************************************************************************80
%
%% R8_TO_DEC converts a double precision quantity to a decimal representation.
%
%  Discussion:
%
%    Given the double precision value DVAL, the routine computes integers
%    MANTISSA and EXPONENT so that it is approximately true that:
%
%      DVAL = MANTISSA * 10 ** EXPONENT
%
%    In particular, only DEC_DIGIT digits of DVAL are used in constructing the
%    representation.
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
%    Input, double precision DVAL, the value whose decimal representation
%    is desired.
%
%    Input, integer DEC_DIGIT, the number of decimal digits.
%
%    Output, integer MANTISSA, EXPONENT, the approximate decimal 
%    representation of DVAL.
%

%
%  Special cases.
%
  if ( dval == 0.0 )
    mantissa = 0;
    exponent = 0;
    return
  end
%
%  Factor DVAL = MANTISSA_DOUBLE * 10**EXPONENT
%
  mantissa_double = dval;
  exponent = 0;
%
%  Now normalize so that 
%  10**(DEC_DIGIT-1) <= ABS(MANTISSA_DOUBLE) < 10**(DEC_DIGIT)
%
  ten1 = 10.0 ^ ( dec_digit - 1 );
  ten2 = 10.0 ^ dec_digit;

  while ( abs ( mantissa_double ) < ten1 )
    mantissa_double = mantissa_double * 10.0;
    exponent = exponent - 1;
  end

  while ( ten2 <= abs ( mantissa_double ) )
    mantissa_double = mantissa_double / 10.0;
    exponent = exponent + 1;
  end
%
%  MANTISSA is the integer part of MANTISSA_DOUBLE, rounded.
%
  mantissa = round ( mantissa_double );
%
%  Now divide out any factors of ten from MANTISSA.
%
  if ( mantissa ~= 0 )
    while ( 10 * floor ( mantissa / 10 ) == mantissa )
      mantissa = floor ( mantissa / 10 );
      exponent = exponent + 1;
    end
  end

  return
end

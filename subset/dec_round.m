function [ mantissa, exponent ] = dec_round ( mantissa, exponent, ...
  dec_digit )

%*****************************************************************************80
%
%% DEC_ROUND rounds a decimal fraction to a given number of digits.
%
%  Discussion:
%
%    A decimal value is represented by MANTISSA * 10**EXPONENT.
%
%    The routine takes an arbitrary decimal fraction makes sure that
%    MANTISSA has no more than DEC_DIGIT digits.
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
%    Input, integer MANTISSA, EXPONENT, the coefficient and exponent
%    of a decimal fraction.
%
%    Input, integer DEC_DIGIT, the number of decimal digits.
%
%    Output, integer MANTISSA, EXPONENT, the rounded data.
%    MANTISSA has no more than DEC_DIGIT decimal digits.
%
  if ( mantissa == 0 )
    exponent = 0;
    return
  end

  while ( 10^dec_digit <= abs ( mantissa ) )
    mantissa = round ( mantissa / 10.0E+00 );
    exponent = exponent + 1;
  end
%
%  Absorb trailing 0's into the exponent.
%
  while ( floor ( mantissa / 10 ) * 10 == mantissa )
    mantissa = mantissa / 10;
    exponent = exponent + 1;
  end

  return
end

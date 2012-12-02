function [ top, bot ] = dec_to_rat ( mantissa, exponent )

%*****************************************************************************80
%
%% DEC_TO_RAT converts a decimal to a rational representation.
%
%  Discussion:
%
%    A decimal value is represented by MANTISSA * 10**EXPONENT.
%
%    A rational value is represented by TOP / BOT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 June 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer MANTISSA, EXPONENT, the decimal number.
%
%    Output, integer TOP, BOT, the rational value.
%
  mantissa = round ( mantissa );
  exponent = round ( exponent );

  if ( exponent == 0 )
    top = mantissa;
    bot = 1;
  elseif ( 0 < exponent )
    top = mantissa * 10 ^ exponent;
    bot = 1;
  else
    top = mantissa;
    bot = 10 ^ ( - exponent );
    gcd = i4_gcd ( top, bot );
    top = floor ( top / gcd );
    bot = floor ( bot / gcd );
  end

  return
end

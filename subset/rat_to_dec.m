function [ mantissa, exponent ] = rat_to_dec ( top, bot )

%*****************************************************************************80
%
%% RAT_TO_DEC converts a rational to a decimal representation.
%
%  Discussion:
%
%    A rational value is represented by TOP / BOT.
%
%    A decimal value is represented as MANTISSA * 10**EXPONENT.
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
%    Input, integer TOP, BOT, the rational value.
%
%    Output, integer MANTISSA, EXPONENT, the decimal number.
%
  if ( top == 0 )
    mantissa = 0;
    exponent = 0;
    return
  end

  gcd = i4_gcd ( top, bot );
  top = top / gcd;
  bot = bot / gcd;

  if ( bot < 0 )
    top = -top;
    bot = -bot;
  end

  if ( bot == 1 )
    mantissa = top;
    exponent = 0;
    return
  end

  exponent = 0;

  while ( mod ( bot, 10 ) == 0 )
    exponent = exponent - 1;
    bot = bot / 10;
  end

  while ( mod ( top, 10 ) == 0 )
    exponent = exponent + 1;
    top = top / 10;
  end

  r = top / bot;

  if ( r < 0 )
    s = -1;
    r = -r;
  else
    s = 1;
  end

  while ( r ~= round ( r ) )
    r = r * 10.0;
    exponent = exponent - 1;
  end

  mantissa = s * r;

  return
end

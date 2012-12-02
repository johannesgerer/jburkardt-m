function width = dec_width ( mantissa, exponent )

%*****************************************************************************80
%
%% DEC_WIDTH returns the "width" of a decimal number.
%
%  Discussion:
%
%    A decimal value is represented by MANTISSA * 10**EXPONENT.
%
%    The "width" of a decimal number is the number of characters
%    required to print it.
%
%  Example:
%
%    Mantissa  Exponent Width  Representation:
%
%         523      -1       4           5.23
%         134       2       5       13400
%           0      10       1           0
%      123456     -10      12           0.0000123456
%      123456      -3       7         123.456
%      123456       0       6      123456
%      123456       3       9   123456000
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
%    Output, integer WIDTH, the "width" of the decimal number.
%
  width = 1;
  ten_pow = 10;

  if ( mantissa == 0 )
    return
  end
  
  mantissa_abs = abs ( mantissa );

  while ( ten_pow <= mantissa_abs )
    width = width + 1;
    ten_pow = ten_pow * 10;
  end

  if ( 0 < exponent )
    width = width + exponent;
  elseif ( exponent < 0 )
    width = max ( width, 1-exponent );
%
%  An internal decimal point adds one position.
%
    if ( 0 < width )
      width = width + 1;
%
%  A leading "0." adds two positions.
%
    else
      width = 2 - width;
    end
  end

  if ( mantissa < 0 )
    width = width + 1;
  end

  return
end

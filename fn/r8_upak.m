function [ y, n ] = r8_upak ( x )

%*****************************************************************************80
%
%% R8_UPAK unpacks an R8 into a mantissa and exponent.
%
%  Discussion:
%
%    This function unpacks a floating point number x so that
%
%      x = y * 2.0^n
%
%    where
%
%      0.5 <= abs ( y ) < 1.0.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 September 2011
%
%  Author:
%
%    MATLAB version by John Burkardt.
%
%  Parameters:
%
%    Input, real X, the number to be unpacked.
%
%    Output, real Y, the mantissa.
%
%    Output, integer N, the exponent.
%
  absx = abs ( x );
  n = 0;
  y = 0.0;

  if ( x == 0.0 )
    return
  end

  while ( absx < 0.5 )
    n = n - 1;
    absx = absx * 2.0;
  end

  while ( 1.0 <= absx )
    n = n + 1;
    absx = absx * 0.5;
  end

  if ( x < 0.0 )
    y = - absx;
  else
    y = + absx;
  end

  return
end

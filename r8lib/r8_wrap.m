function r = r8_wrap ( r, rlo, rhi )

%*****************************************************************************80
%
%% R8_WRAP forces an R8 to lie between given limits by wrapping.
%
%  Discussion:
%
%    An R8 is a real value.
%
%  Example:
%
%    RLO = 4.0, RHI = 8.0
%
%     R  Value
%
%    -2     8
%    -1     4
%     0     5
%     1     6
%     2     7
%     3     8
%     4     4
%     5     5
%     6     6
%     7     7
%     8     8
%     9     4
%    10     5
%    11     6
%    12     7
%    13     8
%    14     4
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 July 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real R, a value.
%
%    Input, real RLO, RHI, the desired bounds.
%
%    Output, real R, a "wrapped" version of the value.
%

%
%  Guarantee RLO2 < RHI2.
%
  rlo2 = min ( rlo, rhi );
  rhi2 = max ( rlo, rhi );
%
%  Find the width.
%
  rwide = rhi2 - rlo2;
%
%  Add enough copies of (RHI2-RLO2) to R so that the
%  result ends up in the interval RLO2 - RHI2.
%
  if ( rwide == 0.0 )
    value = rlo;
  elseif ( r < rlo2 )
    n = floor ( ( rlo2 - r ) / rwide ) + 1;
    value = r + n * rwide;
    if ( value == rhi )
      value = rlo;
    end
  else
    n = floor ( ( r - rlo2 ) / rwide );
    value = r - n * rwide;
    if ( value == rlo )
      value = rhi;
    end
  end

  r = value;

  return
end

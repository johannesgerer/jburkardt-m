function y = sqrt_cordic ( x, n )

%*****************************************************************************80
%
%% SQRT_CORDIC returns the square root of a value using the CORDIC method.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 June 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the number whose square root is desired.
%
%    Input, integer N, the number of iterations to take.
%    This is essentially the number of binary digits of accuracy.
%
%    Output, real Y, the approximate square root of X.
%
  if ( x < 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SQRT_CORDIC - Fatal error!\n' );
    fprintf ( 1, '  X < 0.\n' );
    error ( 'SQRT_CORDIC - Fatal error!' )
  end

  if ( x == 0.0 )
    y = 0.0;
    return
  end

  if ( x == 1.0 )
    y = 1.0;
    return
  end

  poweroftwo = 1.0;

  if ( x < 1.0 )

    while ( x <= poweroftwo * poweroftwo )
      poweroftwo = poweroftwo / 2.0;
    end

    y = poweroftwo;

  elseif ( 1.0 < x )

    while ( poweroftwo * poweroftwo <= x )
      poweroftwo = 2.0 * poweroftwo;
    end

    y = poweroftwo / 2.0;

  end

  for i = 1 : n
    poweroftwo = poweroftwo / 2.0;
    if ( ( y + poweroftwo ) * ( y + poweroftwo ) <= x )
      y = y + poweroftwo;
    end
  end

  return
end

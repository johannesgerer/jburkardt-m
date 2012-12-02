function y = cbrt_cordic ( x, n )

%*****************************************************************************80
%
%% CBRT_CORDIC returns the cube root of a value using the CORDIC method.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 June 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the number whose cube root is desired.
%
%    Input, integer N, the number of iterations to take.
%    This is essentially the number of binary digits of accuracy.
%
%    Output, real Y, the approximate cube root of X.
%
  x_mag = abs ( x );

  if ( x == 0.0 )
    y = 0.0;
    return
  end

  if ( x_mag == 1.0 )
    y = x;
    return
  end

  poweroftwo = 1.0;

  if ( x_mag < 1.0 )

    while ( x_mag <= poweroftwo * poweroftwo * poweroftwo )
      poweroftwo = poweroftwo / 2.0;
    end

    y = poweroftwo;

  elseif ( 1.0 < x_mag )

    while ( poweroftwo * poweroftwo * poweroftwo <= x_mag )
      poweroftwo = 2.0 * poweroftwo;
    end

    y = poweroftwo / 2.0;

  end

  for i = 1 : n
    poweroftwo = poweroftwo / 2.0;
    if ( ( y + poweroftwo ) * ( y + poweroftwo ) * ( y + poweroftwo ) <= x_mag )
      y = y + poweroftwo;
    end
  end

  if ( x < 0.0 )
    y = -y;
  end

  return
end

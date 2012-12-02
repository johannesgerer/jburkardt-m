function fx = exp_cordic ( x, n )

%*****************************************************************************80
%
%% EXP_CORDIC evaluates the exponential function using the CORDIC method.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 June 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Frederick Ruckdeschel,
%    BASIC Scientific Subroutines,
%    Volume II,
%    McGraw-Hill, 1980,
%    ISBN: 0-07-054202-3,
%    LC: QA76.95.R82.
%
%    Pitts Jarvis,
%    Implementing CORDIC Algorithms,
%    Dr Dobb's Journal,
%    October 1990.
%
%  Parameters:
%
%    Input, real X, the argument.
%
%    Input, integer N, the number of steps to take.
%
%    Output, real FX, the exponential of X.
%
%  Local Parameters:
%
%    Local, real A(1:25) = exp ( (1/2)^(1:25) );
%
  a_length = 25;

  a = [ ...
    1.648721270700128, ...
    1.284025416687742, ...
    1.133148453066826, ...
    1.064494458917859, ...
    1.031743407499103, ...
    1.015747708586686, ...
    1.007843097206488, ...
    1.003913889338348, ...
    1.001955033591003, ...
    1.000977039492417, ...
    1.000488400478694, ...
    1.000244170429748, ...
    1.000122077763384, ...
    1.000061037018933, ...
    1.000030518043791, ...
    1.0000152589054785, ...
    1.0000076294236351, ...
    1.0000038147045416, ...
    1.0000019073504518, ...
    1.0000009536747712, ...
    1.0000004768372719, ...
    1.0000002384186075, ...
    1.0000001192092967, ...
    1.0000000596046466, ...
    1.0000000298023228 ];
  e = 2.718281828459045;

  x_int = floor ( x );
%
%  Determine the weights.
%
  poweroftwo = 0.5;
  z = x - x_int;

  for i = 1 : n
    w(i) = 0.0;
    if ( poweroftwo < z )
      w(i) = 1.0;
      z = z - poweroftwo;
    end
    poweroftwo = poweroftwo / 2.0;
  end
%
%  Calculate products.
%
  fx = 1.0;

  for i = 1 : n

    if ( i <= a_length )
      ai = a(i);
    else
      ai = 1.0 + ( ai - 1.0 ) / 2.0;
    end

    if ( 0.0 < w(i) )
      fx = fx * ai;
    end

  end
%
%  Perform residual multiplication.
%
  fx = fx             ...
    * ( 1.0 + z       ...
    * ( 1.0 + z / 2.0 ...
    * ( 1.0 + z / 3.0 ...
    * ( 1.0 + z / 4.0 ))));
%
%  Account for factor EXP(X_INT).
%
  if ( x_int < 0 )

    for i = 1 : -x_int
      fx = fx / e;
    end

  else

    for i = 1 : x_int
      fx = fx * e;
    end

  end

  return
end

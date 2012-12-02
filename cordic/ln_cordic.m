function fx = ln_cordic ( x, n )

%*****************************************************************************80
%
%% LN_CORDIC evaluates the natural logarithm function using the CORDIC method.
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
%  Parameters:
%
%    Input, real X, the argument.
%
%    Input, integer N, the number of steps to take.
%
%    Output, real FX, the logarithm of X.
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

  if ( x <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LN_CORDIC - Fatal error!\n' );
    fprintf ( 1, '  Input argument X <= 0.0\n' );
    error ( 'LN_CORDIC - Fatal error!' );
  end

  k = 0;

  while ( e <= x )
    k = k + 1;
    x = x / e;
  end

  while ( x < 1.0 )
    k = k - 1;
    x = x * e;
  end
%
%  Determine the weights.
%
  for i = 1 : n

    w(i) = 0.0;

    if ( i <= a_length )
      ai = a(i);
    else
      ai = 1.0 + ( ai - 1.0 ) / 2.0;
    end

    if ( ai < x )
      w(i) = 1.0;
      x = x / ai;
    end

  end

  x = x - 1.0;
  x = x ...
    * ( 1.0 - ( x / 2.0 ) ...
    * ( 1.0 + ( x / 3.0 ) ...
    * ( 1.0 -   x / 4.0 )));
%
%  Assemble.
%
  poweroftwo = 0.5;
  for i = 1 : n
    x = x + w(i) * poweroftwo;
    poweroftwo = poweroftwo / 2.0;
  end

  fx = k + x;

  return
end

function value = zeta ( p )

%*****************************************************************************80
%
%% ZETA estimates the Riemann Zeta function.
%
%  Definition:
%
%    For 1 < P, the Riemann Zeta function is defined as:
%
%      ZETA ( P ) = Sum ( 1 <= N < Infinity ) 1 / N**P
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 August 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Daniel Zwillinger, editor,
%    CRC Standard Mathematical Tables and Formulae,
%    30th Edition,
%    CRC Press, 1996.
%
%  Parameters:
%
%    Input, real P, the power to which the integers are raised.
%    P must be greater than 1.
%
%    Output, real VALUE, an approximation to the Riemann
%    Zeta function.
%
  if ( p <= 1.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'ZETA - Fatal error!\n' );
    fprintf ( 1, '  Exponent P <= 1.0.\n' );
    error ( 'ZETA - Fatal error!' );
  end

  value = 0.0;
  n = 0;

  while ( 1 )

    n = n + 1;
    value_old = value;
    value = value + 1.0 / n^p;

    if ( value <= value_old || 1000 <= n )
      break;
    end

  end

  return
end

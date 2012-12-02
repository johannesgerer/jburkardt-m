function value = zeta ( p )

%*****************************************************************************80
%
%% ZETA estimates the Riemann Zeta function.
%
%  Discussion:
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
%    22 September 2004
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
%    P must be greater than 1.  For integral P up to 20, a
%    precomputed value of ZETA is returned; otherwise the infinite
%    sum is approximated.
%
%    Output, real VALUE, an approximation to the Riemann
%    Zeta function.
%
  if ( p <= 1.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'ZETA - Fatal error!\n' );
    fprintf ( 1, '  Exponent P <= 1.0.\n' );
    error ( 'ZETA - Fatal error!' );
  elseif ( p == 2.0 )
    value = pi^2 / 6.0;
  elseif ( p == 3.0 )
    value = 1.2020569032;
  elseif ( p == 4.0 )
    value = pi^4 / 90.0;
  elseif ( p == 5.0 )
    value = 1.0369277551;
  elseif ( p == 6.0 )
    value = pi^6 / 945.0;
  elseif ( p == 7.0 )
    value = 1.0083492774;
  elseif ( p == 8.0 )
    value = pi^8 / 9450.0;
  elseif ( p == 9.0 )
    value = 1.0020083928;
  elseif ( p == 10.0 )
    value = pi^10 / 93555.0;
  elseif ( p == 11.0 )
    value = 1.0004941886;
  elseif ( p == 12.0 )
    value = 1.0002460866;
  elseif ( p == 13.0 )
    value = 1.0001227133;
  elseif ( p == 14.0 )
    value = 1.0000612482;
  elseif ( p == 15.0 )
    value = 1.0000305882;
  elseif ( p == 16.0 )
    value = 1.0000152823;
  elseif ( p == 17.0 )
    value = 1.0000076372;
  elseif ( p == 18.0 )
    value = 1.0000038173;
  elseif ( p == 19.0 )
    value = 1.0000019082;
  elseif ( p == 20.0 )
    value = 1.0000009540;
  else

    zsum = 0.0;
    n = 0;

    while ( 1 )

      n = n + 1;
      zsum_old = zsum;
      zsum = zsum + 1.0 / n^p;

      if ( zsum <= zsum_old )
        break
      end

    end

    value = zsum;

  end

  return
end

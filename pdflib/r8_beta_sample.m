function value = r8_beta_sample ( aa, bb )

%*****************************************************************************80
%
%% R8_BETA_SAMPLE generates a beta random deviate.
%
%  Discussion:
%
%    This procedure returns a single random deviate from the beta distribution
%    with parameters A and B.  The density is
%
%      x^(a-1) * (1-x)^(b-1) / Beta(a,b) for 0 < x < 1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 June 2013
%
%  Author:
%
%    Original FORTRAN77 version by Barry Brown, James Lovato.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Russell Cheng,
%    Generating Beta Variates with Nonintegral Shape Parameters,
%    Communications of the ACM,
%    Volume 21, Number 4, April 1978, pages 317-322.
%
%  Parameters:
%
%    Input, real AA, the first parameter of the beta distribution.
%    0.0 < AA.
%
%    Input, real BB, the second parameter of the beta distribution.
%    0.0 < BB.
%
%    Output, real VALUE, a beta random variate.
%
  if ( aa <= 0.0 )
    fprintf ( 1, ' \n' );
    fprintf ( 1, 'R8_BETA_SAMPLE - Fatal error!\n' );
    fprintf ( 1, '  AA <= 0.0\n' );
    error ( 'R8_BETA_SAMPLE - Fatal error!\n' );
  end

  if ( bb <= 0.0 )
    fprintf ( 1, ' \n' );
    fprintf ( 1, 'R8_BETA_SAMPLE - Fatal error!\n' );
    fprintf ( 1, '  BB <= 0.0\n' );
    error ( 'R8_BETA_SAMPLE - Fatal error!\n' );
  end
%
%  Algorithm BB
%
  if ( 1.0 < aa && 1.0 < bb )

    a = min ( aa, bb );
    b = max ( aa, bb );
    alpha = a + b;
    beta = sqrt ( ( alpha - 2.0 ) / ( 2.0 * a * b - alpha ) );
    gamma = a + 1.0 / beta;

    while ( 1 )

      u1 = r8_uniform_01_sample ( );
      u2 = r8_uniform_01_sample ( );
      v = beta * log ( u1 / ( 1.0 - u1 ) );
      w = a * exp ( v );

      z = u1 ^ 2 * u2;
      r = gamma * v - log ( 4.0 );
      s = a + r - w;

      if ( 5.0 * z <= s + 1.0 + log ( 5.0 ) )
        break
      end

      t = log ( z );
      if ( t <= s )
        break
      end

      if ( t <= ( r + alpha * log ( alpha / ( b + w ) ) ) )
        break
      end

    end
%
%  Algorithm BC
%
  else

    a = max ( aa, bb );
    b = min ( aa, bb );
    alpha = a + b;
    beta = 1.0 / b;
    delta = 1.0 + a - b;

    k1 = delta * ( 1.0 / 72.0 + b / 24.0 ) / ( a / b - 7.0 / 9.0 );
    k2 = 0.25 + ( 0.5 + 0.25 / delta ) * b;

    while ( 1 )

      u1 = r8_uniform_01_sample ( );
      u2 = r8_uniform_01_sample ( );

      if ( u1 < 0.5 )

        y = u1 * u2;
        z = u1 * y;

        if ( k1 <= 0.25 * u2 + z - y )
          continue
        end

      else

        z = u1 ^ 2 * u2;

        if ( z <= 0.25 )

          v = beta * log ( u1 / ( 1.0 - u1 ) );
          w = a * exp ( v );

          if ( aa == a )
            value = w / ( b + w );
          else
            value = b / ( b + w );
          end

          return

        end

        if ( k2 < z )
          continue
        end

      end

      v = beta * log ( u1 / ( 1.0 - u1 ) );
      w = a * exp ( v );

      if ( log ( z ) <= ...
        alpha * ( log ( alpha / ( b + w ) ) + v ) - log ( 4.0 ) )
        break
      end

    end

  end

  if ( aa == a )
    value = w / ( b + w );
  else
    value = b / ( b + w );
  end

  return
end

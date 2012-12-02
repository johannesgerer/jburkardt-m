function [ x, seed ] = gamma_sample ( a, b, c, seed )

%*****************************************************************************80
%
%% GAMMA_SAMPLE samples the Gamma PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 October 2004
%
%  Author:
%
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    J H Ahrens and U Dieter,
%    Generating Gamma Variates by a Modified Rejection Technique,
%    Communications of the ACM,
%    Volume 25, Number 1, January 1982, pages 47 - 54.
%
%    J H Ahrens and U Dieter,
%    Computer Methods for Sampling from Gamma, Beta, Poisson and
%      Binomial Distributions.
%    Computing, Volume 12, 1974, pages 223 - 246.
%
%    J H Ahrens, K D Kohrt, and U Dieter,
%    Algorithm 599,
%    ACM Transactions on Mathematical Software,
%    Volume 9, Number 2, June 1983, pages 255-257.
%
%  Parameters:
%
%    Input, real A, B, C, the parameters of the PDF.
%    0.0 < B,
%    0.0 < C.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real X, a sample of the PDF.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  a1 =   0.3333333;
  a2 = - 0.2500030;
  a3 =   0.2000062;
  a4 = - 0.1662921;
  a5 =   0.1423657;
  a6 = - 0.1367177;
  a7 =   0.1233795;
  e1 = 1.0;
  e2 = 0.4999897;
  e3 = 0.1668290;
  e4 = 0.0407753;
  e5 = 0.0102930;
  euler = 2.71828182845904;
  q1 =   0.04166669;
  q2 =   0.02083148;
  q3 =   0.00801191;
  q4 =   0.00144121;
  q5 = - 0.00007388;
  q6 =   0.00024511;
  q7 =   0.00024240;
%
%  Allow C = 0.
%
  if ( c == 0.0 )
    x = a;
    return
  end
%
%  C < 1.
%
  if ( c < 1.0 )

    while ( 1 )

      [ u, seed ] = r8_uniform_01 ( seed );
      t = 1.0 + c / euler;
      p = u * t;

      [ s, seed ] = exponential_01_sample ( seed );

      if ( p < 1.0 )
        x = exp ( log ( p ) / c );
        if ( x <= s )
          break
        end
      else
        x = -log ( ( t - p ) / c );
        if ( ( 1.0 - c ) * log ( x ) <= s )
          break
        end
      end

    end

    x = a + b * x;
    return
%
%  1 <= C.
%
  else

    s2 = c - 0.5;
    s = sqrt ( c - 0.5 );
    d = sqrt ( 32.0 ) - 12.0 * sqrt ( c - 0.5 );

    [ t, seed ] = normal_01_sample ( seed );
    x = ( sqrt ( c - 0.5 ) + 0.5 * t )^2;

    if ( 0.0 <= t )
      x = a + b * x;
      return
    end

    [ u, seed ] = r8_uniform_01 ( seed );

    if ( d * u <= t^3 )
      x = a + b * x;
      return
    end

    r = 1.0 / c;

    q0 = ( ( ( ( ( ( ...
           q7   * r ...
         + q6 ) * r ...
         + q5 ) * r ...
         + q4 ) * r ...
         + q3 ) * r ...
         + q2 ) * r ...
         + q1 ) * r;

    if ( c <= 3.686 )
      bcoef = 0.463 + s - 0.178 * s2;
      si = 1.235;
      co = 0.195 / s - 0.079 + 0.016 * s;
    elseif ( c <= 13.022 ) 
      bcoef = 1.654 + 0.0076 * s2;
      si = 1.68 / s + 0.275;
      co = 0.062 / s + 0.024;
    else
      bcoef = 1.77;
      si = 0.75;
      co = 0.1515 / s;
    end

    if ( 0.0 < sqrt ( c - 0.5 ) + 0.5 * t )

      v = 0.5 * t / s;

      if ( 0.25 < abs ( v ) )
        q = q0 - s * t + 0.25 * t * t + 2.0 * s2 * log ( 1.0 + v );
      else
        q = q0 + 0.5 * t * t * ( ( ( ( ( ( ...
               a7   * v ...
             + a6 ) * v ...
             + a5 ) * v ...
             + a4 ) * v ...
             + a3 ) * v ...
             + a2 ) * v ...
             + a1 ) * v;
      end

      if ( log ( 1.0 - u ) <= q )
        x = a + b * x;
        return
      end

    end

    while ( 1 )

      [ e, seed ] = exponential_01_sample ( seed );

      [ u, seed ] = r8_uniform_01 ( seed );

      u = 2.0 * u - 1.0;
      if ( u < 0.0 )
        t = bcoef - si * e;
      else
        t = bcoef + si * e;
      end

      if ( -0.7187449 <= t )

        v = 0.5 * t / s;

        if ( 0.25 < abs ( v ) )
          q = q0 - s * t + 0.25 * t * t + 2.0 * s2 * log ( 1.0 + v );
        else
          q = q0 + 0.5 * t * t * ( ( ( ( ( ( ...
               a7   * v ...
             + a6 ) * v ...
             + a5 ) * v ...
             + a4 ) * v ...
             + a3 ) * v ...
             + a2 ) * v ...
             + a1 ) * v;
        end

        if ( 0.0 < q )

          if ( 0.5 < q )
            w = exp ( q ) - 1.0;
          else
            w = ( ( ( ( ...
                    e5   * q ...
                  + e4 ) * q ...
                  + e3 ) * q ...
                  + e2 ) * q ...
                  + e1 ) * q;
          end

          if ( co * abs ( u ) <= w * exp ( e - 0.5 * t * t ) )
            x = a + b * ( s + 0.5 * t )^2;
            return
          end

        end

      end

    end

  end

  return
end

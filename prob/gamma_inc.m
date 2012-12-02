function value = gamma_inc ( p, x )

%*****************************************************************************80
%
%% GAMMA_INC computes the incomplete Gamma function.
%
%  Discussion:
%
%    GAMMA_INC(P,X) = Integral ( 0 <= T <= X ) T**(P-1) EXP(-T) DT / GAMMA(P).
%
%    GAMMA_INC(P,       0) = 0,
%    GAMMA_INC(P,Infinity) = 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 September 2004
%
%  Author:
%
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    B L Shea,
%    Chi-squared and Incomplete Gamma Integral,
%    Algorithm AS239,
%    Applied Statistics,
%    Volume 37, Number 3, 1988, pages 466-473.
%
%  Parameters:
%
%    Input, real P, the exponent parameter.
%    0.0 < P.
%
%    Input, real X, the integral limit parameter.
%    If X is less than or equal to 0, GAMMA_INC is returned as 0.
%
%    Output, real VALUE, the value of the function.
%
  exp_arg_min = -88.0;
  overflow = 1.0E+37;
  plimit = 1000.0;
  tol = 1.0E-07;
  xbig = 1.0E+08;

  value = 0.0;

  if ( p <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'GAMMA_INC - Fatal error!\n' );
    fprintf ( 1, '  Parameter P <= 0.\n' );
    error ( 'GAMMA_INC - Fatal error!' );
  end

  if ( x <= 0.0 )
    value = 0.0;
    return
  end
%
%  Use a normal approximation if PLIMIT < P.
%
  if ( plimit < p )
    pn1 = 3.0 * sqrt ( p ) * ( ( x / p )^( 1.0 / 3.0 ) + 1.0 / ( 9.0 * p ) - 1.0 );
    cdf = normal_01_cdf ( pn1 );
    value = cdf;
    return
  end
%
%  Is X extremely large compared to P?
%
  if ( xbig < x )
    value = 1.0;
    return
  end
%
%  Use Pearson's series expansion.
%  (P is not large enough to force overflow in the log of Gamma.
%
  if ( x <= 1.0 | x < p )

    arg = p * log ( x ) - x - gammaln ( p + 1.0 );
    c = 1.0;
    value = 1.0;
    a = p;

    while ( 1 )

      a = a + 1.0;
      c = c * x / a;
      value = value + c;

      if ( c <= tol )
        break
      end

    end

    arg = arg + log ( value );

    if ( exp_arg_min <= arg )
      value = exp ( arg );
    else
      value = 0.0;
    end

  else
%
%  Use a continued fraction expansion.
%
    arg = p * log ( x ) - x - gammaln ( p );
    a = 1.0 - p;
    b = a + x + 1.0;
    c = 0.0;
    pn1 = 1.0;
    pn2 = x;
    pn3 = x + 1.0;
    pn4 = x * b;
    value = pn3 / pn4;

    while ( 1 )

      a = a + 1.0;
      b = b + 2.0;
      c = c + 1.0;
      pn5 = b * pn3 - a * c * pn1;
      pn6 = b * pn4 - a * c * pn2;

      if ( 0.0 < abs ( pn6 ) )

        rn = pn5 / pn6;

        if ( abs ( value - rn ) <= min ( tol, tol * rn ) )

          arg = arg + log ( value );

          if ( exp_arg_min <= arg )
            value = 1.0 - exp ( arg );
          else
            value = 1.0;
          end

          return

        end

        value = rn;

      end

      pn1 = pn3;
      pn2 = pn4;
      pn3 = pn5;
      pn4 = pn6;
%
%  Rescale terms in continued fraction if terms are large.
%
      if ( overflow <= abs ( pn5 ) )
        pn1 = pn1 / overflow;
        pn2 = pn2 / overflow;
        pn3 = pn3 / overflow;
        pn4 = pn4 / overflow;
      end

    end

  end

  return
end

function x = chi_square_cdf_inv ( cdf, a )

%*****************************************************************************80
%
%% CHI_SQUARE_CDF_INV inverts the Chi squared PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 October 2004
%
%  Author:
%
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Best and Roberts,
%    The Percentage Points of the Chi-Squared Distribution,
%    Algorithm AS 91,
%    Applied Statistics,
%    Volume 24, Number ?, pages 385-390, 1975.
%
%  Parameters:
%
%    Input, real CDF, a value of the chi-squared cumulative
%    probability density function.
%    0.000002 <= CDF <= 0.999998.
%
%    Input, real A, the parameter of the chi-squared
%    probability density function.  0 < A.
%
%    Output, real X, the value of the chi-squared random deviate
%    with the property that the probability that a chi-squared random
%    deviate with parameter A is less than or equal to PPCHI2 is P.
%
  aa = 0.6931471806;
  c1 = 0.01;
  c2 = 0.222222;
  c3 = 0.32;
  c4 = 0.4;
  c5 = 1.24;
  c6 = 2.2;
  c7 = 4.67;
  c8 = 6.66;
  c9 = 6.73;
  c10 = 13.32;
  c11 = 60.0;
  c12 = 70.0;
  c13 = 84.0;
  c14 = 105.0;
  c15 = 120.0;
  c16 = 127.0;
  c17 = 140.0;
  c18 = 175.0;
  c19 = 210.0;
  c20 = 252.0;
  c21 = 264.0;
  c22 = 294.0;
  c23 = 346.0;
  c24 = 420.0;
  c25 = 462.0;
  c26 = 606.0;
  c27 = 672.0;
  c28 = 707.0;
  c29 = 735.0;
  c30 = 889.0;
  c31 = 932.0;
  c32 = 966.0;
  c33 = 1141.0;
  c34 = 1182.0;
  c35 = 1278.0;
  c36 = 1740.0;
  c37 = 2520.0;
  c38 = 5040.0;
  cdf_max = 0.999998;
  cdf_min = 0.000002;
  e = 0.0000005;
  it_max = 20;

  if ( cdf < cdf_min )
    x = -1.0;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CHI_SQUARE_CDF_INV - Fatal error!\n' );
    fprintf ( 1, '  CDF < CDF_MIN.\n' );
    error ( 'CHI_SQUARE_CDF_INV - Fatal error!' );
  end

  if ( cdf_max < cdf )
    x = -1.0;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CHI_SQUARE_CDF_INV - Fatal error!\n' );
    fprintf ( 1, '  CDF_MAX < CDF.\n' );
    error ( 'CHI_SQUARE_CDF_INV - Fatal error!' );
  end

  xx = 0.5 * a;
  c = xx - 1.0;
%
%  Compute Log ( Gamma ( A/2 ) ).
%
  g = gammaln ( a / 2.0 );
%
%  Starting approximation for small chi-squared.
%
  if ( a < - c5 * log ( cdf ) )

    ch = ( cdf * xx * exp ( g + xx * aa ) )^( 1.0 / xx );

    if ( ch < e )
      x = ch;
      return
    end
%
%  Starting approximation for A less than or equal to 0.32.
%
  elseif ( a <= c3 )

    ch = c4;
    a2 = log ( 1.0 - cdf );

    while ( 1 )

      q = ch;
      p1 = 1.0 + ch * ( c7 + ch );
      p2 = ch * ( c9 + ch * ( c8 + ch ) );

      t = - 0.5 + ( c7 + 2.0 * ch ) / p1 ...
        - ( c9 + ch * ( c10 + 3.0 * ch ) ) / p2;

      ch = ch - ( 1.0 - exp ( a2 + g + 0.5 * ch + c * aa ) * p2 / p1 ) / t;

      if ( abs ( q / ch - 1.0 ) <= c1 )
        break;
      end

    end
%
%  Call to algorithm AS 111.
%  Note that P has been tested above.
%  AS 241 could be used as an alternative.
%
  else

    x2 = normal_01_cdf_inv ( cdf );
%
%  Starting approximation using Wilson and Hilferty estimate.
%
    p1 = c2 / a;
    ch = a * ( x2 * sqrt ( p1 ) + 1.0 - p1 )^3;
%
%  Starting approximation for P tending to 1.
%
    if ( c6 * a + 6.0 < ch )
      ch = -2.0 * ( log ( 1.0 - cdf ) - c * log ( 0.5 * ch ) + g );
    end

  end
%
%  Call to algorithm AS 239 and calculation of seven term Taylor series.
%
  for i = 1 : it_max

    q = ch;
    p1 = 0.5 * ch;
    p2 = cdf - gamma_inc ( xx, p1 );
    t = p2 * exp ( xx * aa + g + p1 - c * log ( ch ) );
    b = t / ch;
    a2 = 0.5 * t - b * c;

    s1 = ( c19 + a2 ...
       * ( c17 + a2 ...
       * ( c14 + a2 ...
       * ( c13 + a2 ...
       * ( c12 + a2 ...
       *   c11 ) ) ) ) ) / c24;

    s2 = ( c24 + a2 ...
       * ( c29 + a2 ...
       * ( c32 + a2 ...
       * ( c33 + a2 ...
       *   c35 ) ) ) ) / c37;

    s3 = ( c19 + a2 ...
       * ( c25 + a2 ...
       * ( c28 + a2 ...
       *   c31 ) ) ) / c37;

    s4 = ( c20 + a2 ...
       * ( c27 + a2 ...
       *   c34 ) + c ...
       * ( c22 + a2 ...
       * ( c30 + a2 ...
       *   c36 ) ) ) / c38;

    s5 = ( c13 + c21 * a2 + c * ( c18 + c26 * a2 ) ) / c37;

    s6 = ( c15 + c * ( c23 + c16 * c ) ) / c38;

    ch = ch + t * ( 1.0 + 0.5 * t * s1 - b * c ...
      * ( s1 - b ...
      * ( s2 - b ...
      * ( s3 - b ...
      * ( s4 - b ...
      * ( s5 - b ...
      *   s6 ) ) ) ) ) );

    if ( e < abs ( q / ch - 1.0D+00 ) )
      x = ch;
      return
    end

  end

  x = ch;
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CHI_SQUARE_CDF_INV - Warning!\n' );
  fprintf ( 1, '  Convergence not reached.\n' );

  return
end

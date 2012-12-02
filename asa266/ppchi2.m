function [ value, ifault ] = ppchi2 ( p, v )

%*****************************************************************************80
%
%% PPCHI2 evaluates the percentage points of the Chi-squared PDF.
%
%  Discussion
%
%    Incorporates the suggested changes in AS R85 (vol.40(1),
%    pages 233-5, 1991) which should eliminate the need for the limited
%    range for P, though these limits have not been removed
%    from the routine.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 February 2008
%
%  Author:
%
%    Original FORTRAN77 version by Donald Best, DE Roberts.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Donald Best, DE Roberts,
%    Algorithm AS 91:
%    The Percentage Points of the Chi-Squared Distribution,
%    Applied Statistics,
%    Volume 24, Number 3, 1975, pages 385-390.
%
%  Parameters:
%
%    Input, real P,  value of the chi-squared cumulative
%    probability density function.
%    0.000002 <= P <= 0.999998.
%
%    Input, real V, the parameter of the chi-squared probability
%    density function.
%    0 < V.
%
%    Output, real VALUE, the value of the chi-squared random
%    deviate with the property that the probability that a chi-squared random
%    deviate with parameter V is less than or equal to PPCHI2 is P.
%
%    Output, integer IFAULT, is nonzero if an error occurred.
%    0, no error.
%    1, P is outside the legal range.
%    2, V is not positive.
%    3, an error occurred in GAMMAD.
%    4, the result is probably as accurate as the machine will allow.
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
  e = 0.5E-06;
  maxit = 20;
  pmax = 0.999998;
  pmin = 0.000002;
%
%  Test arguments and initialize.
%
  value = - 1.0;

  if ( p < pmin | pmax < p )
    ifault = 1;
    return
  end

  if ( v <= 0.0 )
    ifault = 2;
    return
  end

  ifault = 0;
  xx = 0.5 * v;
  c = xx - 1.0;

  [ g, ifault] = alngam ( v / 2.0 );
%
%  Starting approximation for small chi-squared
%
  if ( v < - c5 * log ( p ) )

    ch = ( p * xx * exp ( g + xx * aa ) )^( 1.0 / xx );

    if ( ch < e )
      value = ch;
      return
    end
%
%  Starting approximation for V less than or equal to 0.32
%
  elseif ( v <= c3 )

    ch = c4;
    a = log ( 1.0 - p );

    while ( 1 )

      q = ch;
      p1 = 1.0 + ch * ( c7 + ch );
      p2 = ch * ( c9 + ch * ( c8 + ch ) );

      t = - 0.5 + (c7 + 2.0 * ch ) / p1 ...
        - ( c9 + ch * ( c10 + 3.0 * ch ) ) / p2

      ch = ch - ( 1.0 - exp ( a + g + 0.5 * ch + c * aa ) * p2 / p1) / t;

      if ( abs ( q / ch - 1.0 ) <= c1 )
        break
      end

    end

  else
%
%  Call to algorithm AS 111 - note that P has been tested above.
%  AS 241 could be used as an alternative.
%
   [ x, ifault ] = ppnd ( p );
%
%  Starting approximation using Wilson and Hilferty estimate
%
    p1 = c2 / v;
    ch = v * ( x * sqrt ( p1 ) + 1.0 - p1)^3;
%
%  Starting approximation for P tending to 1.
%
    if ( c6 * v + 6.0 < ch )
       ch = - 2.0 * ( log ( 1.0 - p ) - c * log ( 0.5 * ch ) + g );
    end

  end
%
%  Call to algorithm AS 239 and calculation of seven term
%  Taylor series
%
  for i = 1 : maxit

    q = ch;
    p1 = 0.5 * ch;
    [ temp, if1 ] = gammad ( p1, xx );
    p2 = p - temp;

    if ( if1 ~= 0 )
      ifault = 3;
      return
    end

    t = p2 * exp ( xx * aa + g + p1 - c * log ( ch ) );
    b = t / ch;
    a = 0.5 * t - b * c;
    s1 = ( c19 + a * ( c17 + a * ( c14 + a * ( c13 + a * ( c12 + ...
      c11 * a ))))) / c24;
    s2 = ( c24 + a * ( c29 + a * ( c32 + a * ( c33 + c35 * a )))) / c37;
    s3 = ( c19 + a * ( c25 + a * ( c28 + c31 * a ))) / c37;
    s4 = ( c20 + a * ( c27 + c34 * a) + c * ( c22 + a * ( c30 + c36 * a ))) ...
      / c38;
    s5 = ( c13 + c21 * a + c * ( c18 + c26 * a )) / c37;
    s6 = ( c15 + c * ( c23 + c16 * c )) / c38;
    ch = ch + t * ( 1.0 + 0.5 * t * s1 - b * c * ( s1 - b * ...
      ( s2 - b * ( s3 - b * ( s4 - b * ( s5 - b * s6 ))))));

    if ( e < abs ( q / ch - 1.0 ) )
       value = ch;
       return
    end

  end

  ifault = 4;
  value = ch;

  return
end

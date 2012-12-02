function [ bknu, bknu1, iswtch ] = r4_knus ( xnu, x )

%*****************************************************************************80
%
%% R4_KNUS computes a sequence of K Bessel functions.
%
%  Discussion:
%
%    This routine computes Bessel functions
%      exp(x) * k-sub-xnu (x)
%    and
%      exp(x) * k-sub-xnu+1 (x)
%    for 0.0 <= xnu < 1.0.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 November 2012
%
%  Author:
%
%    Original FORTRAN77 version by Wayne Fullerton.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Wayne Fullerton,
%    Portable Special Function Routines,
%    in Portability of Numerical Software,
%    edited by Wayne Cowell,
%    Lecture Notes in Computer Science, Volume 57,
%    Springer 1977,
%    ISBN: 978-3-540-08446-4,
%    LC: QA297.W65.
%
%  Parameters:
%
%    Input, real XNU, the order parameter.
%
%    Input, real X, the argument.
%
%    Output, real BKNU, BKNU1, the two K Bessel functions.
%
%    Output, integer ISWTCH, ?
%
  persistent aln2
  persistent alnbig
  persistent alneps
  persistent alnsml
  persistent c0kcs
  persistent euler
  persistent ntc0k
  persistent ntznu1
  persistent sqpi2
  persistent xnusml
  persistent xsml
  persistent znu1cs

  aln2 = 0.69314718055994531;
  euler = 0.57721566490153286;
  sqpi2 = 1.2533141373155003;

  if ( isempty ( ntc0k ) )

    c0kcs = [ ...
      0.060183057242626108E+00, ...
     -0.15364871433017286E+00, ...
     -0.011751176008210492E+00, ...
     -0.000852487888919795E+00, ...
     -0.000061329838767496E+00, ...
     -0.000004405228124551E+00, ...
     -0.000000316312467283E+00, ...
     -0.000000022710719382E+00, ...
     -0.000000001630564460E+00, ...
     -0.000000000117069392E+00, ...
     -0.000000000008405206E+00, ...
     -0.000000000000603466E+00, ...
     -0.000000000000043326E+00, ...
     -0.000000000000003110E+00, ...
     -0.000000000000000223E+00, ...
     -0.000000000000000016E+00 ]';
    znu1cs = [ ...
      0.20330675699419173E+00, ...
      0.14007793341321977E+00, ...
      0.007916796961001613E+00, ...
      0.000339801182532104E+00, ...
      0.000011741975688989E+00, ...
      0.000000339357570612E+00, ...
      0.000000008425941769E+00, ...
      0.000000000183336677E+00, ...
      0.000000000003549698E+00, ...
      0.000000000000061903E+00, ...
      0.000000000000000981E+00, ...
      0.000000000000000014E+00 ]';

    ntc0k = r4_inits ( c0kcs, 16, 0.1 * r4_mach ( 3 ) );
    ntznu1 = r4_inits ( znu1cs, 12, 0.1 * r4_mach ( 3 ) );
    xnusml = sqrt ( r4_mach ( 3 ) / 8.0 );
    xsml = 0.1 * r4_mach ( 3 );
    alnsml = log ( r4_mach ( 1 ) );
    alnbig = log ( r4_mach ( 2 ) );
    alneps = log ( 0.1 * r4_mach ( 3 ) );

  end

  if ( xnu < 0.0 || 1.0 <= xnu )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R4_KNUS - Fatal error!\n' );
    fprintf ( 1, '  XNU < 0 or. 1 <= XNU.\n' );
    error ( 'R4_KNUS - Fatal error!' )
  end

  if ( x <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R4_KNUS - Fatal error!\n' );
    fprintf ( 1, '  X <= 0.\n' );
    error ( 'R4_KNUS - Fatal error!' )
  end

  iswtch = 0;
%
%  X is small.  Compute k-sub-xnu (x) and the derivative of k-sub-xnu (x)
%  then find k-sub-xnu+1 (x).  xnu is reduced to the interval (-.5,+.5)
%  then to (0., .5), because k of negative order (-nu) = k of positive
%  order (+nu).
%
  if ( x <= 2.0 )

    if ( 0.5 < xnu )
      v = 1.0 - xnu;
    else
      v = xnu;
    end
%
%  Carefully find (x/2)^xnu and z^xnu where z = x*x/4.
%
    alnz = 2.0 * ( log ( x ) - aln2 );

    if ( x <= xnu )

      if ( alnbig < - 0.5 * xnu * alnz - aln2 - log ( xnu ) )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'R4_KNUS - Fatal error!\n' );
        fprintf ( 1, '  Small X causing overflow.\n' );
        error ( 'R4_KNUS - Fatal error!' )
      end

    end

    vlnz = v * alnz;
    x2tov = exp ( 0.5 * vlnz );

    if ( alnsml < vlnz )
      ztov = x2tov * x2tov;
    else
      ztov = 0.0;
    end

    a0 = 0.5 * r4_gamma ( 1.0 + v );
    b0 = 0.5 * r4_gamma ( 1.0 - v );
    c0 = - euler;

    if ( 0.5 < ztov && xnusml < v )
      c0 = - 0.75 + r4_csevl ( ( 8.0 * v ) * v - 1.0, c0kcs, ntc0k );
    end

    if ( ztov <= 0.5 )
      alpha(1) = ( a0 - ztov * b0 ) / v;
    else
      alpha(1) = c0 - alnz * ( 0.75 + ...
        r4_csevl ( vlnz / 0.35 + 1.0, znu1cs, ntznu1 ) ) * b0;
    end

    beta(1) = - 0.5 * ( a0 + ztov * b0 );

    if ( xsml < x )
      z = 0.25 * x * x;
    else
      z = 0.0;
    end

    nterms = max ( 2.0, r4_aint ( 11.0 + ( 8.0 * alnz - 25.19 - alneps ) ...
      / ( 4.28 - alnz ) ) );

    for i = 2 : nterms
      xi = i - 1;
      a0 = a0 / ( xi * ( xi - v) );
      b0 = b0 / ( xi * ( xi + v) );
      alpha(i) = ( alpha(i-1) + 2.0 * xi * a0 ) / ( xi * ( xi + v ) );
      beta(i) = ( xi - 0.5 * v ) * alpha(i) - ztov * b0;
    end

    bknu = alpha(nterms);
    bknud = beta(nterms);
    for ii = 2 : nterms
      i = nterms + 1 - ii;
      bknu = alpha(i) + bknu * z;
      bknud = beta(i) + bknud * z;
    end

    expx = exp ( x );
    bknu = expx * bknu / x2tov;

    if ( alnbig < - 0.5 * ( xnu + 1.0 ) * alnz - 2.0 * aln2 )
      iswtch = 1;
      return
    end

    bknud = expx * bknud * 2.0 / ( x2tov * x );

    if ( xnu <= 0.5 )
      bknu1 = v * bknu / x - bknud;
      return
    end

    bknu0 = bknu;
    bknu = - v * bknu / x - bknud;
    bknu1 = 2.0 * xnu * bknu / x + bknu0;
%
%  X is large.  Find k-sub-xnu (x) and k-sub-xnu+1 (x) with y. l. luke's
%  rational expansion.
%
  else

    sqrtx = sqrt ( x );

    if ( 1.0 / xsml < x )
      bknu = sqpi2 / sqrtx;
      bknu1 = bknu;
      return
    end

    an = - 1.56 + 4.0 / x;
    bn = - 0.29 - 0.22 / x;
    nterms = min ( 15, max ( 3.0, r4_aint ( an + bn * alneps ) ) );

    for inu = 1 : 2

      if ( inu == 1 )
        if ( xnusml < xnu )
          xmu = ( 4.0 * xnu ) * xnu;
        else
          xmu = 0.0;
        end
      else
        xmu = 4.0 * ( abs ( xnu ) + 1.0 )^2;
      end

      a(1) = 1.0 - xmu;
      a(2) = 9.0 - xmu;
      a(3) = 25.0 - xmu;

      if ( a(2) == 0.0 )

        result = sqpi2 * ( 16.0 * x + xmu + 7.0 ) ...
          / ( 16.0 * x * sqrtx );

      else

        alpha(1) = 1.0;
        alpha(2) = ( 16.0 * x + a(2) ) / a(2);
        alpha(3) = ( ( 768.0 * x + 48.0 * a(3) ) * x ...
          + a(2) * a(3) ) / ( a(2) * a(3) );

        beta(1) = 1.0;
        beta(2) = ( 16.0 * x + ( xmu + 7.0 ) ) / a(2);
        beta(3) = ( ( 768.0 * x ...
          + 48.0 * ( xmu + 23.0 ) ) * x ...
          + ( ( xmu + 62.0 ) * xmu + 129.0 ) ) ...
          / ( a(2) * a(3) );

        for i = 4 : nterms

          n = i - 1;
          x2n = 2 * n - 1;

          a(i) = ( x2n + 2.0 )^2 - xmu;
          qq = 16.0 * x2n / a(i);
          p1 = - x2n * ( ( 12 * n * n - 20 * n ) ...
            - a(1) ) / ( ( x2n - 2.0 ) * a(i) ) - qq * x;
          p2 = ( ( 12 * n * n - 28 * n + 8  ) ...
            - a(1) ) / a(i) - qq * x;
          p3 = - x2n * a(i-3) / ( ( x2n - 2.0 ) * a(i) );

          alpha(i) = - p1 * alpha(i-1) ...
                     - p2 * alpha(i-2) ...
                     - p3 * alpha(i-3);

          beta(i) =  - p1 * beta(i-1) ...
                     - p2 * beta(i-2) ...
                     - p3 * beta(i-3);

        end

        result = sqpi2 * beta(nterms) / ( sqrtx * alpha(nterms) );

      end

      if ( inu == 1 )
        bknu = result;
      else
        bknu1 = result;
      end

    end

  end

  return
end

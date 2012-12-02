function [ bknu, bknu1, iswtch ] = r8_knus ( xnu, x )

%*****************************************************************************80
%
%% R8_KNUS computes a sequence of K Bessel functions.
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
%    02 October 2011
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

  aln2 = 0.69314718055994530941723212145818;
  euler = 0.57721566490153286060651209008240;
  sqpi2 = +1.2533141373155002512078826424055;

  if ( isempty ( ntc0k ) )

    c0kcs = [ ...
      +0.60183057242626108387577445180329E-01, ...
      -0.15364871433017286092959755943124, ...
      -0.11751176008210492040068229226213E-01, ...
      -0.85248788891979509827048401550987E-03, ...
      -0.61329838767496791874098176922111E-04, ...
      -0.44052281245510444562679889548505E-05, ...
      -0.31631246728384488192915445892199E-06, ...
      -0.22710719382899588330673771793396E-07, ...
      -0.16305644608077609552274620515360E-08, ...
      -0.11706939299414776568756044043130E-09, ...
      -0.84052063786464437174546593413792E-11, ...
      -0.60346670118979991487096050737198E-12, ...
      -0.43326960335681371952045997366903E-13, ...
      -0.31107358030203546214634697772237E-14, ...
      -0.22334078226736982254486133409840E-15, ...
      -0.16035146716864226300635791528610E-16, ...
      -0.11512717363666556196035697705305E-17, ...
      -0.82657591746836959105169479089258E-19, ...
      -0.59345480806383948172333436695984E-20, ...
      -0.42608138196467143926499613023976E-21, ...
      -0.30591266864812876299263698370542E-22, ...
      -0.21963541426734575224975501815516E-23, ...
      -0.15769113261495836071105750684760E-24, ...
      -0.11321713935950320948757731048056E-25, ...
      -0.81286248834598404082792349714433E-27, ...
      -0.58360900893453226552829349315949E-28, ...
      -0.41901241623610922519452337780905E-29, ...
      -0.30083737960206435069530504212862E-30, ...
      -0.21599152067808647728342168089832E-31 ]';
    znu1cs = [ ...
      +0.203306756994191729674444001216911, ...
      +0.140077933413219771062943670790563, ...
      +0.791679696100161352840972241972320E-02, ...
      +0.339801182532104045352930092205750E-03, ...
      +0.117419756889893366664507228352690E-04, ...
      +0.339357570612261680333825865475121E-06, ...
      +0.842594176976219910194629891264803E-08, ...
      +0.183336677024850089184748150900090E-09, ...
      +0.354969844704416310863007064469557E-11, ...
      +0.619032496469887332205244342078407E-13, ...
      +0.981964535680439424960346115456527E-15, ...
      +0.142851314396490474211473563005985E-16, ...
      +0.191894921887825298966162467488436E-18, ...
      +0.239430979739498914162313140597128E-20, ...
      +0.278890246815347354835870465474995E-22, ...
      +0.304606650633033442582845214092865E-24, ...
      +0.313173237042191815771564260932089E-26, ...
      +0.304133098987854951645174908005034E-28, ...
      +0.279840384636833084343185097659733E-30, ...
      +0.244637186274497596485238794922666E-32 ]';

    eta = 0.1 * r8_mach ( 3 );
    ntc0k = r8_inits ( c0kcs, 29, eta );
    ntznu1 = r8_inits ( znu1cs, 20, eta );
    xnusml = sqrt ( r8_mach ( 3 ) / 8.0 );
    xsml = 0.1 * r8_mach ( 3 );
    alnsml = log ( r8_mach ( 1 ) );
    alnbig = log ( r8_mach ( 2 ) );
    alneps = log ( 0.1 * r8_mach ( 3 ) );
  end

  if ( xnu < 0.0 || 1.0 <= xnu )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_KNUS - Fatal error!\n' );
    fprintf ( 1, '  XNU < 0 or. 1 <= XNU.\n' );
    error ( 'R8_KNUS - Fatal error!' )
  end

  if ( x <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_KNUS - Fatal error!\n' );
    fprintf ( 1, '  X <= 0.\n' );
    error ( 'R8_KNUS - Fatal error!' )
  end

  iswtch = 0;
%
%  X is small.  Compute k-sub-xnu (x) and the derivative of k-sub-xnu (x)
%  then find k-sub-xnu+1 (x).  xnu is reduced to the interval (-0.5,+0.5)
%  then to (0., .5), because k of negative order (-nu) = k of positive
%  order (+nu).
%
  if ( x <= 2.0 )

    if ( xnu <= 0.5 )
      v = xnu;
    else
      v = 1.0 - xnu;
    end
%
%  Carefully find (x/2)^xnu and z^xnu where z = x*x/4.
%
    alnz = 2.0 * ( log ( x ) - aln2 );

    if ( x <= xnu )

      if ( alnbig < - 0.5 * xnu * alnz - aln2 - log ( xnu ) )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'R8_KNUS - Fatal error!\n' );
        fprintf ( 1, '  Small X causing overflow.\n' );
        error ( 'R8_KNUS - Fatal error!' )
      end

    end

    vlnz = v * alnz;
    x2tov = exp ( 0.5 * vlnz );

    if ( vlnz <= alnsml )
      ztov = 0.0;
    else
      ztov = x2tov * x2tov;
    end

    a0 = 0.5 * r8_gamma ( 1.0 + v );
    b0 = 0.5 * r8_gamma ( 1.0 - v );
    c0 = - euler;
    if ( 0.5 <= ztov && xnusml < v )
      c0 = - 0.75 + r8_csevl ( ( 8.0 * v ) * v - 1.0, c0kcs, ntc0k );
    end

    if ( ztov <= 0.5 )
      alpha(1) = ( a0 - ztov * b0 ) / v;
    else
      alpha(1) = c0 - alnz * ( 0.75 + ...
        r8_csevl ( vlnz / 0.35 + 1.0, znu1cs, ntznu1 ) ) * b0;
    end

    beta(1) = - 0.5 * ( a0 + ztov * b0 );

    if ( x <= xsml )
      z = 0.0;
    else
      z = 0.25 * x * x;
    end

    nterms = max ( 2, r8_aint ( 11.0 + ( 8.0 * alnz - 25.19 - alneps ) ...
      / ( 4.28 - alnz ) ) );

    for i = 2 : nterms
      xi = i - 1;
      a0 = a0 / ( xi * ( xi - v ) );
      b0 = b0 / ( xi * ( xi + v ) );
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
%  x is large.  find k-sub-xnu (x) and k-sub-xnu+1 (x) with y. l. luke-s
%  rational expansion.
%
  else

    sqrtx = sqrt ( x );

    if ( 1.0 / xsml < x )
      bknu = sqpi2 / sqrtx;
      bknu1 = bknu;
      return
    end

    an = - 0.60 - 1.02 / x;
    bn = - 0.27 - 0.53 / x;
    nterms = min ( 32, max ( 3, r8_aint ( an + bn * alneps ) ) );

    for inu = 1 : 2

      if ( inu == 1 )
        if ( xnu <= xnusml )
          xmu = 0.0;
        else
          xmu = ( 4.0 * xnu ) * xnu;
        end
      else
        xmu = 4.0 * ( abs ( xnu ) + 1.0 )^2;
      end

      a(1) = 1.0 - xmu;
      a(2) = 9.0 - xmu;
      a(3) = 25.0 - xmu;

      if ( a(2) == 0.0 )

        result = sqpi2 * ( 16.0 * x + xmu + 7.0 ) / ( 16.0 * x * sqrtx );

      else

        alpha(1) = 1.0;
        alpha(2) = ( 16.0 * x + a(2) ) / a(2);
        alpha(3) = ( ( 768.0 * x + 48.0 * a(3) ) * x ...
          + a(2) * a(3) ) / ( a(2) * a(3) );

        beta(1) = 1.0;
        beta(2) = ( 16.0 * x + ( xmu + 7.0 ) ) / a(2);
        beta(3) = ( ( 768.0 * x ...
          + 48.0 * ( xmu + 23.0 ) ) * x + ...
          ( ( xmu + 62.0 ) * xmu + 129.0 ) ) ...
          / ( a(2) * a(3) );

        for i = 4 : nterms

          n = i - 1;
          x2n = 2 * n - 1;

          a(i) = ( x2n + 2.0 )^2 - xmu;
          qq = 16.0 * x2n / a(i);
          p1 = - x2n * ( ( 12 * n * n - 20 * n ) - a(1) ) ...
            / ( ( x2n - 2.0 ) * a(i) ) - qq * x;
          p2 = ( ( 12 * n * n - 28 * n + 8 ) - a(1) ) / a(i) ...
            - qq * x;
          p3 = - x2n * a(i-3) / ( ( x2n - 2.0 ) * a(i));

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

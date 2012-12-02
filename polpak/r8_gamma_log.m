function value = r8_gamma_log ( x )

%*****************************************************************************80
%
%% R8_GAMMA_LOG calculates the natural logarithm of GAMMA ( X ) for positive X.
%
%  Discussion:
%
%    MATLAB supplies the function GAMMALN ( X ) which should be used
%    in preference to this function!
%
%    The program uses rational functions that theoretically approximate
%    LOG(GAMMA(X)) to at least 18 significant decimal digits.  The
%    approximation for 12 < X is from Hart et al, while approximations
%    for X < 12.0D+00 are similar to those in reference Cody and Hillstrom,
%    but are unpublished.
%
%    The accuracy achieved depends on the arithmetic system, the compiler,
%    intrinsic functions, and proper selection of the machine-dependent
%    constants.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 August 2004
%
%  Authors:
%
%    Original FORTRAN77 version by William Cody, Laura Stoltz.
%    MATLAB version by John Burkardt.
%
%  References:
%
%    William Cody, Kenneth Hillstrom,
%    Chebyshev Approximations for the Natural Logarithm of the
%    Gamma Function,
%    Mathematics of Computation,
%    Volume 21, Number 98, April 1967, pages 198-203.
%
%    John Hart, Ward Cheney, Charles Lawson, Hans Maehly,
%    Charles Mesztenyi, John Rice, Henry Thacher,
%    Christoph Witzgall,<br>
%    Computer Approximations,<br>
%    Wiley, 1968,<br>
%    LC: QA297.C64.
%
%  Parameters:
%
%    Input, real X, the argument of the Gamma function.
%    X must be positive.
%
%    Output, real R8_GAMMA_LOG, the logarithm of the Gamma function
%    of X.
%
%  Machine-dependent constants:
%
%    BETA   - radix for the floating-point representation.
%
%    MAXEXP - the smallest positive power of BETA that overflows.
%
%    XBIG   - largest argument for which LN(GAMMA(X)) is representable
%             in the machine, i.e., the solution to the equation
%               LN(GAMMA(XBIG)) = BETA**MAXEXP.
%
%    FRTBIG - Rough estimate of the fourth root of XBIG
%
  c = [ ...
    -1.910444077728E-03, ...
     8.4171387781295E-04, ...
    -5.952379913043012E-04, ...
     7.93650793500350248E-04, ...
    -2.777777777777681622553E-03, ...
     8.333333333333333331554247E-02, ...
     5.7083835261E-03 ];
  d1 = -5.772156649015328605195174E-01;
  d2 = 4.227843350984671393993777E-01;
  d4 = 1.791759469228055000094023E+00;
  frtbig = 1.42E+09;
  p1 = [ ...
    4.945235359296727046734888E+00, ...
    2.018112620856775083915565E+02, ...
    2.290838373831346393026739E+03, ...
    1.131967205903380828685045E+04, ...
    2.855724635671635335736389E+04, ...
    3.848496228443793359990269E+04, ...
    2.637748787624195437963534E+04, ...
    7.225813979700288197698961E+03 ];
  p2 = [ ...
    4.974607845568932035012064E+00, ...
    5.424138599891070494101986E+02, ...
    1.550693864978364947665077E+04, ...
    1.847932904445632425417223E+05, ...
    1.088204769468828767498470E+06, ...
    3.338152967987029735917223E+06, ...
    5.106661678927352456275255E+06, ...
    3.074109054850539556250927E+06 ];
  p4 = [ ...
    1.474502166059939948905062E+04, ...
    2.426813369486704502836312E+06, ...
    1.214755574045093227939592E+08, ...
    2.663432449630976949898078E+09, ...
    2.940378956634553899906876E+10, ...
    1.702665737765398868392998E+11, ...
    4.926125793377430887588120E+11, ...
    5.606251856223951465078242E+11 ];
  pnt68 = 0.6796875E+00;
  q1 = [ ...
    6.748212550303777196073036E+01, ...
    1.113332393857199323513008E+03, ...
    7.738757056935398733233834E+03, ...
    2.763987074403340708898585E+04, ...
    5.499310206226157329794414E+04, ...
    6.161122180066002127833352E+04, ...
    3.635127591501940507276287E+04, ...
    8.785536302431013170870835E+03 ];
  q2 = [ ...
    1.830328399370592604055942E+02, ...
    7.765049321445005871323047E+03, ...
    1.331903827966074194402448E+05, ...
    1.136705821321969608938755E+06, ...
    5.267964117437946917577538E+06, ...
    1.346701454311101692290052E+07, ...
    1.782736530353274213975932E+07, ...
    9.533095591844353613395747E+06 ];
  q4 = [ ...
    2.690530175870899333379843E+03, ...
    6.393885654300092398984238E+05, ...
    4.135599930241388052042842E+07, ...
    1.120872109616147941376570E+09, ...
    1.488613728678813811542398E+10, ...
    1.016803586272438228077304E+11, ...
    3.417476345507377132798597E+11, ...
    4.463158187419713286462081E+11 ];
  sqrtpi = 0.9189385332046727417803297E+00;
  xbig = 4.08E+36;
%
%  Return immediately if the argument is out of range.
%
  if ( x <= 0.0 || xbig < x )
    value = Inf;
    return
  end

  if ( x <= eps )

    res = -log ( x );

  elseif ( x <= 1.5 )

    if ( x < pnt68 )
      corr = -log ( x );
      xm1 = x;
    else
      corr = 0.0;
      xm1 = ( x - 0.5 ) - 0.5;
    end

    if ( x <= 0.5 || pnt68 <= x )

      xden = 1.0;
      xnum = 0.0;

      for i = 1 : 8
        xnum = xnum * xm1 + p1(i);
        xden = xden * xm1 + q1(i);
      end

      res = corr + ( xm1 * ( d1 + xm1 * ( xnum / xden ) ) );

    else

      xm2 = ( x - 0.5 ) - 0.5;
      xden = 1.0;
      xnum = 0.0;
      for i = 1 : 8
        xnum = xnum * xm2 + p2(i);
        xden = xden * xm2 + q2(i);
      end

      res = corr + xm2 * ( d2 + xm2 * ( xnum / xden ) );

    end

  elseif ( x <= 4.0 )

    xm2 = x - 2.0;
    xden = 1.0;
    xnum = 0.0;
    for i = 1 : 8
      xnum = xnum * xm2 + p2(i);
      xden = xden * xm2 + q2(i);
    end

    res = xm2 * ( d2 + xm2 * ( xnum / xden ) );

  elseif ( x <= 12.0 )

    xm4 = x - 4.0;
    xden = -1.0;
    xnum = 0.0;
    for i = 1 : 8
      xnum = xnum * xm4 + p4(i);
      xden = xden * xm4 + q4(i);
    end

    res = d4 + xm4 * ( xnum / xden );

  else

    res = 0.0;

    if ( x <= frtbig )

      res = c(7);
      xsq = x * x;

      for i = 1 : 6
        res = res / xsq + c(i);
      end

    end

    res = res / x;
    corr = log ( x );
    res = res + sqrtpi - 0.5 * corr;
    res = res + x * ( corr - 1.0 );

  end

  value = res;

  return
end

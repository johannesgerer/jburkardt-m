function value = r8_poch1 ( a, x )

%*****************************************************************************80
%
%% R8_POCH1 evaluates a quantity related to Pochhammer's symbol.
%
%  Discussion:
%
%    Evaluate a generalization of Pochhammer's symbol for special
%    situations that require especially accurate values when x is small in
%      poch1(a,x) = (poch(a,x)-1)/x
%                 = (gamma(a+x)/gamma(a) - 1.0)/x .
%    This specification is particularly suited for stably computing
%    expressions such as
%      (gamma(a+x)/gamma(a) - gamma(b+x)/gamma(b))/x
%           = poch1(a,x) - poch1(b,x)
%    Note that poch1(a,0.0) = psi(a)
%
%    When abs ( x ) is so small that substantial cancellation will occur if
%    the straightforward formula is used, we  use an expansion due
%    to fields and discussed by y. l. luke, the special functions and their
%    approximations, vol. 1, academic press, 1969, page 34.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 October 2011
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
%    Input, real A, the parameter.
%
%    Input, real X, the evaluation point.
%
%    Output, real VALUE, the value of the function.
%
  persistent alneps
  persistent bern
  persistent sqtbig

  if ( isempty ( sqtbig ) )

    bern = [ ...
      +0.833333333333333333333333333333333E-01, ...
      -0.138888888888888888888888888888888E-02, ...
      +0.330687830687830687830687830687830E-04, ...
      -0.826719576719576719576719576719576E-06, ...
      +0.208767569878680989792100903212014E-07, ...
      -0.528419013868749318484768220217955E-09, ...
      +0.133825365306846788328269809751291E-10, ...
      -0.338968029632258286683019539124944E-12, ...
      +0.858606205627784456413590545042562E-14, ...
      -0.217486869855806187304151642386591E-15, ...
      +0.550900282836022951520265260890225E-17, ...
      -0.139544646858125233407076862640635E-18, ...
      +0.353470703962946747169322997780379E-20, ...
      -0.895351742703754685040261131811274E-22, ...
      +0.226795245233768306031095073886816E-23, ...
      -0.574472439520264523834847971943400E-24, ...
      +0.145517247561486490186626486727132E-26, ...
      -0.368599494066531017818178247990866E-28, ...
      +0.933673425709504467203255515278562E-30, ...
      -0.236502241570062993455963519636983E-31 ]';

    sqtbig = 1.0 / sqrt ( 24.0 * r8_mach ( 1 ) );
    alneps = log ( r8_mach ( 3 ) );

  end

  if ( x == 0.0 )
    value = r8_psi ( a );
    return
  end

  absx = abs ( x );
  absa = abs ( a );

  if ( 0.1 * absa < absx || 0.1 < absx * log ( max ( absa, 2.0 ) ) );
    value = r8_poch ( a, x );
    value = ( value - 1.0 ) / x;
    return
  end

  if ( a < - 0.5 )
    bp = 1.0 - a - x;
  else
    bp = a;
  end

  if ( bp < 10.0 )
    incr = r8_aint ( 11.0 - bp );
  else
    incr = 0;
  end

  b = bp + incr;

  var = b + 0.5 * ( x - 1.0 );
  alnvar = log ( var );
  q = x * alnvar;

  poly1 = 0.0;

  if ( var < sqtbig )

    var2 = 1.0 / var / var;

    rho = 0.5 * ( x + 1.0 );
    gbern(1) = 1.0;
    gbern(2) = - rho / 12.0;
    term = var2;
    poly1 = gbern(2) * term;

    nterms = r8_aint ( - 0.5 * alneps / alnvar + 1.0 );

    if ( 20 < nterms )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'R8_POCH1 - Fatal error!\n' );
      fprintf ( 1, ' 20 < NTERMS.\n' );
      error ( 'R8_POCH1 - Fatal error!' )
    end

    for k = 2 : nterms
      gbk = 0.0;
      for j = 1 : k
        ndx = k - j + 1;
        gbk = gbk + bern(ndx) * gbern(j);
      end
      gbern(k+1) = - rho * gbk / k;
      term = term * ( 2 * k - 2 - x ) * ( 2 * k - 1 - x ) * var2;
      poly1 = poly1 + gbern(k+1) * term;
    end

  end

  poly1 = ( x - 1.0 ) * poly1;
  value = r8_exprel ( q ) * ( alnvar + q * poly1 ) + poly1;
%
%  we have value(b,x), but bp is small, so we use backwards recursion
%  to obtain value(bp,x).
%
  for ii = 1 : incr
    i = incr - ii;
    binv = 1.0 / ( bp + i );
    value = ( value - binv ) / ( 1.0 + x * binv );
  end

  if ( bp == a )
    return
  end
%
%  we have value(bp,x), but a is lt -0.5.  We therefore use a reflection
%  formula to obtain value(a,x).
%
  sinpxx = sin ( pi * x ) / x;
  sinpx2 = sin ( 0.5 * pi * x );
  trig = sinpxx * r8_cot ( pi * b ) - 2.0 * sinpx2 * ( sinpx2 / x );

  value = trig + ( 1.0 + x * trig ) * value;

  return
end

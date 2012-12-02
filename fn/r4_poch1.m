function value = r4_poch1 ( a, x )

%*****************************************************************************80
%
%% R4_POCH1 evaluates a quantity related to Pochhammer's symbol.
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
       0.83333333333333333E-01, ...
      -0.13888888888888889E-02, ...
       0.33068783068783069E-04, ...
      -0.82671957671957672E-06, ...
       0.20876756987868099E-07, ...
      -0.52841901386874932E-09, ...
       0.13382536530684679E-10, ...
      -0.33896802963225829E-12, ...
       0.85860620562778446E-14 ]';

    sqtbig = 1.0 / sqrt ( 24.0 * r4_mach ( 1 ) );
    alneps = log ( r4_mach ( 3 ) );

  end

  if ( x == 0.0 )
    value = r4_psi ( a );
    return
  end

  absx = abs ( x );
  absa = abs ( a );

  if ( 0.1 * absa < absx || 0.1 < absx * log ( max ( absa, 2.0 ) ) )
    value = r4_poch ( a, x );
    value = ( value - 1.0 ) / x;
    return
  end

  if ( a < - 0.5 )
    bp = 1.0 - a - x;
  else
    bp = a;
  end

  if ( bp < 10.0 )
    incr = r4_aint ( 11.0 - bp );
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

    nterms = r4_aint ( - 0.5 * alneps / alnvar + 1.0 );

    if ( 9 < nterms )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'R4_POCH1 - Fatal error!\n' );
      fprintf ( 1, '  9 < NTERMS.\n');
      error ( 'R4_POCH1 - Fatal error!' )
    end

    for k = 2 : nterms
      gbk = 0.0;
      for j = 1 : k
        ndx = k - j + 1;
        gbk = gbk + bern(ndx) * gbern(j);
      end
      gbern(k+1) = - rho * gbk / k;
      term = term * ( 2 * k - 2 - x ) ...
        * ( 2 * k - 1 - x ) * var2;
      poly1 = poly1 + gbern(k+1) * term;
    end

  end

  poly1 = ( x - 1.0 ) * poly1;
  value = r4_exprel ( q ) * ( alnvar + q * poly1 ) + poly1;
%
%  We have poch1(b,x).  but bp is small, so we use backwards recursion
%  to obtain poch1(bp,x).
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
%  We have poch1(bp,x), but a is lt -0.5.  We therefore use a reflection
%  formula to obtain poch1(a,x).
%
  sinpxx = sin ( pi * x ) / x;
  sinpx2 = sin ( 0.5 * pi * x );
  trig = sinpxx * r4_cot ( pi * b ) - 2.0 * sinpx2 * ( sinpx2 / x );

  value = trig + ( 1.0 + x * trig ) * value;

  return
end

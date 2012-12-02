function value = r8_poch ( a, x )

%*****************************************************************************80
%
%% R8_POCH evaluates Pochhammer's function of R8 arguments.
%
%  Discussion:
%
%    POCH ( A, X ) = Gamma ( A + X ) / Gamma ( A ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 October 2011
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
%    Input, real A, X, the arguments.
%
%    Output, real VALUE, the Pochhammer function of A and X.
%
  persistent eps
  persistent sqeps

  if ( isempty ( eps ) )
    eps = r8_mach ( 4 );
    sqeps = sqrt ( eps );
  end

  ax = a + x;

  if ( ax <= 0.0 && r8_aint ( ax ) == ax )

    if ( 0.0 < a || r8_aint ( a ) ~= a )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'R8_POCH - Fatal error!\n' );
      fprintf ( 1, '  A + X is nonpositive integer,\n' );
      fprintf ( 1, '  but A is not.\n' );
      error ( 'R8_POCH - Fatal error!' )
    end
%
%  We know here that both A+X and A are non-positive integers.
%
    if ( x == 0.0 )
      value = 1.0;
    elseif ( - 20.0 < min ( a + x, a ) )
      n = r8_aint ( x );
      ia = r8_aint ( a );
      value = r8_mop ( n ) * r8_fac ( - ia ) / r8_fac ( - ia - n );
    else
      n = r8_aint ( x );
      value = r8_mop ( n ) * exp ( ( a - 0.5 ) ...
        * r8_lnrel ( x / ( a - 1.0 ) ) ...
        + x * log ( - a + 1.0 - x ) - x ...
        + r8_lgmc ( - a + 1.0 ) ...
        - r8_lgmc ( - a - x + 1.0 ) );
    end

    return

  end
%
%  A + X is not zero or a negative integer.
%
  if ( a <= 0.0 && r8_aint ( a ) == a )
    value = 0.0;
    return
  end

  n = abs ( r8_aint ( x ) );
%
%  X is a small non-positive integer, presummably a common case.
%
  if ( n == x && n <= 20 )
    value = 1.0;
    for i = 1 : n
      value = value * ( a + ( i - 1 ) );
    end
    return
  end

  absax = abs ( a + x );
  absa = abs ( a );

  if ( max ( absax, absa ) <= 20.0 )
    value = r8_gamma ( a + x ) * r8_gamr ( a );
    return
  end

  if ( 0.5 * absa < abs ( x ) )
    [ alngax, sgngax ] = r8_lgams ( a + x );
    [ alnga, sgnga ] = r8_lgams ( a );
    value = sgngax * sgnga * exp ( alngax - alnga );
    return
  end
%
%  abs(x) is small and both abs(a+x) and abs(a) are large.  thus,
%  a+x and a must have the same sign.  for negative a, we use
%  gamma(a+x)/gamma(a) = gamma(-a+1)/gamma(-a-x+1) *
%  sin(pi*a)/sin(pi*(a+x))
%
  if ( a < 0.0 )
    b = - a - x + 1.0;
  else
    b = a;
  end

  value = exp ( ( b - 0.5 ) * r8_lnrel ( x / b ) ...
    + x * log ( b + x ) - x + r8_lgmc ( b + x ) - r8_lgmc ( b ) );

  if ( 0.0 <= a || value == 0.0 )
    return
  end

  cospix = cos ( pi * x );
  sinpix = sin ( pi * x );
  cospia = cos ( pi * a );
  sinpia = sin ( pi * a );

  errpch = abs ( x ) * ( 1.0 + log ( b ) );
  den = cospix + cospia * sinpix / sinpia;
  err = ( abs ( x ) * ( abs ( sinpix ) ...
    + abs ( cospia * cospix / sinpia ) ) ...
    + abs ( a * sinpix ) / sinpia / sinpia ) * pi;
  err = errpch + err / abs ( den );

  value = value / den;

  return
end

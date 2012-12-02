function value = r8_gamic ( a, x )

%*****************************************************************************80
%
%% R8_GAMIC evaluates the complementary incomplete gamma function.
%
%  Discussion:
%
%    GAMIC = integral ( x <= t < oo ) exp(-t) * t^(a-1) dt
%
%    GAMIC is evaluated for arbitrary real values of A and non-negative
%    values X (even though GAMIC is defined for X < 0.0), except that
%    for X = 0 and A <= 0.0, GAMIC is undefined.
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
%    Walter Gautschi,
%    A Computational Procedure for Incomplete Gamma Functions,
%    ACM Transactions on Mathematical Software,
%    Volume 5, Number 4, December 1979, pages 466-481.
%
%  Parameters:
%
%    Input, real A, the parameter.
%
%    Input, real X, the evaluation point.
%
%    Output, real VALUE, the value of the incomplete gamma function.
%
  persistent alneps
  persistent bot
  persistent eps
  persistent sqeps

  if ( isempty ( eps ) )
    eps = 0.5 * r8_mach ( 3 );
    sqeps = sqrt ( r8_mach ( 4 ) );
    alneps = - log ( r8_mach ( 3 ) );
    bot = log ( r8_mach ( 1 ) );
  end

  if ( x < 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_GAMIC - Fatal error!\n' );
    fprintf ( 1, '  X < 0.\n' );
    error ( 'R8_GAMIC - Fatal error!' )
  end

  if ( x == 0.0 )

    if ( a <= 0.0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'R8_GAMIC - Fatal error!\n' );
      fprintf ( 1, '  X = 0 and A <= 0.\n' );
      error ( 'R8_GAMIC - Fatal error!' )
    end

    value = exp ( r8_lngam ( a + 1.0 ) - log ( a ) );

    return
  end

  alx = log ( x );
  if ( a < 0.0 )
    sga = - 1.0;
  else
    sga = + 1.0;
  end

  ainta = r8_aint ( a + 0.5 * sga );
  aeps = a - ainta;

  izero = 0;

  if ( x < 1.0 )

    if ( a <= 0.5 && abs ( aeps ) <= 0.001 )

      if ( - ainta <= 1.0 )
        e = 2.0;
      else
        e = 2.0 * ( - ainta + 2.0 ) / ( ainta * ainta - 1.0 );
      end

      e = e - alx * x^( - 0.001 );

      if ( e * abs ( aeps ) <= eps )
        value = r8_gmic ( a, x, alx );
        return
      end

    end

    [ algap1, sgngam ] = r8_lgams ( a + 1.0 );
    gstar = r8_gmit ( a, x, algap1, sgngam, alx );

    if ( gstar == 0.0 )
      izero = 1;
    else
      alngs = log ( abs ( gstar ) );
      sgngs = r8_sign ( gstar );
    end

  else

    if ( a < x )
      value = exp ( r8_lgic ( a, x, alx ) );
      return
    end

    sgngam = 1.0;
    algap1 = r8_lngam ( a + 1.0 );
    sgngs = 1.0;
    alngs = r8_lgit ( a, x, algap1 );

  end

  h = 1.0;

  if ( izero ~= 1 )

    t = a * alx + alngs;

    if ( alneps < t )
      sgng = - sgngs * sga * sgngam;
      t = t + algap1 - log ( abs ( a ) );
      value = sgng * exp ( t );
      return
    end

    if ( - alneps < t )
      h = 1.0 - sgngs * exp ( t );
    end

  end

  sgng = r8_sign ( h ) * sga * sgngam;
  t = log ( abs ( h ) ) + algap1 - log ( abs ( a ) );
  value = sgng * exp ( t );

  return
end
